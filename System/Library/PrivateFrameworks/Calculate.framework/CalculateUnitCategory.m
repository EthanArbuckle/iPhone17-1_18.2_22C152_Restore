@interface CalculateUnitCategory
+ (id)categoryWithTypeInfo:(id)a3 unitsInfo:(id)a4 collection:(id)a5;
- (BOOL)contains:(id)a3;
- (CalculateUnit)preferredFromUnit;
- (CalculateUnit)preferredToUnit;
- (CalculateUnitCategory)initWithTypeInfo:(id)a3 unitsInfo:(id)a4 collection:(id)a5;
- (CalculateUnitCollection)collection;
- (NSArray)units;
- (NSString)displayName;
- (NSString)name;
- (UnitTypeInfo)typeInfo;
- (id)findUnitWithName:(id)a3;
- (id)findUnitsWithQuery:(id)a3;
- (id)locale;
- (id)preferredUnits;
- (unint64_t)unitType;
- (void)_findPreferredSIUnit:(id *)a3 metric:(id *)a4 US:(id *)a5 UK:(id *)a6;
- (void)setCollection:(id)a3;
- (void)setTypeInfo:(id)a3;
- (void)setUnits:(id)a3;
@end

@implementation CalculateUnitCategory

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collection);
  objc_storeStrong((id *)&self->_typeInfo, 0);
  objc_storeStrong((id *)&self->_units, 0);
}

- (void)setCollection:(id)a3
{
}

- (CalculateUnitCollection)collection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collection);
  return (CalculateUnitCollection *)WeakRetained;
}

- (void)setTypeInfo:(id)a3
{
}

- (UnitTypeInfo)typeInfo
{
  return self->_typeInfo;
}

- (void)setUnits:(id)a3
{
}

- (NSArray)units
{
  return self->_units;
}

- (CalculateUnitCategory)initWithTypeInfo:(id)a3 unitsInfo:(id)a4 collection:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CalculateUnitCategory;
  v11 = [(CalculateUnitCategory *)&v26 init];
  v12 = v11;
  if (v11)
  {
    id v21 = v10;
    [(CalculateUnitCategory *)v11 setCollection:v10];
    [(CalculateUnitCategory *)v12 setTypeInfo:v8];
    v13 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v14 = [v8 units];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = +[CalculateUnit unitWithID:unitsInfo:exponent:](CalculateUnit, "unitWithID:unitsInfo:exponent:", [*(id *)(*((void *)&v22 + 1) + 8 * v18) unitID], v9, 1);
          [v19 setCategory:v12];
          [v13 addObject:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v16);
    }

    [(CalculateUnitCategory *)v12 setUnits:v13];
    id v10 = v21;
  }

  return v12;
}

- (id)findUnitsWithQuery:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(CalculateUnitCategory *)self units];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 contains:v4]) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)findUnitWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(CalculateUnitCategory *)self units];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 name];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)contains:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = [v4 decomposedStringWithCanonicalMapping];

    id v6 = [(CalculateUnitCategory *)self displayName];
    BOOL v7 = [v6 rangeOfString:v5 options:129] != 0x7FFFFFFFFFFFFFFFLL;

    id v4 = (id)v5;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (CalculateUnit)preferredToUnit
{
  v2 = [(CalculateUnitCategory *)self preferredUnits];
  v3 = [v2 objectAtIndexedSubscript:1];

  return (CalculateUnit *)v3;
}

- (CalculateUnit)preferredFromUnit
{
  v2 = [(CalculateUnitCategory *)self preferredUnits];
  v3 = [v2 objectAtIndexedSubscript:0];

  return (CalculateUnit *)v3;
}

- (id)preferredUnits
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [(CalculateUnitCategory *)self locale];
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F1C440]];
  uint64_t v5 = objc_opt_new();
  if ([(CalculateUnitCategory *)self unitType] != 16)
  {
    id v37 = 0;
    id v38 = 0;
    id v35 = 0;
    id v36 = 0;
    [(CalculateUnitCategory *)self _findPreferredSIUnit:&v38 metric:&v37 US:&v36 UK:&v35];
    id v6 = v38;
    id v23 = v37;
    id v24 = v36;
    id v10 = v35;
    if (v6) {
      [v5 addObject:v6];
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F1C450]])
    {
      if (v10) {
        [v5 addObject:v10];
      }
      if (v23) {
        [v5 addObject:v23];
      }
      id v26 = v24;
      if (!v24) {
        goto LABEL_50;
      }
      goto LABEL_48;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F1C448]])
    {
      if (v23) {
        [v5 addObject:v23];
      }
      if (v24)
      {
        v27 = v5;
        id v28 = v24;
LABEL_46:
        [v27 addObject:v28];
      }
    }
    else
    {
      if (v24) {
        [v5 addObject:v24];
      }
      if (v23)
      {
        v27 = v5;
        id v28 = v23;
        goto LABEL_46;
      }
    }
    id v26 = v10;
    if (!v10) {
      goto LABEL_50;
    }
LABEL_48:
    long long v25 = v5;
    goto LABEL_49;
  }
  id v6 = [v3 currencyCode];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  BOOL v7 = [(CalculateUnitCategory *)self units];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v8)
  {

    [v4 isEqualToString:*MEMORY[0x1E4F1C458]];
    id v10 = 0;
    id v24 = 0;
    id v23 = 0;
    goto LABEL_50;
  }
  uint64_t v9 = v8;
  v30 = v4;
  v31 = v5;
  v32 = v3;
  v33 = 0;
  v34 = 0;
  id v10 = 0;
  uint64_t v11 = *(void *)v40;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v40 != v11) {
        objc_enumerationMutation(v7);
      }
      long long v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      if (v6
        && ([*(id *)(*((void *)&v39 + 1) + 8 * i) name],
            long long v14 = objc_claimAutoreleasedReturnValue(),
            char v15 = [v14 isEqualToString:v6],
            v14,
            (v15 & 1) != 0))
      {
        long long v16 = v33;
        id v17 = v10;
        v33 = v13;
      }
      else
      {
        uint64_t v18 = [v13 name];
        char v19 = [v18 isEqualToString:@"EUR"];

        if (v19)
        {
          long long v16 = v34;
          v34 = v13;
          id v17 = v10;
        }
        else
        {
          v20 = [v13 name];
          int v21 = [v20 isEqualToString:@"USD"];

          long long v16 = v10;
          id v17 = v13;
          if (!v21) {
            continue;
          }
        }
      }
      id v22 = v13;

      id v10 = v17;
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
  }
  while (v9);

  uint64_t v5 = v31;
  id v23 = v33;
  if (v33) {
    [v31 addObject:v33];
  }
  id v4 = v30;
  v3 = v32;
  id v24 = v34;
  if (([v30 isEqualToString:*MEMORY[0x1E4F1C458]] & 1) == 0)
  {
    if (v34) {
      [v31 addObject:v34];
    }
    if (!v10) {
      goto LABEL_50;
    }
    long long v25 = v31;
    id v26 = v10;
LABEL_49:
    [v25 addObject:v26];
    goto LABEL_50;
  }
  if (v10) {
    [v31 addObject:v10];
  }
  if (v34)
  {
    long long v25 = v31;
    id v26 = v34;
    goto LABEL_49;
  }
LABEL_50:

  return v5;
}

- (void)_findPreferredSIUnit:(id *)a3 metric:(id *)a4 US:(id *)a5 UK:(id *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v9 = [(CalculateUnitCategory *)self units];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    int v12 = 0;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v9);
        }
        char v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ([v15 isPreferredUnit])
        {
          long long v16 = [v15 unitInfo];
          uint64_t v17 = [v16 measurementSystem];

          if (!v17) {
            ++v12;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v11);
  }
  else
  {
    int v12 = 0;
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v18 = [(CalculateUnitCategory *)self units];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        if ([v23 isPreferredUnit])
        {
          if (v12 < 2 || (id v24 = a4, [v23 isBaseUnit]))
          {
            long long v25 = [v23 unitInfo];
            uint64_t v26 = [v25 measurementSystem];

            id v24 = a3;
            switch(v26)
            {
              case 0:
                goto LABEL_25;
              case 1:
                id v24 = a4;
                goto LABEL_25;
              case 2:
                id v24 = a5;
                goto LABEL_25;
              case 3:
                id v24 = a6;
                goto LABEL_25;
              default:
                continue;
            }
          }
          else
          {
LABEL_25:
            *id v24 = v23;
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v20);
  }
}

- (NSString)displayName
{
  v3 = [(CalculateUnitCategory *)self name];
  id v4 = [(CalculateUnitCategory *)self locale];
  uint64_t v5 = +[Localize localizationForLocale:v4];
  id v6 = +[Localize localizedStringForKey:v3 value:0 table:@"Localizable" localization:v5];

  return (NSString *)v6;
}

- (id)locale
{
  v2 = [(CalculateUnitCategory *)self collection];
  v3 = [v2 locales];
  id v4 = [v3 firstObject];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[Localize systemLocale];
  }
  BOOL v7 = v6;

  return v7;
}

- (NSString)name
{
  v2 = [(CalculateUnitCategory *)self typeInfo];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (unint64_t)unitType
{
  v2 = [(CalculateUnitCategory *)self name];
  v3 = [&unk_1F1872E28 objectForKeyedSubscript:v2];
  unint64_t v4 = (int)[v3 intValue];

  return v4;
}

+ (id)categoryWithTypeInfo:(id)a3 unitsInfo:(id)a4 collection:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[CalculateUnitCategory alloc] initWithTypeInfo:v9 unitsInfo:v8 collection:v7];

  return v10;
}

@end