@interface DMCCertificateProperties
+ (id)_sendablePropertyFromProperty:(id)a3;
+ (id)sendablePropertiesFromProperties:(id)a3;
- (DMCCertificateProperties)initWithCertificate:(__SecCertificate *)a3;
- (DMCCertificateProperties)initWithCertificateProperties:(id)a3;
- (DMCCertificateProperties)initWithTrust:(__SecTrust *)a3;
- (NSArray)keyValueSections;
- (NSArray)sectionTitles;
- (NSArray)sections;
- (id)_cellInfosForSection:(id)a3;
- (id)_copyPropertiesFromTrust:(__SecTrust *)a3;
- (id)_sectionInfoForCertSection:(id)a3 title:(id)a4;
- (id)_sectionsFromProperties:(id)a3;
- (id)_sendablePropertiesFromTrust:(__SecTrust *)a3;
- (void)_setup:(id)a3;
- (void)setKeyValueSections:(id)a3;
- (void)setSectionTitles:(id)a3;
- (void)setSections:(id)a3;
@end

@implementation DMCCertificateProperties

- (DMCCertificateProperties)initWithCertificate:(__SecCertificate *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMCCertificateProperties;
  v3 = [(DMCCertificateProperties *)&v6 init];
  if (v3)
  {
    id v4 = (id)SecCertificateCopyProperties();
    [(DMCCertificateProperties *)v3 _setup:v4];
    CFRelease(v4);
  }
  return v3;
}

- (DMCCertificateProperties)initWithCertificateProperties:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMCCertificateProperties;
  v5 = [(DMCCertificateProperties *)&v8 init];
  objc_super v6 = v5;
  if (v5) {
    [(DMCCertificateProperties *)v5 _setup:v4];
  }

  return v6;
}

- (DMCCertificateProperties)initWithTrust:(__SecTrust *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DMCCertificateProperties;
  id v4 = [(DMCCertificateProperties *)&v10 init];
  v5 = v4;
  if (v4)
  {
    objc_super v6 = [(DMCCertificateProperties *)v4 _sendablePropertiesFromTrust:a3];
    v7 = [v6 lastObject];
    objc_super v8 = [(DMCCertificateProperties *)v5 _sectionsFromProperties:v7];
    [(DMCCertificateProperties *)v5 _setup:v8];
  }
  return v5;
}

- (void)_setup:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = +[DMCCertificateProperties sendablePropertiesFromProperties:a3];
  v29 = self;
  v5 = [(DMCCertificateProperties *)self _sectionsFromProperties:v4];

  v33 = objc_opt_new();
  v32 = objc_opt_new();
  v31 = (NSArray *)objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v5;
  uint64_t v35 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v44;
    objc_super v6 = @"cell title";
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v44 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v7;
        objc_super v8 = *(void **)(*((void *)&v43 + 1) + 8 * v7);
        v9 = objc_opt_new();
        objc_super v10 = objc_opt_new();
        v36 = v8;
        v11 = [v8 objectForKey:@"cell infos"];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v38 = v11;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v40 != v14) {
                objc_enumerationMutation(v38);
              }
              v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              v17 = [v16 objectForKey:v6];
              uint64_t v18 = [v16 objectForKey:@"cell value"];
              v19 = (void *)v18;
              if (v17) {
                BOOL v20 = v18 == 0;
              }
              else {
                BOOL v20 = 1;
              }
              if (!v20)
              {
                [v9 addObject:v17];
                [v9 addObject:v19];
                v21 = v6;
                v22 = (void *)[objc_alloc(MEMORY[0x263F53C08]) initWithValue:v19 localizedKey:v17];
                [v10 addObject:v22];

                objc_super v6 = v21;
              }
            }
            uint64_t v13 = [v38 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v13);
        }
        if ([v9 count])
        {
          [v33 addObject:v9];
          uint64_t v23 = [v36 objectForKey:@"header title"];
          v24 = (void *)v23;
          v25 = &stru_26D435FC0;
          if (v23) {
            v25 = (__CFString *)v23;
          }
          v26 = v25;

          [v32 addObject:v26];
          v27 = (void *)[objc_alloc(MEMORY[0x263F53C10]) initWithSectionTitle:v26 footer:0 keyValues:v10];

          [(NSArray *)v31 addObject:v27];
        }

        uint64_t v7 = v37 + 1;
      }
      while (v37 + 1 != v35);
      uint64_t v35 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v35);
  }

  if ([v33 count])
  {
    objc_storeStrong((id *)&v29->_sections, v33);
    objc_storeStrong((id *)&v29->_sectionTitles, v32);
  }
  keyValueSections = v29->_keyValueSections;
  v29->_keyValueSections = v31;
}

- (id)_cellInfosForSection:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        objc_super v10 = [v9 objectForKey:@"localized label"];
        v11 = [v9 objectForKey:@"type"];
        uint64_t v12 = [v9 objectForKey:@"value"];
        if ([v11 isEqualToString:@"section"])
        {
          uint64_t v13 = [(DMCCertificateProperties *)self _cellInfosForSection:v12];
          [v4 addObjectsFromArray:v13];
        }
        else
        {
          if (([v11 isEqualToString:@"string"] & 1) != 0
            || [v11 isEqualToString:@"url"]
            || [v11 isEqualToString:@"data"]
            || [v11 isEqualToString:@"date"])
          {
            id v14 = v12;
          }
          else
          {
            id v14 = [v12 description];
          }
          uint64_t v13 = v14;
          v15 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v10, @"cell title", v14, @"cell value", 0);
          [v4 addObject:v15];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v16 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v6 = v16;
    }
    while (v16);
  }

  return v4;
}

- (id)_sectionInfoForCertSection:(id)a3 title:(id)a4
{
  uint64_t v6 = NSDictionary;
  id v7 = a4;
  uint64_t v8 = [(DMCCertificateProperties *)self _cellInfosForSection:a3];
  v9 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v8, @"cell infos", v7, @"header title", 0);

  return v9;
}

- (id)_sectionsFromProperties:(id)a3
{
  v15 = self;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v17 = [MEMORY[0x263EFF980] array];
  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "objectForKey:", @"localized label", v15);
        objc_super v10 = [v8 objectForKey:@"type"];
        v11 = [v8 objectForKey:@"value"];
        if ([v10 isEqualToString:@"section"])
        {
          uint64_t v12 = [(DMCCertificateProperties *)v15 _sectionInfoForCertSection:v11 title:v9];
          [v17 addObject:v12];
        }
        else
        {
          [v16 addObject:v8];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  if ([v16 count])
  {
    uint64_t v13 = [(DMCCertificateProperties *)v15 _sectionInfoForCertSection:v16 title:0];
    [v17 addObject:v13];
  }
  return v17;
}

+ (id)sendablePropertiesFromProperties:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
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
        v11 = objc_msgSend(a1, "_sendablePropertyFromProperty:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)_sendablePropertyFromProperty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x263F174D8]];
  if ([v5 isEqualToString:*MEMORY[0x263F17508]])
  {
    id v6 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];

    uint64_t v7 = *MEMORY[0x263F174E0];
    uint64_t v8 = [v4 objectForKey:*MEMORY[0x263F174E0]];
    uint64_t v9 = [v8 absoluteString];
  }
  else
  {
    id v6 = v4;
    if (![v5 isEqualToString:*MEMORY[0x263F174F8]]) {
      goto LABEL_6;
    }
    id v6 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];

    uint64_t v7 = *MEMORY[0x263F174E0];
    uint64_t v8 = [v4 objectForKey:*MEMORY[0x263F174E0]];
    uint64_t v9 = [a1 sendablePropertiesFromProperties:v8];
  }
  objc_super v10 = (void *)v9;
  [v6 setObject:v9 forKey:v7];

LABEL_6:
  return v6;
}

- (id)_copyPropertiesFromTrust:(__SecTrust *)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  int CertificateCount = SecTrustGetCertificateCount(a3);
  if (CertificateCount >= 1)
  {
    CFIndex v6 = 0;
    uint64_t v7 = CertificateCount;
    do
    {
      SecTrustGetCertificateAtIndex(a3, v6);
      uint64_t v8 = SecCertificateCopyProperties();
      if (v8)
      {
        uint64_t v9 = (const void *)v8;
        [v4 addObject:v8];
        CFRelease(v9);
      }
      ++v6;
    }
    while (v7 != v6);
  }
  return v4;
}

- (id)_sendablePropertiesFromTrust:(__SecTrust *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(DMCCertificateProperties *)self _copyPropertiesFromTrust:a3];
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = +[DMCCertificateProperties sendablePropertiesFromProperties:](DMCCertificateProperties, "sendablePropertiesFromProperties:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (NSArray)sectionTitles
{
  return self->_sectionTitles;
}

- (void)setSectionTitles:(id)a3
{
}

- (NSArray)keyValueSections
{
  return self->_keyValueSections;
}

- (void)setKeyValueSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueSections, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end