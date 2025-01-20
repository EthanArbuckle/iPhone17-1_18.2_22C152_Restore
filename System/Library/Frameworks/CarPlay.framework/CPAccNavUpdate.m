@interface CPAccNavUpdate
+ (BOOL)isUpdate:(id)a3 equalTo:(id)a4;
+ (id)_descriptionArray:(id)a3 resolveEnums:(BOOL)a4 showNils:(BOOL)a5 prefix:(id)a6;
+ (id)_dictionaryFormat:(id)a3 resolveEnums:(BOOL)a4;
+ (id)_formattedDistanceString:(double)a3;
+ (id)_valueFromChargePrecondition:(id)a3 forParamKey:(id)a4;
+ (id)_valueFromCollection:(id)a3 forParamKey:(id)a4;
+ (id)_valueFromMeasurement:(id)a3 forParamKey:(id)a4;
+ (id)accNavInfoWithUpdate:(id)a3 component:(id)a4 customValueBlock:(id)a5;
+ (id)accNavParameterKeysIndexedForUpdate:(Class)a3;
+ (id)accNavParametersIndexedForUpdate:(Class)a3;
+ (id)copyUpdate:(id)a3;
+ (id)description:(id)a3;
+ (id)dictionaryIAPFormat:(id)a3;
+ (id)dictionaryStringFormat:(id)a3;
+ (id)iapDescription:(id)a3;
+ (id)update:(id)a3 valueForKey:(unsigned __int16)a4;
+ (id)update:(id)a3 valueForParam:(id)a4;
+ (id)update:(id)a3 valueForParamKey:(id)a4;
+ (id)update:(id)a3 valueForProperty:(id)a4;
+ (id)updateClass:(Class)a3 paramForProperty:(id)a4;
+ (id)updateClass:(Class)a3 paramKeyForKey:(unsigned __int16)a4;
+ (void)_update:(id)a3 resetValueForParameter:(id)a4;
+ (void)configureTypesForUpdateClass:(Class)a3;
+ (void)decodeUpdate:(id)a3 withCoder:(id)a4;
+ (void)encodeUpdate:(id)a3 withCoder:(id)a4;
+ (void)enumerateUpdate:(id)a3 paramKeysAndValuesWithBlock:(id)a4;
+ (void)enumerateUpdate:(id)a3 paramsAndValuesWithBlock:(id)a4;
+ (void)enumerateUpdateClass:(Class)a3 paramKeysWithBlock:(id)a4;
+ (void)enumerateUpdateClass:(Class)a3 paramsWithBlock:(id)a4;
+ (void)resetUpdate:(id)a3;
+ (void)update:(id)a3 resetValueForProperty:(id)a4;
@end

@implementation CPAccNavUpdate

+ (void)configureTypesForUpdateClass:(Class)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = [(objc_class *)a3 accNavParameters];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) configureTypesForUpdate:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (id)accNavParametersIndexedForUpdate:(Class)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(objc_class *)a3 accNavParameters];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v11 = [v10 property];
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)accNavParameterKeysIndexedForUpdate:(Class)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v4 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [(objc_class *)a3 accNavParameters];
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v9 = [v8 keys];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(v9);
              }
              long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              long long v15 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v14, "key"));
              [v4 setObject:v14 forKeyedSubscript:v15];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v11);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)updateClass:(Class)a3 paramForProperty:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(objc_class *)a3 accNavParametersIndexed];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];

  return v7;
}

+ (id)updateClass:(Class)a3 paramKeyForKey:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v5 = [(objc_class *)a3 accNavParameterKeysIndexed];
  uint64_t v6 = [NSNumber numberWithUnsignedShort:v4];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

+ (BOOL)isUpdate:(id)a3 equalTo:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    [(id)objc_opt_class() accNavParameters];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v15 = objc_msgSend(v14, "property", (void)v21);
          uint64_t v16 = [v5 valueForKey:v15];

          v17 = [v14 property];
          uint64_t v18 = [v6 valueForKey:v17];

          if (v16 | v18)
          {
            BOOL v19 = !v16 || v18 == 0;
            if (v19 || v16 != v18 && ([(id)v16 isEqual:v18] & 1) == 0)
            {

              BOOL v8 = 0;
              goto LABEL_19;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    BOOL v8 = 1;
LABEL_19:
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (void)resetUpdate:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [a1 configureTypesForUpdateClass:objc_opt_class()];
  id v5 = [(id)objc_opt_class() accNavParameters];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [a1 _update:v4 resetValueForParameter:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

+ (void)update:(id)a3 resetValueForProperty:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(id)objc_opt_class() accNavParametersIndexed];
  id v9 = [v8 objectForKeyedSubscript:v6];

  [a1 _update:v7 resetValueForParameter:v9];
}

+ (void)_update:(id)a3 resetValueForParameter:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 primaryKey];
  int v8 = [v7 enumType];

  id v9 = [v6 primaryKey];
  long long v10 = v9;
  if (v8)
  {
    int v11 = [v9 enumType];
    long long v12 = [v6 primaryKey];
    long long v13 = NotSetFromCPNavEnum(v11, [v12 accNavType]);
    long long v14 = [v6 property];
    [v5 setValue:v13 forKey:v14];

    goto LABEL_16;
  }
  int v15 = [v9 isIntegerValue];

  uint64_t v16 = [v6 primaryKey];
  v17 = v16;
  if (!v15)
  {
    int v19 = [v16 isTimeIntervalValue];

    if (v19)
    {
      long long v10 = [v6 property];
      long long v20 = &unk_26C95B558;
    }
    else
    {
      long long v21 = [v6 primaryKey];
      int v22 = [v21 isBoolValue];

      long long v10 = [v6 property];
      if (!v22)
      {
        long long v23 = v5;
        long long v20 = 0;
        goto LABEL_15;
      }
      long long v20 = (void *)MEMORY[0x263EFFA80];
    }
    long long v23 = v5;
LABEL_15:
    [v23 setValue:v20 forKey:v10];
    goto LABEL_16;
  }
  long long v10 = NotSetFromCPAccNavType([v16 accNavType]);

  if (v10)
  {
    uint64_t v18 = [v6 property];
    [v5 setValue:v10 forKey:v18];
  }
  else
  {
    uint64_t v18 = CarPlayFrameworkACCNavLogging();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[CPAccNavUpdate _update:resetValueForParameter:](v6, v18);
    }
  }

LABEL_16:
}

+ (id)update:(id)a3 valueForProperty:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() accNavParametersIndexed];
  int v8 = [v7 objectForKeyedSubscript:v5];

  id v9 = +[CPAccNavUpdate update:v6 valueForParam:v8];

  return v9;
}

+ (id)update:(id)a3 valueForKey:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  id v6 = [(id)objc_opt_class() accNavParameterKeysIndexed];
  id v7 = [NSNumber numberWithUnsignedShort:v4];
  int v8 = [v6 objectForKeyedSubscript:v7];
  id v9 = +[CPAccNavUpdate update:v5 valueForParamKey:v8];

  return v9;
}

+ (id)update:(id)a3 valueForParam:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 property];
  int v8 = [v6 valueForKey:v7];

  id v9 = [v5 primaryKey];
  int v10 = [v9 enumType];
  if (v10
    || ([v5 primaryKey],
        id v7 = objc_claimAutoreleasedReturnValue(),
        ([v7 isIntegerValue] & 1) != 0))
  {
    int v11 = [v5 primaryKey];
    long long v12 = [v11 unsetValue];
    char v13 = [v8 isEqual:v12];

    if (!v10) {
    if (v13)
    }
    {
LABEL_12:
      long long v14 = v8;
      int v8 = 0;
      goto LABEL_13;
    }
  }
  else
  {
  }
  long long v14 = [v5 primaryKey];
  if ([v14 isTimeIntervalValue])
  {
    if ([v8 isEqual:&unk_26C95B558])
    {
    }
    else
    {
      int v15 = [v5 primaryKey];
      uint64_t v16 = [v15 unsetValue];
      int v17 = [v8 isEqual:v16];

      if (!v17) {
        goto LABEL_14;
      }
    }
    goto LABEL_12;
  }
LABEL_13:

LABEL_14:

  return v8;
}

+ (id)update:(id)a3 valueForParamKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [v6 param];
  id v9 = [v8 property];
  int v10 = [v7 valueForKey:v9];

  if (v10)
  {
    int v11 = [v6 param];
    uint64_t v12 = [v11 objcType];
    uint64_t v13 = objc_opt_class();

    if (v12 == v13)
    {
      uint64_t v17 = [a1 _valueFromMeasurement:v10 forParamKey:v6];
    }
    else
    {
      if (([v6 enumType] || objc_msgSend(v6, "isIntegerValue"))
        && (NotSetFromCPAccNavType([v6 accNavType]),
            long long v14 = objc_claimAutoreleasedReturnValue(),
            char v15 = [v10 isEqual:v14],
            v14,
            (v15 & 1) != 0)
        || [v6 isTimeIntervalValue]
        && ([v10 isEqual:&unk_26C95B558] & 1) != 0)
      {
        uint64_t v16 = 0;
LABEL_19:

        int v10 = v16;
        goto LABEL_20;
      }
      uint64_t v18 = [v6 param];
      uint64_t v19 = [v18 objcType];
      uint64_t v20 = objc_opt_class();

      if (v19 == v20)
      {
        uint64_t v29 = [v6 accNavType];
        [v10 timeIntervalSince1970];
        uint64_t v17 = NSNumberForCPAccNavTypeFromDouble(v29, v30);
      }
      else
      {
        long long v21 = [v6 param];
        uint64_t v22 = [v21 objcType];
        if (v22 == objc_opt_class())
        {
        }
        else
        {
          long long v23 = [v6 param];
          uint64_t v24 = [v23 objcType];
          uint64_t v25 = objc_opt_class();

          if (v24 != v25)
          {
            uint64_t v26 = [v6 param];
            uint64_t v27 = [v26 objcType];
            uint64_t v28 = objc_opt_class();

            if (v27 != v28) {
              goto LABEL_20;
            }
            uint64_t v17 = [a1 _valueFromChargePrecondition:v10 forParamKey:v6];
            goto LABEL_18;
          }
        }
        uint64_t v17 = [a1 _valueFromCollection:v10 forParamKey:v6];
      }
    }
LABEL_18:
    uint64_t v16 = (void *)v17;
    goto LABEL_19;
  }
LABEL_20:

  return v10;
}

+ (id)_valueFromMeasurement:(id)a3 forParamKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 dimension];

  if (v8)
  {
    id v9 = [v7 dimension];
    int v10 = objc_msgSend(v6, "accNav_safeToBeConvertedToUnit:", v9);

    if (!v10)
    {
      uint64_t v18 = 0;
      goto LABEL_9;
    }
    int v11 = [v7 dimension];
    uint64_t v12 = [v6 measurementByConvertingToUnit:v11];
    [v12 doubleValue];
    double v14 = v13;

    uint64_t v15 = NSNumberForCPAccNavTypeFromDouble([v7 accNavType], v14);
  }
  else
  {
    if ([v7 enumType] == 5)
    {
      uint64_t v16 = NSNumber;
      uint64_t v17 = [v6 unit];
      uint64_t v18 = [v16 numberWithUnsignedChar:CPDistanceUnitsFromNSUnitLength(v17)];

      goto LABEL_9;
    }
    [v6 doubleValue];
    uint64_t v15 = objc_msgSend(a1, "_formattedDistanceString:");
  }
  uint64_t v18 = (void *)v15;
LABEL_9:

  return v18;
}

+ (id)_valueFromCollection:(id)a3 forParamKey:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 param];
  uint64_t v8 = [v7 objcType];
  uint64_t v9 = objc_opt_class();

  if (v8 == v9)
  {
LABEL_7:
    id v15 = v5;
    goto LABEL_8;
  }
  int v10 = [v6 param];
  uint64_t v11 = [v10 objcType];
  uint64_t v12 = objc_opt_class();

  if (v11 == v12)
  {
    id v15 = [v5 allObjects];
LABEL_8:
    uint64_t v17 = v15;
    goto LABEL_10;
  }
  double v13 = [v6 param];
  uint64_t v14 = [v13 objcType];
  if (v14 == objc_opt_class())
  {
    int v16 = [v6 key];

    if (v16 != 23) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

LABEL_9:
  uint64_t v17 = 0;
LABEL_10:
  if ([v17 count])
  {
    id v30 = v5;
    uint64_t v18 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v29 = v17;
    obuint64_t j = v17;
    uint64_t v19 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v34 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v24 = objc_msgSend(v6, "param", v29);
          uint64_t v25 = [v24 collectionGeneric];
          uint64_t v26 = objc_opt_class();

          if (v25 == v26)
          {
            uint64_t v27 = [a1 _valueFromMeasurement:v23 forParamKey:v6];
            [v18 addObject:v27];
          }
          else
          {
            [v18 addObject:v23];
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v20);
    }

    uint64_t v17 = v29;
    id v5 = v30;
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

+ (id)_valueFromChargePrecondition:(id)a3 forParamKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch([v7 key])
  {
    case 0x17u:
      uint64_t v8 = [v6 connectors];
      uint64_t v9 = [a1 _valueFromCollection:v8 forParamKey:v7];
      goto LABEL_8;
    case 0x18u:
      uint64_t v11 = [v6 arrivalBatteryLevel];
      goto LABEL_7;
    case 0x19u:
      uint64_t v11 = [v6 departureBatteryLevel];
      goto LABEL_7;
    case 0x1Au:
      uint64_t v11 = [v6 finalWaypointBatteryLevel];
LABEL_7:
      uint64_t v8 = (void *)v11;
      uint64_t v9 = [a1 _valueFromMeasurement:v11 forParamKey:v7];
LABEL_8:
      int v10 = (void *)v9;

      break;
    default:
      int v10 = 0;
      break;
  }

  return v10;
}

+ (void)enumerateUpdateClass:(Class)a3 paramsWithBlock:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, void))a4;
  if ([(objc_class *)a3 conformsToProtocol:&unk_26C95C978])
  {
    id v6 = [(objc_class *)a3 accNavParameters];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          v5[2](v5, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

+ (void)enumerateUpdateClass:(Class)a3 paramKeysWithBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, void))a4;
  if ([(objc_class *)a3 conformsToProtocol:&unk_26C95C978])
  {
    id v6 = [(objc_class *)a3 accNavParameters];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v12 = objc_msgSend(v11, "keys", 0);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v18;
            do
            {
              uint64_t v16 = 0;
              do
              {
                if (*(void *)v18 != v15) {
                  objc_enumerationMutation(v12);
                }
                v5[2](v5, *(void *)(*((void *)&v17 + 1) + 8 * v16++));
              }
              while (v14 != v16);
              uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v14);
          }

          ++v10;
        }
        while (v10 != v8);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }
  }
}

+ (void)enumerateUpdate:(id)a3 paramsAndValuesWithBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__CPAccNavUpdate_enumerateUpdate_paramsAndValuesWithBlock___block_invoke;
  v10[3] = &unk_26430AF08;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  +[CPAccNavUpdate enumerateUpdateClass:v7 paramsWithBlock:v10];
}

void __59__CPAccNavUpdate_enumerateUpdate_paramsAndValuesWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = +[CPAccNavUpdate update:v3 valueForParam:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)enumerateUpdate:(id)a3 paramKeysAndValuesWithBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__CPAccNavUpdate_enumerateUpdate_paramKeysAndValuesWithBlock___block_invoke;
  v10[3] = &unk_26430AF30;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  +[CPAccNavUpdate enumerateUpdateClass:v7 paramKeysWithBlock:v10];
}

void __62__CPAccNavUpdate_enumerateUpdate_paramKeysAndValuesWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = +[CPAccNavUpdate update:v3 valueForParamKey:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)dictionaryIAPFormat:(id)a3
{
  return (id)[a1 _dictionaryFormat:a3 resolveEnums:0];
}

+ (id)dictionaryStringFormat:(id)a3
{
  return (id)[a1 _dictionaryFormat:a3 resolveEnums:1];
}

+ (id)_dictionaryFormat:(id)a3 resolveEnums:(BOOL)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__CPAccNavUpdate__dictionaryFormat_resolveEnums___block_invoke;
  v11[3] = &unk_26430AF58;
  BOOL v14 = a4;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  +[CPAccNavUpdate enumerateUpdate:v8 paramKeysAndValuesWithBlock:v11];
  id v9 = (void *)[v7 copy];

  return v9;
}

void __49__CPAccNavUpdate__dictionaryFormat_resolveEnums___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 hasVariants])
  {
    id v7 = [v6 firstObject];
  }
  else
  {
    id v8 = [v5 param];
    int v9 = objc_msgSend((id)objc_msgSend(v8, "collectionGeneric"), "conformsToProtocol:", &unk_26C95C978);

    id v7 = v6;
    if (v9)
    {
      uint64_t v10 = objc_opt_new();
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v11 = v6;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = +[CPAccNavUpdate _dictionaryFormat:resolveEnums:](CPAccNavUpdate, "_dictionaryFormat:resolveEnums:", *(void *)(*((void *)&v24 + 1) + 8 * i), *(unsigned __int8 *)(a1 + 48), (void)v24);
            [v10 addObject:v16];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v13);
      }

      if ([v10 count]) {
        id v7 = (void *)[v10 copy];
      }
      else {
        id v7 = 0;
      }
    }
  }
  if (!*(unsigned char *)(a1 + 48)) {
    goto LABEL_25;
  }
  if ([v5 enumType])
  {
    +[CPNavigationEnum stringForEnum:navEnum:](CPNavigationEnum, "stringForEnum:navEnum:", [v7 integerValue], objc_msgSend(v5, "enumType"));
    long long v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (![v5 isBoolValue]) {
      goto LABEL_23;
    }
    int v18 = [v7 BOOLValue];
    long long v19 = @"NO";
    if (v18) {
      long long v19 = @"YES";
    }
    long long v17 = v19;
  }
  long long v20 = v17;

  id v7 = v20;
LABEL_23:
  if (!*(unsigned char *)(a1 + 48))
  {
LABEL_25:
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v5, "key", (void)v24));
    goto LABEL_26;
  }
  uint64_t v21 = +[CPAccNavInfoType stringForUpdateClass:infoType:](CPAccNavInfoType, "stringForUpdateClass:infoType:", objc_opt_class(), [v5 key]);
LABEL_26:
  long long v22 = (void *)v21;
  long long v23 = objc_msgSend(v7, "copy", (void)v24);
  [*(id *)(a1 + 40) setObject:v23 forKeyedSubscript:v22];
}

+ (id)iapDescription:(id)a3
{
  uint64_t v3 = [a1 _descriptionArray:a3 resolveEnums:0 showNils:1 prefix:@"     "];
  id v4 = [v3 componentsJoinedByString:@"\n"];

  return v4;
}

+ (id)description:(id)a3
{
  uint64_t v3 = [a1 _descriptionArray:a3 resolveEnums:1 showNils:1 prefix:@"     "];
  id v4 = [v3 componentsJoinedByString:@"\n"];

  return v4;
}

+ (id)_descriptionArray:(id)a3 resolveEnums:(BOOL)a4 showNils:(BOOL)a5 prefix:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = objc_opt_new();
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __65__CPAccNavUpdate__descriptionArray_resolveEnums_showNils_prefix___block_invoke;
  v18[3] = &unk_26430AF80;
  BOOL v22 = a4;
  BOOL v23 = a5;
  id v19 = v10;
  id v20 = v9;
  id v12 = v11;
  id v21 = v12;
  id v13 = v9;
  id v14 = v10;
  +[CPAccNavUpdate enumerateUpdate:v13 paramKeysAndValuesWithBlock:v18];
  uint64_t v15 = v21;
  id v16 = v12;

  return v16;
}

void __65__CPAccNavUpdate__descriptionArray_resolveEnums_showNils_prefix___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 hasVariants])
  {
    id v7 = [v6 firstObject];

    goto LABEL_22;
  }
  id v8 = [v5 param];
  int v9 = objc_msgSend((id)objc_msgSend(v8, "collectionGeneric"), "conformsToProtocol:", &unk_26C95C978);

  if (!v9)
  {
    long long v26 = [v5 param];
    uint64_t v27 = [v26 objcType];
    uint64_t v28 = objc_opt_class();

    if (v6 && v27 == v28)
    {
      uint64_t v29 = NSString;
      id v30 = [v6 componentsJoinedByString:@", "];
      id v7 = [v29 stringWithFormat:@"[%@]", v30];
    }
    else
    {
      v31 = [v5 param];
      uint64_t v32 = [v31 objcType];
      uint64_t v33 = objc_opt_class();

      id v7 = v6;
      if (!v6) {
        goto LABEL_22;
      }
      id v7 = v6;
      if (v32 != v33) {
        goto LABEL_22;
      }
      long long v34 = NSString;
      id v30 = [v6 allObjects];
      long long v35 = [v30 componentsJoinedByString:@", "];
      id v7 = [v34 stringWithFormat:@"[%@]", v35];
    }
    goto LABEL_22;
  }
  id v49 = v5;
  id v10 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v48 = v6;
  obuint64_t j = v6;
  uint64_t v11 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v51 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v53 != v51) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v15 = NSString;
        uint64_t v16 = *(void *)(a1 + 32);
        long long v17 = (objc_class *)objc_opt_class();
        int v18 = NSStringFromClass(v17);
        id v19 = [v15 stringWithFormat:@"%@     %@ {", v16, v18];
        [v10 addObject:v19];

        uint64_t v20 = *(unsigned __int8 *)(a1 + 56);
        uint64_t v21 = *(unsigned __int8 *)(a1 + 57);
        BOOL v22 = [NSString stringWithFormat:@"%@          ", *(void *)(a1 + 32)];
        BOOL v23 = +[CPAccNavUpdate _descriptionArray:v14 resolveEnums:v20 showNils:v21 prefix:v22];
        [v10 addObjectsFromArray:v23];

        long long v24 = [NSString stringWithFormat:@"%@     }", *(void *)(a1 + 32)];
        [v10 addObject:v24];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v12);
  }

  if ([v10 count]) {
    long long v25 = v10;
  }
  else {
    long long v25 = 0;
  }
  id v7 = v25;

  id v6 = v48;
  id v5 = v49;
LABEL_22:
  if (!*(unsigned char *)(a1 + 56))
  {
LABEL_32:
    uint64_t v40 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v5, "key"));
    goto LABEL_33;
  }
  if ([v5 enumType])
  {
    +[CPNavigationEnum stringForEnum:navEnum:](CPNavigationEnum, "stringForEnum:navEnum:", [v7 integerValue], objc_msgSend(v5, "enumType"));
    long long v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (![v5 isBoolValue]) {
      goto LABEL_30;
    }
    int v37 = [v7 BOOLValue];
    uint64_t v38 = @"NO";
    if (v37) {
      uint64_t v38 = @"YES";
    }
    long long v36 = v38;
  }
  v39 = v36;

  id v7 = v39;
LABEL_30:
  if (!*(unsigned char *)(a1 + 56)) {
    goto LABEL_32;
  }
  uint64_t v40 = +[CPAccNavInfoType stringForUpdateClass:infoType:](CPAccNavInfoType, "stringForUpdateClass:infoType:", objc_opt_class(), [v5 key]);
LABEL_33:
  v41 = (void *)v40;
  if (v7 || *(unsigned char *)(a1 + 57))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 count])
    {
      v42 = *(void **)(a1 + 48);
      v43 = [NSString stringWithFormat:@"%@%@: [", *(void *)(a1 + 32), v41];
      [v42 addObject:v43];

      [*(id *)(a1 + 48) addObjectsFromArray:v7];
      v44 = *(void **)(a1 + 48);
      [NSString stringWithFormat:@"%@]", *(void *)(a1 + 32), v46, v47];
    }
    else
    {
      v44 = *(void **)(a1 + 48);
      [NSString stringWithFormat:@"%@%@: %@", *(void *)(a1 + 32), v41, v7];
    v45 = };
    [v44 addObject:v45];
  }
}

+ (id)_formattedDistanceString:(double)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v4 setNumberStyle:1];
  [v4 setMaximumFractionDigits:a3 < 100.0];
  id v5 = [NSNumber numberWithDouble:a3];
  id v6 = [v4 stringFromNumber:v5];

  return v6;
}

+ (id)copyUpdate:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  id v4 = objc_opt_new();
  id v5 = [(id)objc_opt_class() accNavParameters];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 encodeable])
        {
          uint64_t v11 = [v10 property];
          uint64_t v12 = [v3 valueForKey:v11];

          id v13 = [v10 property];
          [v4 setValue:v12 forKey:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (void)decodeUpdate:(id)a3 withCoder:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v25 = a4;
  id v5 = [(id)objc_opt_class() accNavParameters];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    unint64_t v9 = 0x263EFF000uLL;
    unint64_t v10 = 0x263EFF000uLL;
    do
    {
      uint64_t v11 = 0;
      uint64_t v23 = v7;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * v11);
        if ([v12 encodeable])
        {
          uint64_t v13 = [v12 objcType];
          if ((v13 == objc_opt_class() || v13 == objc_opt_class()) && [v12 collectionGeneric])
          {
            uint64_t v14 = v8;
            long long v15 = *(void **)(v10 + 2568);
            v30[0] = v13;
            v30[1] = [v12 collectionGeneric];
            long long v16 = [*(id *)(v9 + 2240) arrayWithObjects:v30 count:2];
            long long v17 = [v15 setWithArray:v16];
            [v12 property];
            unint64_t v18 = v10;
            v20 = unint64_t v19 = v9;
            uint64_t v21 = [v25 decodeObjectOfClasses:v17 forKey:v20];

            unint64_t v9 = v19;
            unint64_t v10 = v18;

            uint64_t v8 = v14;
            uint64_t v7 = v23;
          }
          else
          {
            long long v16 = [v12 property];
            uint64_t v21 = [v25 decodeObjectOfClass:v13 forKey:v16];
          }

          if (v21)
          {
            BOOL v22 = [v12 property];
            [v24 setValue:v21 forKey:v22];
          }
        }
        ++v11;
      }
      while (v7 != v11);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }
}

+ (void)encodeUpdate:(id)a3 withCoder:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [(id)objc_opt_class() accNavParameters];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 encodeable])
        {
          uint64_t v13 = [v12 property];
          uint64_t v14 = [v5 valueForKey:v13];

          long long v15 = [v12 property];
          [v6 encodeObject:v14 forKey:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

+ (id)accNavInfoWithUpdate:(id)a3 component:(id)a4 customValueBlock:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = objc_opt_new();
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = objc_opt_class();
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__CPAccNavUpdate_accNavInfoWithUpdate_component_customValueBlock___block_invoke;
  v16[3] = &unk_26430AFA8;
  id v19 = v7;
  id v17 = v6;
  id v10 = v8;
  id v18 = v10;
  id v11 = v6;
  id v12 = v7;
  +[CPAccNavUpdate enumerateUpdateClass:v9 paramKeysWithBlock:v16];
  uint64_t v13 = v18;
  id v14 = v10;

  return v14;
}

void __66__CPAccNavUpdate_accNavInfoWithUpdate_component_customValueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (v3
    || (+[CPAccNavUpdate update:*(void *)(a1 + 32) valueForParamKey:v4], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "setInfo:data:", objc_msgSend(v4, "key"), v3);
  }
}

+ (void)_update:(void *)a1 resetValueForParameter:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = [a1 property];
  id v5 = [a1 primaryKey];
  int v6 = [v5 key];
  id v7 = [a1 primaryKey];
  int v8 = 136315906;
  uint64_t v9 = "+[CPAccNavUpdate _update:resetValueForParameter:]";
  __int16 v10 = 2112;
  id v11 = v4;
  __int16 v12 = 1024;
  int v13 = v6;
  __int16 v14 = 2048;
  uint64_t v15 = [v7 accNavType];
  _os_log_error_impl(&dword_2181A5000, a2, OS_LOG_TYPE_ERROR, "%s unexpected nil for %@ primaryKey=%d accNavType=%ld", (uint8_t *)&v8, 0x26u);
}

@end