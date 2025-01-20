@interface SHMediaItemSerialization
+ (BOOL)isInternalMediaItemProperty:(id)a3;
+ (id)dateFormatter;
+ (id)propertiesFromSerializationFormat:(id)a3 error:(id *)a4;
+ (id)serializationFormatForProperties:(id)a3 error:(id *)a4;
+ (id)serializedFormatFromArrayValues:(id)a3 property:(id)a4;
+ (id)transformArrayValue:(id)a3 property:(id)a4 shouldSerialize:(BOOL)a5;
+ (id)transformProperties:(id)a3 toSerializationFormat:(BOOL)a4 error:(id *)a5;
+ (id)transformValue:(id)a3 forProperty:(id)a4 toSerializationFormat:(BOOL)a5 error:(id *)a6;
@end

@implementation SHMediaItemSerialization

+ (id)serializationFormatForProperties:(id)a3 error:(id *)a4
{
  return (id)[a1 transformProperties:a3 toSerializationFormat:1 error:a4];
}

+ (id)propertiesFromSerializationFormat:(id)a3 error:(id *)a4
{
  return (id)[a1 transformProperties:a3 toSerializationFormat:0 error:a4];
}

+ (id)dateFormatter
{
  if (dateFormatter_onceToken != -1) {
    dispatch_once(&dateFormatter_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)dateFormatter_dateFormatter;

  return v2;
}

uint64_t __41__SHMediaItemSerialization_dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F088C0]);
  v1 = (void *)dateFormatter_dateFormatter;
  dateFormatter_dateFormatter = (uint64_t)v0;

  v2 = (void *)dateFormatter_dateFormatter;

  return [v2 setFormatOptions:1907];
}

+ (id)transformProperties:(id)a3 toSerializationFormat:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (([a1 isInternalMediaItemProperty:v14] & 1) == 0)
        {
          v15 = [v9 objectForKeyedSubscript:v14];
          v16 = [a1 transformValue:v15 forProperty:v14 toSerializationFormat:v5 error:a5];

          if (!v16)
          {

            v17 = 0;
            goto LABEL_13;
          }
          [v8 setObject:v16 forKeyedSubscript:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  v17 = (void *)[v8 copy];
LABEL_13:

  return v17;
}

+ (id)transformValue:(id)a3 forProperty:(id)a4 toSerializationFormat:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v26[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  if (!+[SHMediaItemPropertyUtilities isShazamKitDefinedMediaItemProperty:v11])
  {
LABEL_12:
    id v15 = v10;
LABEL_13:
    v16 = v15;
    goto LABEL_17;
  }
  uint64_t v12 = +[SHMediaItemPropertyUtilities typeForShazamKitProperty:v11];
  if (!v7)
  {
    +[SHMediaItemPropertyUtilities jsonRepresentationTypeForProperty:v11];
    if (objc_opt_isKindOfClass())
    {
      if (v12 == (objc_class *)objc_opt_class())
      {
        id v15 = [NSURL URLWithString:v10];
        goto LABEL_13;
      }
      if (v12 == (objc_class *)objc_opt_class())
      {
        v13 = [a1 dateFormatter];
        uint64_t v14 = [v13 dateFromString:v10];
        goto LABEL_24;
      }
LABEL_10:
      if (v12 == (objc_class *)objc_opt_class())
      {
        id v15 = [a1 transformArrayValue:v10 property:v11 shouldSerialize:v7];
        goto LABEL_13;
      }
      if (v12 == (objc_class *)objc_opt_class())
      {
        if (v7)
        {
          id v15 = [v10 UUIDString];
        }
        else
        {
          id v15 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v10];
        }
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    uint64_t v23 = *MEMORY[0x263F07F80];
    v17 = [NSString stringWithFormat:@"Invalid object in catalog for property %@ : %@", v11, v10];
    v24 = v17;
    v18 = NSDictionary;
    v19 = &v24;
    long long v20 = &v23;
LABEL_16:
    long long v21 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];
    +[SHError annotateClientError:a6 code:300 underlyingError:0 keyOverrides:v21];

    v16 = 0;
    goto LABEL_17;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v25 = *MEMORY[0x263F07F80];
    v17 = [NSString stringWithFormat:@"Invalid object in catalog for property %@ : %@", v11, v10];
    v26[0] = v17;
    v18 = NSDictionary;
    v19 = (void **)v26;
    long long v20 = &v25;
    goto LABEL_16;
  }
  if (v12 == (objc_class *)objc_opt_class())
  {
    id v15 = [v10 absoluteString];
    goto LABEL_13;
  }
  if (v12 != (objc_class *)objc_opt_class()) {
    goto LABEL_10;
  }
  v13 = [a1 dateFormatter];
  uint64_t v14 = [v13 stringFromDate:v10];
LABEL_24:
  v16 = (void *)v14;

LABEL_17:

  return v16;
}

+ (id)transformArrayValue:(id)a3 property:(id)a4 shouldSerialize:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = +[SHMediaItemPropertyUtilities categoryForShazamKitProperty:v9];
  if (!v5)
  {
    if (v10 == 8)
    {
      id v27 = v8;
      uint64_t v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v27, "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v13 = v27;
      uint64_t v28 = [v13 countByEnumeratingWithState:&v36 objects:v48 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v37 != v30) {
              objc_enumerationMutation(v13);
            }
            uint64_t v32 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            v33 = [SHSignatureAlignment alloc];
            v34 = -[SHSignatureAlignment initWithSerializedRepresentation:](v33, "initWithSerializedRepresentation:", v32, (void)v36);
            [v12 addObject:v34];
          }
          uint64_t v29 = [v13 countByEnumeratingWithState:&v36 objects:v48 count:16];
        }
        while (v29);
      }
      goto LABEL_32;
    }
    if (v10 == 6)
    {
      id v19 = v8;
      uint64_t v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v19, "count"));
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v13 = v19;
      uint64_t v20 = [v13 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v41 != v22) {
              objc_enumerationMutation(v13);
            }
            v24 = [[SHRange alloc] initWithSerializedRepresentation:*(void *)(*((void *)&v40 + 1) + 8 * j)];
            [v12 addObject:v24];
          }
          uint64_t v21 = [v13 countByEnumeratingWithState:&v40 objects:v49 count:16];
        }
        while (v21);
      }
      goto LABEL_32;
    }
    goto LABEL_22;
  }
  if (v10 == 8)
  {
    id v25 = [a1 serializedFormatFromArrayValues:v8 property:v9];
    goto LABEL_24;
  }
  if (v10 != 6)
  {
LABEL_22:
    id v25 = v8;
LABEL_24:
    v26 = v25;
    goto LABEL_33;
  }
  id v11 = v8;
  uint64_t v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v45;
    do
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v44 + 1) + 8 * k) serializedRepresentation];
        [v12 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v15);
  }
LABEL_32:

  v26 = (void *)[v12 copy];
LABEL_33:

  return v26;
}

+ (id)serializedFormatFromArrayValues:(id)a3 property:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  if (+[SHMediaItemPropertyUtilities categoryForShazamKitProperty:v6] == 8)
  {
    id v8 = v5;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) serializedRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Attempting to serialize a custom array containing objects that aren't ShazamKit defined."];
  }
  uint64_t v14 = (void *)[v7 copy];

  return v14;
}

+ (BOOL)isInternalMediaItemProperty:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v7 = @"sh_identifier";
  id v8 = @"sh_providerIdentifier";
  uint64_t v9 = @"sh_score";
  v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a3;
  id v5 = [v3 arrayWithObjects:&v7 count:3];
  LOBYTE(v3) = objc_msgSend(v5, "containsObject:", v4, v7, v8, v9, v10);

  return (char)v3;
}

@end