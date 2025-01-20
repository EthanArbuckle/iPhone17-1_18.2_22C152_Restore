@interface HDProtectedKeyValueEntity
+ (BOOL)setUserCharacteristic:(id)a3 forType:(id)a4 profile:(id)a5 error:(id *)a6;
+ (__CFString)_keyForDataType:(uint64_t)a3 error:;
+ (const)_insertStatementKey;
+ (id)databaseTable;
+ (id)keyForUserCharacteristicType:(id)a3;
+ (id)modificationDateForCharacteristicWithType:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)userCharacteristicForType:(id)a3 profile:(id)a4 entity:(id *)a5 error:(id *)a6;
+ (int64_t)_deviceLocalCategory;
+ (int64_t)protectionClass;
@end

@implementation HDProtectedKeyValueEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)userCharacteristicForType:(id)a3 profile:(id)a4 entity:(id *)a5 error:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = +[HDProtectedKeyValueEntity _keyForDataType:error:]((uint64_t)a1, v10, (uint64_t)a6);
  if (v12)
  {
    uint64_t v13 = [v10 code];
    if (v13 > 174)
    {
      if ((unint64_t)(v13 - 175) < 2) {
        goto LABEL_13;
      }
      if (v13 == 218 || v13 == 177)
      {
LABEL_11:
        uint64_t v15 = [a1 numberForKey:v12 domain:&stru_1F1728D60 category:101 profile:v11 entity:a5 error:a6];
        goto LABEL_12;
      }
    }
    else
    {
      char v14 = v13 - 64;
      if ((unint64_t)(v13 - 64) <= 0x27)
      {
        if (((1 << v14) & 0x8001000005) == 0)
        {
          if (((1 << v14) & 0x700000) == 0)
          {
            if (v13 == 65)
            {
              uint64_t v15 = [a1 dateComponentsForKey:v12 domain:&stru_1F1728D60 category:101 profile:v11 entity:a5 error:a6];
LABEL_12:
              v16 = (void *)v15;
              goto LABEL_17;
            }
            goto LABEL_14;
          }
LABEL_13:
          v17 = [v10 _canoncialUnit];
          v16 = [a1 quantityForKey:v12 unit:v17 domain:&stru_1F1728D60 category:101 profile:v11 entity:a5 error:a6];

          goto LABEL_17;
        }
        goto LABEL_11;
      }
    }
LABEL_14:
    _HKInitializeLogging();
    v18 = (void *)*MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
    {
      v20 = v18;
      *(_DWORD *)buf = 134217984;
      uint64_t v22 = [v10 code];
      _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "Unexpected characteristic type %ld", buf, 0xCu);
    }
  }
  v16 = 0;
LABEL_17:

  return v16;
}

+ (int64_t)_deviceLocalCategory
{
  return 100;
}

+ (__CFString)_keyForDataType:(uint64_t)a3 error:
{
  id v4 = a2;
  self;
  uint64_t v5 = [v4 code];
  if (v5 > 102)
  {
    if (v5 <= 175)
    {
      if (v5 == 103)
      {
        v6 = @"wheelchair_use";
        goto LABEL_26;
      }
      if (v5 == 175)
      {
        v6 = @"user_entered_menstrual_cycle_length";
        goto LABEL_26;
      }
    }
    else
    {
      switch(v5)
      {
        case 176:
          v6 = @"user_entered_period_cycle_length";
          goto LABEL_26;
        case 177:
          v6 = @"activity_move_mode";
          goto LABEL_26;
        case 218:
          v6 = @"cardio_fitness_medications_use";
          goto LABEL_26;
      }
    }
LABEL_25:
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Invalid characteristic type %@", v4);
    v6 = 0;
    goto LABEL_26;
  }
  if (v5 <= 83)
  {
    switch(v5)
    {
      case '@':
        v6 = @"sex";
        goto LABEL_26;
      case 'A':
        v6 = @"birthdate";
        goto LABEL_26;
      case 'B':
        v6 = @"blood_type";
        goto LABEL_26;
    }
    goto LABEL_25;
  }
  switch(v5)
  {
    case 'T':
      v6 = @"body_mass";
      break;
    case 'U':
      v6 = @"lean_body_mass";
      break;
    case 'V':
      v6 = @"height";
      break;
    case 'X':
      v6 = @"fitzpatrick_skin_type";
      break;
    default:
      goto LABEL_25;
  }
LABEL_26:

  return v6;
}

+ (id)modificationDateForCharacteristicWithType:(id)a3 profile:(id)a4 error:(id *)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = +[HDProtectedKeyValueEntity _keyForDataType:error:]((uint64_t)a1, a3, (uint64_t)a5);
  id v10 = (void *)v9;
  if (v9)
  {
    v15[0] = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v12 = [a1 modificationDatesForKeys:v11 domain:&stru_1F1728D60 category:101 profile:v8 error:a5];

    uint64_t v13 = [v12 objectForKeyedSubscript:v10];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (BOOL)setUserCharacteristic:(id)a3 forType:(id)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v11 _validateCharacteristic:v10 error:a6])
  {
    uint64_t v13 = +[HDProtectedKeyValueEntity _keyForDataType:error:]((uint64_t)a1, v11, (uint64_t)a6);
    if (!v13)
    {
LABEL_20:
      char v18 = 0;
      goto LABEL_21;
    }
    uint64_t v14 = [v11 code];
    if (v14 > 174)
    {
      if ((unint64_t)(v14 - 175) < 2) {
        goto LABEL_17;
      }
      if (v14 == 218 || v14 == 177)
      {
LABEL_15:
        char v16 = [a1 setNumber:v10 forKey:v13 domain:&stru_1F1728D60 category:101 profile:v12 error:a6];
        goto LABEL_16;
      }
    }
    else
    {
      char v15 = v14 - 64;
      if ((unint64_t)(v14 - 64) <= 0x27)
      {
        if (((1 << v15) & 0x8001000005) == 0)
        {
          if (((1 << v15) & 0x700000) == 0)
          {
            if (v14 == 65)
            {
              char v16 = [a1 setDateComponents:v10 forKey:v13 domain:&stru_1F1728D60 category:101 profile:v12 error:a6];
LABEL_16:
              char v18 = v16;
LABEL_21:

              goto LABEL_22;
            }
            goto LABEL_18;
          }
LABEL_17:
          v19 = [v11 _canoncialUnit];
          char v18 = [a1 setQuantity:v10 unit:v19 forKey:v13 domain:&stru_1F1728D60 category:101 profile:v12 error:a6];

          goto LABEL_21;
        }
        goto LABEL_15;
      }
    }
LABEL_18:
    _HKInitializeLogging();
    v21 = (void *)*MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = v21;
      *(_DWORD *)buf = 134217984;
      uint64_t v25 = [v11 code];
      _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "Unexpected characteristic type %ld", buf, 0xCu);
    }
    goto LABEL_20;
  }
  _HKInitializeLogging();
  v17 = (void *)*MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
  {
    v20 = v17;
    *(_DWORD *)buf = 134217984;
    uint64_t v25 = [v11 code];
    _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "Failed to validate characteristic for type %ld", buf, 0xCu);
  }
  char v18 = 0;
LABEL_22:

  return v18;
}

+ (id)keyForUserCharacteristicType:(id)a3
{
  return +[HDProtectedKeyValueEntity _keyForDataType:error:]((uint64_t)a1, a3, 0);
}

+ (id)databaseTable
{
  return @"key_value_secure";
}

+ (const)_insertStatementKey
{
  return (const char *)&_insertStatementKey_key;
}

@end