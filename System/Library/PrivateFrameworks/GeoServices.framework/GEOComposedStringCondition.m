@interface GEOComposedStringCondition
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (GEOComposedStringCondition)initWithCoder:(id)a3;
- (GEOComposedStringCondition)initWithGeoCondition:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)conditionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedStringCondition

- (GEOComposedStringCondition)initWithGeoCondition:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedStringCondition;
  v5 = [(GEOComposedStringCondition *)&v15 init];
  if (v5)
  {
    v5->_conditionType = [v4 type];
    if ([v4 expirationTime])
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "expirationTime"));
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = (NSDate *)v6;
    }
    v8 = [v4 conditions];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      v10 = [v4 conditions];
      uint64_t v11 = objc_msgSend(v10, "_geo_map:", &__block_literal_global_6);
      subConditions = v5->_subConditions;
      v5->_subConditions = (NSArray *)v11;
    }
    v13 = v5;
  }

  return v5;
}

GEOComposedStringCondition *__51__GEOComposedStringCondition_initWithGeoCondition___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GEOComposedStringCondition alloc] initWithGeoCondition:v2];

  return v3;
}

- (BOOL)isValid
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  switch(self->_conditionType)
  {
    case 0:
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        return 0;
      }
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x1E4F14500];
      v20 = "Unreachable reached: Unknown condition";
      goto LABEL_45;
    case 1:
      if ([(NSArray *)self->_subConditions count] > 1)
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v4 = self->_subConditions;
        uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v29 objects:v36 count:16];
        if (!v5) {
          goto LABEL_38;
        }
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v30;
        char v3 = 1;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v30 != v7) {
              objc_enumerationMutation(v4);
            }
            if (v3) {
              char v3 = [*(id *)(*((void *)&v29 + 1) + 8 * i) isValid];
            }
            else {
              char v3 = 0;
            }
          }
          uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v29 objects:v36 count:16];
        }
        while (v6);
        goto LABEL_42;
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        return 0;
      }
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x1E4F14500];
      v20 = "Assertion failed: _subConditions.count >= 2";
      goto LABEL_45;
    case 2:
      if ([(NSArray *)self->_subConditions count] > 1)
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v4 = self->_subConditions;
        uint64_t v9 = [(NSArray *)v4 countByEnumeratingWithState:&v25 objects:v35 count:16];
        if (!v9) {
          goto LABEL_41;
        }
        uint64_t v10 = v9;
        char v3 = 0;
        uint64_t v11 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v10; ++j)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v4);
            }
            if (v3) {
              char v3 = 1;
            }
            else {
              char v3 = [*(id *)(*((void *)&v25 + 1) + 8 * j) isValid];
            }
          }
          uint64_t v10 = [(NSArray *)v4 countByEnumeratingWithState:&v25 objects:v35 count:16];
        }
        while (v10);
        goto LABEL_42;
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        return 0;
      }
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x1E4F14500];
      v20 = "Assertion failed: _subConditions.count >= 2";
      goto LABEL_45;
    case 3:
      if ([(NSArray *)self->_subConditions count])
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v4 = self->_subConditions;
        uint64_t v13 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v34 count:16];
        if (!v13)
        {
LABEL_38:
          char v3 = 1;
          goto LABEL_42;
        }
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        while (1)
        {
          for (uint64_t k = 0; k != v14; ++k)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v4);
            }
            if (objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * k), "isValid", (void)v21))
            {
LABEL_41:
              char v3 = 0;
LABEL_42:

              return v3;
            }
          }
          uint64_t v14 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v34 count:16];
          if (!v14) {
            goto LABEL_38;
          }
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v19 = MEMORY[0x1E4F14500];
        v20 = "Assertion failed: _subConditions.count >= 1";
LABEL_45:
        _os_log_fault_impl(&dword_188D96000, v19, OS_LOG_TYPE_FAULT, v20, buf, 2u);
      }
      return 0;
    case 4:
      if (self->_expirationDate)
      {
        id v4 = [MEMORY[0x1E4F1C9C8] date];
        v17 = [(NSArray *)v4 earlierDate:self->_expirationDate];
        char v3 = [v17 isEqualToDate:self->_expirationDate];

        goto LABEL_42;
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        return 0;
      }
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x1E4F14500];
      v20 = "Assertion failed: _expirationDate != ((void *)0)";
      goto LABEL_45;
    default:
      return 1;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v4 + 8) = self->_conditionType;
  uint64_t v5 = [(NSDate *)self->_expirationDate copy];
  uint64_t v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  if ([(NSArray *)self->_subConditions count])
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_subConditions copyItems:1];
    v8 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v7;
  }
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedStringCondition)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedStringCondition;
  uint64_t v5 = [(GEOComposedStringCondition *)&v12 init];
  if (v5)
  {
    v5->_conditionType = [v4 decodeIntegerForKey:@"_conditionType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_subConditions"];
    subConditions = v5->_subConditions;
    v5->_subConditions = (NSArray *)v8;

    uint64_t v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t conditionType = self->_conditionType;
  id v5 = a3;
  [v5 encodeInteger:conditionType forKey:@"_conditionType"];
  [v5 encodeObject:self->_expirationDate forKey:@"_expirationDate"];
  [v5 encodeObject:self->_subConditions forKey:@"_subConditions"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = v5;
    if (self->_conditionType == *((_DWORD *)v5 + 2)
      && ((v7 = (void *)v5[2], v8 = self->_expirationDate, unint64_t v9 = v7, !(v8 | v9))
       || (v10 = (void *)v9, int v11 = [(id)v8 isEqual:v9], v10, (id)v8, v11)))
    {
      subConditions = self->_subConditions;
      uint64_t v13 = v6[3];
      id v14 = subConditions;
      uint64_t v15 = v14;
      if ((unint64_t)v14 | v13) {
        char v16 = [v14 isEqual:v13];
      }
      else {
        char v16 = 1;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (int)conditionType
{
  return self->_conditionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subConditions, 0);

  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end