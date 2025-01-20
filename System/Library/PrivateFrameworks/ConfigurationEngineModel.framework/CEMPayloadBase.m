@interface CEMPayloadBase
+ (BOOL)supportsSecureCoding;
+ (id)load:(id)a3 error:(id *)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMPayloadBase)initWithCoder:(id)a3;
- (NSSet)unknownPayloadKeys;
- (id)_loadObjectOfClass:(Class)a3 fromDictionary:(id)a4 withKey:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createNestedObjectWithClass:(Class)a3 withParentKey:(id)a4 withPayload:(id)a5 error:(id *)a6;
- (id)loadArrayFromDictionary:(id)a3 withKey:(id)a4 classType:(Class)a5 nested:(BOOL)a6 isRequired:(BOOL)a7 defaultValue:(id)a8 error:(id *)a9;
- (id)loadArrayFromDictionary:(id)a3 withKey:(id)a4 validator:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8;
- (id)loadBooleanFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7;
- (id)loadDataFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7;
- (id)loadDateFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7;
- (id)loadDictionaryFromDictionary:(id)a3 withKey:(id)a4 classType:(Class)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8;
- (id)loadFloatFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7;
- (id)loadIntegerFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7;
- (id)loadStringFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7;
- (id)serializePayload;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)_serializeItemIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 isDefaultValue:(BOOL)a7;
- (void)encodeWithCoder:(id)a3;
- (void)mergeUnknownKeysFrom:(id)a3 withParentKey:(id)a4;
- (void)serializeArrayIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 itemSerializer:(id)a6 isRequired:(BOOL)a7 defaultValue:(id)a8;
- (void)serializeAssetIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 assetProvider:(id)a6 transformType:(id)a7 isRequired:(BOOL)a8 defaultValue:(id)a9;
- (void)serializeBooleanIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7;
- (void)serializeDataIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7;
- (void)serializeDateIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7;
- (void)serializeDictionaryIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 dictSerializer:(id)a6 isRequired:(BOOL)a7 defaultValue:(id)a8;
- (void)serializeFloatIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7;
- (void)serializeIntegerIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7;
- (void)serializeStringIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7;
@end

@implementation CEMPayloadBase

- (id)_loadObjectOfClass:(Class)a3 fromDictionary:(id)a4 withKey:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  v25[1] = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a7;
  id v14 = [a4 objectForKey:v12];
  if (!v14)
  {
    if (v10)
    {
      if (a8)
      {
        v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v24 = *MEMORY[0x263F08320];
        v16 = [NSString stringWithFormat:@"Missing required key: %@", v12];
        v25[0] = v16;
        v17 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
        *a8 = [v15 errorWithDomain:@"error" code:1 userInfo:v17];

        a8 = 0;
      }
      id v14 = 0;
      goto LABEL_10;
    }
    id v14 = v13;
    if (!v14) {
      goto LABEL_3;
    }
  }
  if (objc_opt_isKindOfClass())
  {
LABEL_3:
    a8 = (id *)v14;
    id v14 = a8;
    goto LABEL_10;
  }
  if (a8)
  {
    v18 = (void *)MEMORY[0x263F087E8];
    v19 = [NSString stringWithFormat:@"Wrong type, key: %@", v12, *MEMORY[0x263F08320]];
    v23 = v19;
    v20 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    *a8 = [v18 errorWithDomain:@"error" code:1 userInfo:v20];

    a8 = 0;
  }
LABEL_10:

  return a8;
}

- (id)loadStringFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7
{
  BOOL v8 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(CEMPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v14 withKey:v13 isRequired:v8 defaultValue:v12 error:a7];

  return v15;
}

- (void).cxx_destruct
{
}

- (id)loadArrayFromDictionary:(id)a3 withKey:(id)a4 validator:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  v16 = (uint64_t (**)(id, void, id *))a5;
  id v17 = a7;
  v18 = [(CEMPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v14 withKey:v15 isRequired:v10 defaultValue:v17 error:a8];
  v19 = v18;
  if (v18)
  {
    id v34 = v17;
    id v35 = v15;
    id v36 = v14;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      v23 = 0;
      uint64_t v24 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v39 != v24) {
            objc_enumerationMutation(v20);
          }
          if (v16)
          {
            uint64_t v26 = *(void *)(*((void *)&v38 + 1) + 8 * i);
            id v37 = v23;
            char v27 = v16[2](v16, v26, &v37);
            id v28 = v37;

            if ((v27 & 1) == 0)
            {
              id v15 = v35;
              id v14 = v36;
              id v17 = v34;
              if (a8)
              {
                if (v28)
                {
                  *a8 = v28;
                }
                else
                {
                  v33 = (void *)MEMORY[0x263F087E8];
                  uint64_t v42 = *MEMORY[0x263F08320];
                  v30 = [NSString stringWithFormat:@"Wrong array item type, key: %@", v35];
                  v43 = v30;
                  v31 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
                  *a8 = [v33 errorWithDomain:@"error" code:1 userInfo:v31];
                }
              }

              id v29 = 0;
              goto LABEL_21;
            }
            v23 = v28;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v38 objects:v44 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }
    else
    {
      v23 = 0;
    }

    id v29 = v20;
    id v28 = v23;
    id v15 = v35;
    id v14 = v36;
    id v17 = v34;
LABEL_21:
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

- (void)mergeUnknownKeysFrom:(id)a3 withParentKey:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 unknownPayloadKeys];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v21 = self;
    BOOL v10 = (void *)MEMORY[0x263EFF9C0];
    v11 = [v6 unknownPayloadKeys];
    id v12 = objc_msgSend(v10, "setWithCapacity:", objc_msgSend(v11, "count"));

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = [v6 unknownPayloadKeys];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [NSString stringWithFormat:@"%@.%@", v7, *(void *)(*((void *)&v22 + 1) + 8 * v17)];
          [v12 addObject:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    uint64_t v19 = [(NSSet *)v21->_unknownPayloadKeys setByAddingObjectsFromSet:v12];
    unknownPayloadKeys = v21->_unknownPayloadKeys;
    v21->_unknownPayloadKeys = (NSSet *)v19;
  }
}

- (id)createNestedObjectWithClass:(Class)a3 withParentKey:(id)a4 withPayload:(id)a5 error:(id *)a6
{
  v18[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  v11 = [(objc_class *)a3 load:a5 error:a6];
  if (v11)
  {
    [(CEMPayloadBase *)self mergeUnknownKeysFrom:v11 withParentKey:v10];
    id v12 = v11;
  }
  else if (a6)
  {
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = [NSString stringWithFormat:@"Wrong nested item, key: %@", v10, *MEMORY[0x263F08320]];
    v18[0] = v14;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    *a6 = [v13 errorWithDomain:@"error" code:1 userInfo:v15];
  }

  return v11;
}

+ (id)load:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  LODWORD(a4) = [v6 loadPayload:v5 error:a4];

  if (a4) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)loadIntegerFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7
{
  BOOL v8 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [(CEMPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v14 withKey:v13 isRequired:v8 defaultValue:v12 error:a7];

  if (v15)
  {
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "integerValue"));
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)loadFloatFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7
{
  BOOL v8 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [(CEMPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v14 withKey:v13 isRequired:v8 defaultValue:v12 error:a7];

  if (v15)
  {
    uint64_t v16 = NSNumber;
    [v15 floatValue];
    uint64_t v17 = objc_msgSend(v16, "numberWithFloat:");
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)loadBooleanFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7
{
  BOOL v8 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [(CEMPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v14 withKey:v13 isRequired:v8 defaultValue:v12 error:a7];

  if (v15)
  {
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v15, "BOOLValue"));
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)loadDateFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7
{
  BOOL v8 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [(CEMPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v14 withKey:v13 isRequired:v8 defaultValue:v12 error:a7];

  return v15;
}

- (id)loadDataFromDictionary:(id)a3 withKey:(id)a4 isRequired:(BOOL)a5 defaultValue:(id)a6 error:(id *)a7
{
  BOOL v8 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [(CEMPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v14 withKey:v13 isRequired:v8 defaultValue:v12 error:a7];

  return v15;
}

- (id)loadArrayFromDictionary:(id)a3 withKey:(id)a4 classType:(Class)a5 nested:(BOOL)a6 isRequired:(BOOL)a7 defaultValue:(id)a8 error:(id *)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  v18 = [(CEMPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v15 withKey:v16 isRequired:v10 defaultValue:v17 error:a9];
  uint64_t v19 = v18;
  if (v18)
  {
    id v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obuint64_t j = v19;
    uint64_t v42 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v50;
      long long v39 = v19;
      long long v40 = v20;
      BOOL v41 = v11;
      id v36 = v17;
      id v37 = v15;
      while (2)
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v50 != v43) {
            objc_enumerationMutation(obj);
          }
          long long v22 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if (v11)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a9)
              {
                id v35 = (void *)MEMORY[0x263F087E8];
                uint64_t v54 = *MEMORY[0x263F08320];
                long long v23 = [NSString stringWithFormat:@"Wrong array item type, key: %@", v16];
                v55 = v23;
                id v24 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
                *a9 = [v35 errorWithDomain:@"error" code:1 userInfo:v24];
LABEL_25:

                id v20 = v40;
              }
LABEL_26:

              v33 = 0;
              id v17 = v36;
              id v15 = v37;
              goto LABEL_27;
            }
            uint64_t v38 = i;
            long long v23 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v22, "count"));
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v24 = v22;
            uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v53 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v46;
              while (2)
              {
                for (uint64_t j = 0; j != v26; ++j)
                {
                  if (*(void *)v46 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v29 = [(CEMPayloadBase *)self createNestedObjectWithClass:a5 withParentKey:v16 withPayload:*(void *)(*((void *)&v45 + 1) + 8 * j) error:a9];
                  if (!v29)
                  {
                    uint64_t v19 = v39;
                    goto LABEL_25;
                  }
                  v30 = (void *)v29;
                  [v23 addObject:v29];
                }
                uint64_t v26 = [v24 countByEnumeratingWithState:&v45 objects:v53 count:16];
                if (v26) {
                  continue;
                }
                break;
              }
            }

            v31 = (void *)[v23 copy];
            id v20 = v40;
            [v40 addObject:v31];

            uint64_t i = v38;
            uint64_t v19 = v39;
          }
          else
          {
            uint64_t v32 = [(CEMPayloadBase *)self createNestedObjectWithClass:a5 withParentKey:v16 withPayload:*(void *)(*((void *)&v49 + 1) + 8 * i) error:a9];
            if (!v32) {
              goto LABEL_26;
            }
            long long v23 = (void *)v32;
            [v20 addObject:v32];
          }

          BOOL v11 = v41;
        }
        id v17 = v36;
        id v15 = v37;
        uint64_t v42 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
        if (v42) {
          continue;
        }
        break;
      }
    }

    v33 = (void *)[v20 copy];
LABEL_27:
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (id)loadDictionaryFromDictionary:(id)a3 withKey:(id)a4 classType:(Class)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a4;
  id v15 = a7;
  id v16 = a3;
  id v17 = [(CEMPayloadBase *)self _loadObjectOfClass:objc_opt_class() fromDictionary:v16 withKey:v14 isRequired:v10 defaultValue:v15 error:a8];

  if (v17)
  {
    v18 = [(CEMPayloadBase *)self createNestedObjectWithClass:a5 withParentKey:v14 withPayload:v17 error:a8];
    uint64_t v19 = v18;
    if (v18) {
      id v20 = v18;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (id)serializePayload
{
  return [(CEMPayloadBase *)self serializePayloadWithAssetProviders:0];
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  return (id)MEMORY[0x263EFFA78];
}

- (void)_serializeItemIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 isDefaultValue:(BOOL)a7
{
  BOOL v7 = !a7;
  if (!a5) {
    BOOL v7 = 0;
  }
  if (v7 || a6) {
    [a3 setObject:a5 forKeyedSubscript:a4];
  }
}

- (void)serializeStringIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  -[CEMPayloadBase _serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:", v14, v13, v12, v8, [v12 isEqual:a7]);
}

- (void)serializeIntegerIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  BOOL v8 = a6;
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v13)
  {
    id v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "integerValue"));
  }
  else
  {
    id v15 = 0;
  }
  -[CEMPayloadBase _serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:", v16, v12, v15, v8, [v13 isEqual:v14]);
}

- (void)serializeFloatIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  BOOL v8 = a6;
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v13)
  {
    id v15 = NSNumber;
    [v13 floatValue];
    id v16 = objc_msgSend(v15, "numberWithFloat:");
  }
  else
  {
    id v16 = 0;
  }
  -[CEMPayloadBase _serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:", v17, v12, v16, v8, [v13 isEqual:v14]);
}

- (void)serializeBooleanIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  BOOL v8 = a6;
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v13)
  {
    id v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
  }
  else
  {
    id v15 = 0;
  }
  -[CEMPayloadBase _serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:", v16, v12, v15, v8, [v13 isEqual:v14]);
}

- (void)serializeDateIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  -[CEMPayloadBase _serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:", v14, v13, v12, v8, [v12 isEqual:a7]);
}

- (void)serializeDataIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  -[CEMPayloadBase _serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:", v14, v13, v12, v8, [v12 isEqual:a7]);
}

- (void)serializeArrayIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 itemSerializer:(id)a6 isRequired:(BOOL)a7 defaultValue:(id)a8
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = (void (**)(id, void))a6;
  id v17 = a8;
  v18 = v17;
  if (v15)
  {
    id v27 = v17;
    BOOL v28 = a7;
    id v29 = v13;
    uint64_t v19 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v20 = v15;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v31;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = v16[2](v16, *(void *)(*((void *)&v30 + 1) + 8 * v24));
          [v19 addObject:v25];

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v22);
    }

    id v13 = v29;
    v18 = v27;
    if (v28) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if (a7)
    {
LABEL_13:
      uint64_t v26 = (void *)[v19 copy];
      [v13 setObject:v26 forKeyedSubscript:v14];

      goto LABEL_14;
    }
  }
  if (v19) {
    goto LABEL_13;
  }
LABEL_14:
}

- (void)serializeDictionaryIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 dictSerializer:(id)a6 isRequired:(BOOL)a7 defaultValue:(id)a8
{
  id v18 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, id))a6;
  id v16 = a8;
  if (v14)
  {
    id v17 = v15[2](v15, v14);
    if (a7) {
      goto LABEL_6;
    }
LABEL_5:
    if (!v17) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v17 = 0;
  if (!a7) {
    goto LABEL_5;
  }
LABEL_6:
  [v18 setObject:v17 forKeyedSubscript:v13];
LABEL_7:
}

- (void)serializeAssetIntoDictionary:(id)a3 withKey:(id)a4 withValue:(id)a5 assetProvider:(id)a6 transformType:(id)a7 isRequired:(BOOL)a8 defaultValue:(id)a9
{
  BOOL v9 = a8;
  id v21 = a6;
  id v15 = a7;
  id v16 = a9;
  id v17 = a4;
  id v18 = a3;
  if (!v21)
  {
    [(CEMPayloadBase *)self serializeStringIntoDictionary:v18 withKey:v17 withValue:a5 isRequired:v9 defaultValue:v16];
    goto LABEL_11;
  }
  if ([v15 isEqual:&stru_26C838878])
  {
    id v19 = v16;
  }
  else if ([v15 isEqual:@"<data>"])
  {
    id v19 = [v21 dataRepresentation];
  }
  else
  {
    if (![v15 isEqual:@"<url>"])
    {
      id v20 = 0;
      goto LABEL_10;
    }
    id v19 = [v21 urlRepresentation];
  }
  id v20 = v19;
LABEL_10:
  -[CEMPayloadBase _serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:withKey:withValue:isRequired:isDefaultValue:", v18, v17, v20, v9, [v20 isEqual:v16]);

  id v17 = v18;
  id v18 = v20;
LABEL_11:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CEMPayloadBase *)self serializePayload];
  [v4 encodeObject:v5 forKey:@"payload"];
}

- (CEMPayloadBase)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CEMPayloadBase;
  id v5 = [(CEMPayloadBase *)&v22 init];
  if (!v5) {
    goto LABEL_3;
  }
  id v20 = (void *)MEMORY[0x263EFFA08];
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  id v14 = objc_msgSend(v20, "setWithObjects:", v19, v18, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  id v15 = [v4 decodeObjectOfClasses:v14 forKey:@"payload"];
  uint64_t v21 = 0;
  LODWORD(v13) = [(CEMPayloadBase *)v5 loadPayload:v15 error:&v21];

  id v16 = 0;
  if (v13) {
LABEL_3:
  }
    id v16 = v5;

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();

  return (id)objc_opt_new();
}

- (NSSet)unknownPayloadKeys
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

@end