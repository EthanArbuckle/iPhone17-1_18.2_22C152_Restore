@interface BMManagedObjectConverter
- (id)convertItemMOs:(id)a3 error:(id *)a4;
- (id)convertRuleMOs:(id)a3 basketCount:(unint64_t)a4 error:(id *)a5;
- (id)insertItems:(id)a3 inManagedObjectContext:(id)a4;
- (id)insertRules:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation BMManagedObjectConverter

- (id)convertRuleMOs:(id)a3 basketCount:(unint64_t)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v7;
  uint64_t v26 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v31;
    v22 = a5;
    while (2)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v11 = [v10 antecedent];
        id v29 = 0;
        v12 = [(BMManagedObjectConverter *)self convertItemMOs:v11 error:&v29];
        id v13 = v29;

        if (v13) {
          goto LABEL_13;
        }
        v14 = [v10 consequent];
        id v28 = 0;
        v15 = [(BMManagedObjectConverter *)self convertItemMOs:v14 error:&v28];
        id v13 = v28;

        if (v13)
        {

LABEL_13:
          a5 = v22;
          goto LABEL_14;
        }
        v27 = [BMRule alloc];
        [v10 support];
        double v17 = v16;
        [v10 confidence];
        v19 = -[BMRule initWithAntecedent:consequent:support:confidence:basketCount:absoluteSupport:absoluteAntecedentSupport:absoluteConsequentSupport:uniqueDaysLastWeek:uniqueDaysTotal:](v27, "initWithAntecedent:consequent:support:confidence:basketCount:absoluteSupport:absoluteAntecedentSupport:absoluteConsequentSupport:uniqueDaysLastWeek:uniqueDaysTotal:", v12, v15, a4, [v10 absoluteSupport], objc_msgSend(v10, "absoluteConsequentSupport"), objc_msgSend(v10, "absoluteConsequentSupport"), v17, v18, objc_msgSend(v10, "uniqueDaysLastWeek"), objc_msgSend(v10, "uniqueDaysTotal"));
        [v8 addObject:v19];
      }
      id v13 = 0;
      a5 = v22;
      uint64_t v26 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v13 = 0;
  }
LABEL_14:

  if (a5) {
    *a5 = v13;
  }
  if (v13)
  {
    v20 = 0;
  }
  else
  {
    v20 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
  }

  return v20;
}

- (id)convertItemMOs:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
  v6 = +[BMItemType allItemTypesDictionary];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = 0;
    uint64_t v10 = *(void *)v33;
    uint64_t v29 = *MEMORY[0x263F08320];
    do
    {
      uint64_t v11 = 0;
      uint64_t v30 = v8;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v32 + 1) + 8 * v11);
        id v13 = [v12 typeIdentifier];
        v14 = [v6 objectForKeyedSubscript:v13];

        if (v14)
        {
          v15 = [BMItem alloc];
          double v16 = [v12 normalizedValue];
          double v17 = [(BMItem *)v15 initWithType:v14 normalizedValue:v16];

          [v5 addObject:v17];
        }
        else
        {
          double v18 = (void *)MEMORY[0x263F087E8];
          uint64_t v36 = v29;
          uint64_t v19 = v10;
          v20 = v6;
          v21 = v5;
          v22 = NSString;
          double v17 = [v12 typeIdentifier];
          v23 = [v22 stringWithFormat:@"%@ is not a registered type. See +[BMItemType allItemTypes] for possible values.", v17];
          v37 = v23;
          v24 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          uint64_t v25 = [v18 errorWithDomain:@"com.apple.BehaviorMiner" code:0 userInfo:v24];

          v5 = v21;
          v6 = v20;
          uint64_t v10 = v19;
          uint64_t v8 = v30;
          v9 = (void *)v25;
        }

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (a4) {
    *a4 = v9;
  }
  if (v9)
  {
    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v26 = [MEMORY[0x263EFFA08] setWithSet:v5];
  }

  return v26;
}

- (id)insertRules:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v14 = [[BMRuleMO alloc] initWithContext:v7];
        v15 = [v13 antecedent];
        double v16 = [(BMManagedObjectConverter *)self insertItems:v15 inManagedObjectContext:v7];
        [(BMRuleMO *)v14 setAntecedent:v16];

        double v17 = [v13 consequent];
        double v18 = [(BMManagedObjectConverter *)self insertItems:v17 inManagedObjectContext:v7];
        [(BMRuleMO *)v14 setConsequent:v18];

        [v13 support];
        -[BMRuleMO setSupport:](v14, "setSupport:");
        [v13 confidence];
        -[BMRuleMO setConfidence:](v14, "setConfidence:");
        -[BMRuleMO setAbsoluteSupport:](v14, "setAbsoluteSupport:", [v13 absoluteSupport]);
        -[BMRuleMO setAbsoluteAntecedentSupport:](v14, "setAbsoluteAntecedentSupport:", [v13 absoluteConsequentSupport]);
        -[BMRuleMO setAbsoluteConsequentSupport:](v14, "setAbsoluteConsequentSupport:", [v13 absoluteConsequentSupport]);
        -[BMRuleMO setUniqueDaysLastWeek:](v14, "setUniqueDaysLastWeek:", [v13 uniqueDaysLastWeek]);
        -[BMRuleMO setUniqueDaysTotal:](v14, "setUniqueDaysTotal:", [v13 uniqueDaysTotal]);
        [v8 addObject:v14];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];

  return v19;
}

- (id)insertItems:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v13 = [[BMItemMO alloc] initWithContext:v6];
        v14 = [v12 type];
        v15 = [v14 identifier];
        [(BMItemMO *)v13 setTypeIdentifier:v15];

        double v16 = [v12 normalizedValue];
        [(BMItemMO *)v13 setNormalizedValue:v16];

        double v17 = [v12 uniformIdentifier];
        [(BMItemMO *)v13 setUniformIdentifier:v17];

        [v7 addObject:v13];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  double v18 = [MEMORY[0x263EFFA08] setWithSet:v7];

  return v18;
}

@end