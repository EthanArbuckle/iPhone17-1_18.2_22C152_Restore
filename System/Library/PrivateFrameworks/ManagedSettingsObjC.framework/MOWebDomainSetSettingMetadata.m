@interface MOWebDomainSetSettingMetadata
- (NSSet)defaultValue;
- (id)persistableValueFromValue:(id)a3;
- (id)sanitizePersistableValue:(id)a3;
- (id)valueFromPersistableValue:(id)a3;
@end

@implementation MOWebDomainSetSettingMetadata

- (id)valueFromPersistableValue:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = +[MOWebDomain initializeWithPersistableValue:](MOWebDomain, "initializeWithPersistableValue:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          if (v11) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    v12 = (void *)[v5 copy];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)persistableValueFromValue:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v12 = objc_msgSend(v11, "persistableValue", (void)v15);
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    v13 = (void *)[v5 copy];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSSet)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)MOWebDomainSetSettingMetadata;
  v2 = [(MOSetSettingMetadata *)&v4 defaultValue];
  return (NSSet *)v2;
}

- (id)sanitizePersistableValue:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)MOWebDomainSetSettingMetadata;
  id v3 = [(MOSetSettingMetadata *)&v17 sanitizePersistableValue:a3];
  if (v3)
  {
    objc_super v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
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
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (+[MOWebDomain isValidPersistableRepresentation:](MOWebDomain, "isValidPersistableRepresentation:", v10, (void)v13))
          {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v7);
    }

    v11 = (void *)[v4 copy];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end