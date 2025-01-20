@interface PUPickerCompoundFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsAlbums;
- (BOOL)containsFilter:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidFilter;
- (NSArray)subfilters;
- (PUPickerCompoundFilter)initWithCoder:(id)a3;
- (PUPickerCompoundFilter)initWithFilterType:(int64_t)a3 subfilters:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)generatedAssetPredicate;
- (int64_t)filterType;
- (unint64_t)generatedPossibleAssetTypes;
- (unint64_t)generatedRequiredAssetTypes;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUPickerCompoundFilter

- (void).cxx_destruct
{
}

- (NSArray)subfilters
{
  return self->_subfilters;
}

- (int64_t)filterType
{
  return self->_filterType;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithInteger:", -[PUPickerCompoundFilter filterType](self, "filterType"));
  [v5 encodeObject:v6 forKey:@"PUPickerCompoundFilterDictionaryFilterTypeKey"];

  id v7 = [(PUPickerCompoundFilter *)self subfilters];
  [v5 encodeObject:v7 forKey:@"PUPickerCompoundFilterDictionarySubfiltersKey"];
}

- (PUPickerCompoundFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUPickerCompoundFilter;
  id v5 = [(PUPickerCompoundFilter *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PUPickerCompoundFilterDictionaryFilterTypeKey"];
    v5->_filterType = [v6 integerValue];

    id v7 = PUPickerFilterAvailableClasses();
    v8 = [v7 setByAddingObject:objc_opt_class()];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"PUPickerCompoundFilterDictionarySubfiltersKey"];
    subfilters = v5->_subfilters;
    v5->_subfilters = (NSArray *)v9;
  }
  if ([(PUPickerCompoundFilter *)v5 isValidFilter]) {
    v11 = v5;
  }
  else {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(MEMORY[0x263EFF8C0]);
  id v5 = [(PUPickerCompoundFilter *)self subfilters];
  v6 = (void *)[v4 initWithArray:v5 copyItems:1];

  id v7 = [[PUPickerCompoundFilter alloc] initWithFilterType:[(PUPickerCompoundFilter *)self filterType] subfilters:v6];
  return v7;
}

- (unint64_t)generatedRequiredAssetTypes
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  int64_t v3 = [(PUPickerCompoundFilter *)self filterType];
  switch(v3)
  {
    case 2:
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v4 = [(PUPickerCompoundFilter *)self subfilters];
      uint64_t v10 = [v4 countByEnumeratingWithState:&v20 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        int v12 = 0;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v4);
            }
            v12 |= [*(id *)(*((void *)&v20 + 1) + 8 * i) generatedPossibleAssetTypes];
          }
          uint64_t v11 = [v4 countByEnumeratingWithState:&v20 objects:v32 count:16];
        }
        while (v11);
        unint64_t v7 = ~v12 & 0x1FFFELL;
        goto LABEL_31;
      }
LABEL_29:
      unint64_t v7 = 131070;
LABEL_31:

      return v7;
    case 1:
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v4 = [(PUPickerCompoundFilter *)self subfilters];
      uint64_t v15 = [v4 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v25;
        unint64_t v7 = 131070;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v4);
            }
            v7 &= [*(id *)(*((void *)&v24 + 1) + 8 * j) generatedRequiredAssetTypes];
          }
          uint64_t v16 = [v4 countByEnumeratingWithState:&v24 objects:v33 count:16];
        }
        while (v16);
        goto LABEL_31;
      }
      goto LABEL_29;
    case 0:
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v4 = [(PUPickerCompoundFilter *)self subfilters];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        unint64_t v7 = 0;
        uint64_t v8 = *(void *)v29;
        do
        {
          for (uint64_t k = 0; k != v6; ++k)
          {
            if (*(void *)v29 != v8) {
              objc_enumerationMutation(v4);
            }
            v7 |= [*(id *)(*((void *)&v28 + 1) + 8 * k) generatedRequiredAssetTypes];
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
        }
        while (v6);
      }
      else
      {
        unint64_t v7 = 0;
      }
      goto LABEL_31;
  }
  return 0;
}

- (unint64_t)generatedPossibleAssetTypes
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  int64_t v3 = [(PUPickerCompoundFilter *)self filterType];
  switch(v3)
  {
    case 2:
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v4 = [(PUPickerCompoundFilter *)self subfilters];
      uint64_t v10 = [v4 countByEnumeratingWithState:&v20 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        int v12 = 0;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v4);
            }
            v12 |= [*(id *)(*((void *)&v20 + 1) + 8 * i) generatedRequiredAssetTypes];
          }
          uint64_t v11 = [v4 countByEnumeratingWithState:&v20 objects:v32 count:16];
        }
        while (v11);
        unint64_t v7 = ~v12 & 0x1FFFELL;
        goto LABEL_31;
      }
LABEL_29:
      unint64_t v7 = 131070;
LABEL_31:

      return v7;
    case 1:
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v4 = [(PUPickerCompoundFilter *)self subfilters];
      uint64_t v15 = [v4 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v25;
        unint64_t v7 = 131070;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v4);
            }
            v7 &= [*(id *)(*((void *)&v24 + 1) + 8 * j) generatedPossibleAssetTypes];
          }
          uint64_t v16 = [v4 countByEnumeratingWithState:&v24 objects:v33 count:16];
        }
        while (v16);
        goto LABEL_31;
      }
      goto LABEL_29;
    case 0:
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v4 = [(PUPickerCompoundFilter *)self subfilters];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        unint64_t v7 = 0;
        uint64_t v8 = *(void *)v29;
        do
        {
          for (uint64_t k = 0; k != v6; ++k)
          {
            if (*(void *)v29 != v8) {
              objc_enumerationMutation(v4);
            }
            v7 |= [*(id *)(*((void *)&v28 + 1) + 8 * k) generatedPossibleAssetTypes];
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
        }
        while (v6);
      }
      else
      {
        unint64_t v7 = 0;
      }
      goto LABEL_31;
  }
  return 0;
}

- (id)generatedAssetPredicate
{
  int64_t v3 = [(PUPickerCompoundFilter *)self subfilters];
  id v4 = PFMap();

  int64_t v5 = [(PUPickerCompoundFilter *)self filterType];
  switch(v5)
  {
    case 2:
      unint64_t v7 = (void *)MEMORY[0x263F08730];
      uint64_t v8 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v4];
      uint64_t v9 = [v7 notPredicateWithSubpredicate:v8];

      goto LABEL_9;
    case 1:
      uint64_t v6 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v4];
      goto LABEL_7;
    case 0:
      uint64_t v6 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v4];
LABEL_7:
      uint64_t v9 = (void *)v6;
      goto LABEL_9;
  }
  uint64_t v9 = 0;
LABEL_9:

  return v9;
}

uint64_t __49__PUPickerCompoundFilter_generatedAssetPredicate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 generatedAssetPredicate];
}

- (BOOL)containsFilter:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(PUPickerCompoundFilter *)self isEqual:v4])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v6 = [(PUPickerCompoundFilter *)self subfilters];
    uint64_t v5 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v10 + 1) + 8 * i) containsFilter:v4])
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v5 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v5;
}

- (BOOL)allowsAlbums
{
  int64_t v3 = [(PUPickerCompoundFilter *)self filterType];
  switch(v3)
  {
    case 2:
      LOBYTE(v7) = 1;
      break;
    case 1:
      uint64_t v8 = [(PUPickerCompoundFilter *)self subfilters];
      int v7 = PFExists() ^ 1;

      break;
    case 0:
      id v4 = [(PUPickerCompoundFilter *)self subfilters];
      char v5 = PFExists();

      return v5;
    default:
      LOBYTE(v7) = 0;
      break;
  }
  return v7;
}

uint64_t __38__PUPickerCompoundFilter_allowsAlbums__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 allowsAlbums] ^ 1;
}

uint64_t __38__PUPickerCompoundFilter_allowsAlbums__block_invoke(uint64_t a1, void *a2)
{
  return [a2 allowsAlbums];
}

- (BOOL)isValidFilter
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(PUPickerCompoundFilter *)self filterType];
  BOOL v4 = v3 < 3;
  if (v3 >= 3)
  {
    unint64_t v5 = v3;
    uint64_t v6 = PLPickerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v24 = v5;
      _os_log_impl(&dword_217C33000, v6, OS_LOG_TYPE_ERROR, "PUPickerCompoundFilter: invalid filter type: %ld", buf, 0xCu);
    }
  }
  int v7 = [(PUPickerCompoundFilter *)self subfilters];
  if (![v7 count])
  {
    uint64_t v8 = PLPickerGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v7 count];
      *(_DWORD *)buf = 134217984;
      unint64_t v24 = v9;
      _os_log_impl(&dword_217C33000, v8, OS_LOG_TYPE_ERROR, "PUPickerCompoundFilter: invalid subfilters count: %lu", buf, 0xCu);
    }

    BOOL v4 = 0;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isValidFilter", (void)v18) & 1) == 0)
        {
          uint64_t v16 = PLPickerGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v24 = (unint64_t)v15;
            _os_log_impl(&dword_217C33000, v16, OS_LOG_TYPE_ERROR, "PUPickerCompoundFilter: invalid subfilter: %@", buf, 0xCu);
          }

          BOOL v4 = 0;
          goto LABEL_21;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  return v4;
}

- (unint64_t)hash
{
  int64_t v3 = [(PUPickerCompoundFilter *)self filterType];
  BOOL v4 = [(PUPickerCompoundFilter *)self subfilters];
  unint64_t v5 = [v4 hash] + 193 * v3 + 37249;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (PUPickerCompoundFilter *)a3;
  if (self == v4)
  {
    char v10 = 1;
LABEL_14:

    return v10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v10 = 0;
    goto LABEL_14;
  }
  unint64_t v5 = v4;
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if (objc_opt_isKindOfClass())
    {
      int64_t v7 = [(PUPickerCompoundFilter *)self filterType];
      if (v7 == [(PUPickerCompoundFilter *)v5 filterType])
      {
        uint64_t v8 = [(PUPickerCompoundFilter *)self subfilters];
        uint64_t v9 = [(PUPickerCompoundFilter *)v5 subfilters];
        if (v8 == v9) {
          char v10 = 1;
        }
        else {
          char v10 = [v8 isEqual:v9];
        }
      }
      else
      {
        char v10 = 0;
      }

      goto LABEL_14;
    }
    uint64_t v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    objc_claimAutoreleasedReturnValue();
    uint64_t v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
  }
  objc_super v14 = (PUPickerCompoundFilter *)_PFAssertFailHandler();
  return [(PUPickerCompoundFilter *)v14 initWithFilterType:v16 subfilters:v17];
}

- (PUPickerCompoundFilter)initWithFilterType:(int64_t)a3 subfilters:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    _PFAssertFailHandler();
    goto LABEL_10;
  }
  uint64_t v8 = v7;
  if (![v7 count])
  {
LABEL_10:
    objc_super v14 = (void *)_PFAssertFailHandler();
    return (PUPickerCompoundFilter *)+[PUPickerCompoundFilter supportsSecureCoding];
  }
  v16.receiver = self;
  v16.super_class = (Class)PUPickerCompoundFilter;
  uint64_t v9 = [(PUPickerCompoundFilter *)&v16 init];
  char v10 = v9;
  if (v9)
  {
    v9->_filterType = a3;
    objc_storeStrong((id *)&v9->_subfilters, a4);
  }
  if ([(PUPickerCompoundFilter *)v10 isValidFilter]) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v11;

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end