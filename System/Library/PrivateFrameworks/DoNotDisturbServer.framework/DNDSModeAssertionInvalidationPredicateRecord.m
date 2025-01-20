@interface DNDSModeAssertionInvalidationPredicateRecord
+ (id)recordForDictionary:(id)a3 keys:(id *)a4;
+ (id)recordForInvalidationPredicate:(id)a3;
- (NSArray)UUIDs;
- (NSArray)clientIdentifiers;
- (NSNumber)date;
- (NSString)predicateType;
- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4;
- (id)object;
- (void)setClientIdentifiers:(id)a3;
- (void)setDate:(id)a3;
- (void)setPredicateType:(id)a3;
- (void)setUUIDs:(id)a3;
@end

@implementation DNDSModeAssertionInvalidationPredicateRecord

+ (id)recordForDictionary:(id)a3 keys:(id *)a4
{
  if (a3)
  {
    id v5 = a3;
    v6 = objc_alloc_init(DNDSModeAssertionInvalidationPredicateRecord);
    v7 = objc_msgSend(v5, "bs_safeStringForKey:", a4->var8.var0);
    [(DNDSModeAssertionInvalidationPredicateRecord *)v6 setPredicateType:v7];

    v8 = objc_msgSend(v5, "bs_safeNumberForKey:", a4->var8.var1);
    [(DNDSModeAssertionInvalidationPredicateRecord *)v6 setDate:v8];

    v9 = objc_msgSend(v5, "bs_safeArrayForKey:", a4->var8.var2);
    v10 = objc_msgSend(v9, "bs_filter:", &__block_literal_global_18);
    [(DNDSModeAssertionInvalidationPredicateRecord *)v6 setClientIdentifiers:v10];

    v11 = objc_msgSend(v5, "bs_safeArrayForKey:", a4->var8.var3);

    v12 = objc_msgSend(v11, "bs_filter:", &__block_literal_global_78);
    [(DNDSModeAssertionInvalidationPredicateRecord *)v6 setUUIDs:v12];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

BOOL __85__DNDSModeAssertionInvalidationPredicateRecord_Dictionary__recordForDictionary_keys___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = (uint64_t)v4;
    }
    else {
      uint64_t v3 = 0;
    }
  }

  return v3 != 0;
}

BOOL __85__DNDSModeAssertionInvalidationPredicateRecord_Dictionary__recordForDictionary_keys___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = (uint64_t)v4;
    }
    else {
      uint64_t v3 = 0;
    }
  }

  return v3 != 0;
}

- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4
{
  char v4 = a4;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [(DNDSModeAssertionInvalidationPredicateRecord *)self predicateType];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v8, a3->var8.var0);

  v9 = [(DNDSModeAssertionInvalidationPredicateRecord *)self date];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v9, a3->var8.var1);

  v10 = [(DNDSModeAssertionInvalidationPredicateRecord *)self clientIdentifiers];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v10, a3->var8.var2);

  v11 = [(DNDSModeAssertionInvalidationPredicateRecord *)self UUIDs];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v11, a3->var8.var3);

  if (v4)
  {
    v12 = [(DNDSModeAssertionInvalidationPredicateRecord *)self date];
    v13 = [NSString stringWithFormat:@"%@Local", a3->var8.var1];
    objc_msgSend(v7, "dnds_setSafeLocalDateForTimestamp:key:", v12, v13);
  }
  return v7;
}

+ (id)recordForInvalidationPredicate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    char v4 = objc_alloc_init(DNDSModeAssertionInvalidationPredicateRecord);
    uint64_t v5 = [v3 predicateType];
    v6 = objc_msgSend(NSString, "dnds_stringForPredicateType:", v5);
    [(DNDSModeAssertionInvalidationPredicateRecord *)v4 setPredicateType:v6];

    switch(v5)
    {
      case 3:
        v10 = [v3 UUIDs];
        v8 = objc_msgSend(v10, "bs_mapNoNulls:", &__block_literal_global_314);

        [(DNDSModeAssertionInvalidationPredicateRecord *)v4 setUUIDs:v8];
        break;
      case 2:
        v8 = [v3 clientIdentifiers];
        [(DNDSModeAssertionInvalidationPredicateRecord *)v4 setClientIdentifiers:v8];
        break;
      case 1:
        v7 = NSNumber;
        v8 = [v3 date];
        v9 = objc_msgSend(v7, "dnds_numberWithDate:", v8);
        [(DNDSModeAssertionInvalidationPredicateRecord *)v4 setDate:v9];

        break;
      default:
        goto LABEL_10;
    }
  }
  else
  {
    char v4 = 0;
  }
LABEL_10:

  return v4;
}

id __79__DNDSModeAssertionInvalidationPredicateRecord_recordForInvalidationPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 UUIDString];
  }
  else
  {
    char v4 = (void *)DNDSLogAssertionStore;
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionStore, OS_LOG_TYPE_ERROR)) {
      __79__DNDSModeAssertionInvalidationPredicateRecord_recordForInvalidationPredicate___block_invoke_cold_1(v4, (uint64_t)v2);
    }
    id v3 = 0;
  }

  return v3;
}

- (id)object
{
  id v3 = [(DNDSModeAssertionInvalidationPredicateRecord *)self predicateType];
  uint64_t v4 = objc_msgSend(v3, "dnds_predicateTypeValue");

  switch(v4)
  {
    case 0:
      uint64_t v5 = +[DNDSAnyModeAssertionInvalidationPredicate sharedInstance];
      goto LABEL_13;
    case 1:
      v6 = [(DNDSModeAssertionInvalidationPredicateRecord *)self date];
      v7 = objc_msgSend(v6, "dnds_dateValue");

      if (!v7) {
        goto LABEL_11;
      }
      v8 = [[DNDSModeAssertionDateInvalidationPredicate alloc] initWithDate:v7];
      goto LABEL_10;
    case 2:
      v7 = [(DNDSModeAssertionInvalidationPredicateRecord *)self clientIdentifiers];
      if (![v7 count]) {
        goto LABEL_11;
      }
      v8 = [[DNDSModeAssertionClientIdentifierInvalidationPredicate alloc] initWithClientIdentifiers:v7];
      goto LABEL_10;
    case 3:
      v9 = [(DNDSModeAssertionInvalidationPredicateRecord *)self UUIDs];
      v7 = objc_msgSend(v9, "bs_mapNoNulls:", &__block_literal_global_320);

      if ([v7 count])
      {
        v8 = [[DNDSModeAssertionUUIDInvalidationPredicate alloc] initWithUUIDs:v7];
LABEL_10:
        uint64_t v5 = v8;
      }
      else
      {
LABEL_11:
        uint64_t v5 = 0;
      }

LABEL_13:
      return v5;
    default:
      uint64_t v5 = 0;
      goto LABEL_13;
  }
}

id __54__DNDSModeAssertionInvalidationPredicateRecord_object__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (NSString)predicateType
{
  return self->_predicateType;
}

- (void)setPredicateType:(id)a3
{
}

- (NSNumber)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSArray)clientIdentifiers
{
  return self->_clientIdentifiers;
}

- (void)setClientIdentifiers:(id)a3
{
}

- (NSArray)UUIDs
{
  return self->_UUIDs;
}

- (void)setUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUIDs, 0);
  objc_storeStrong((id *)&self->_clientIdentifiers, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_predicateType, 0);
}

void __79__DNDSModeAssertionInvalidationPredicateRecord_recordForInvalidationPredicate___block_invoke_cold_1(void *a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1D3052000, v3, OS_LOG_TYPE_ERROR, "Unexpected object (%@) found in invalidation predicate UUIDs: %@", (uint8_t *)&v6, 0x16u);
}

@end