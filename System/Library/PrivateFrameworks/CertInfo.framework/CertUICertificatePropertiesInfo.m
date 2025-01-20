@interface CertUICertificatePropertiesInfo
- (CertUICertificatePropertiesInfo)initWithCertificate:(__SecCertificate *)a3;
- (CertUICertificatePropertiesInfo)initWithCertificateProperties:(id)a3;
- (CertUICertificatePropertiesInfo)initWithSendableCertificateProperties:(id)a3;
- (CertUICertificatePropertiesInfo)initWithTrust:(__SecTrust *)a3;
- (NSArray)sectionTitles;
- (NSArray)sections;
- (id)_cellInfosForSection:(id)a3;
- (id)_copyPropertiesFromTrust:(__SecTrust *)a3;
- (id)_sectionInfoForCertSection:(id)a3 title:(id)a4;
- (id)_sectionsFromProperties:(id)a3;
- (id)_sendablePropertiesFromProperties:(id)a3;
- (id)_sendablePropertiesFromTrust:(__SecTrust *)a3;
- (id)_sendablePropertyFromProperty:(id)a3;
- (void)_setup:(id)a3;
- (void)setSectionTitles:(id)a3;
- (void)setSections:(id)a3;
@end

@implementation CertUICertificatePropertiesInfo

- (CertUICertificatePropertiesInfo)initWithCertificate:(__SecCertificate *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CertUICertificatePropertiesInfo;
  v3 = [(CertUICertificatePropertiesInfo *)&v8 init];
  if (v3)
  {
    id v4 = (id)SecCertificateCopyProperties();
    v5 = [(CertUICertificatePropertiesInfo *)v3 _sendablePropertiesFromProperties:v4];
    v6 = [(CertUICertificatePropertiesInfo *)v3 _sectionsFromProperties:v5];

    [(CertUICertificatePropertiesInfo *)v3 _setup:v6];
    CFRelease(v4);
  }
  return v3;
}

- (CertUICertificatePropertiesInfo)initWithCertificateProperties:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CertUICertificatePropertiesInfo;
  v5 = [(CertUICertificatePropertiesInfo *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(CertUICertificatePropertiesInfo *)v5 _sendablePropertiesFromProperties:v4];
    objc_super v8 = [(CertUICertificatePropertiesInfo *)v6 _sectionsFromProperties:v7];

    [(CertUICertificatePropertiesInfo *)v6 _setup:v8];
  }

  return v6;
}

- (CertUICertificatePropertiesInfo)initWithSendableCertificateProperties:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CertUICertificatePropertiesInfo;
  v5 = [(CertUICertificatePropertiesInfo *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(CertUICertificatePropertiesInfo *)v5 _sectionsFromProperties:v4];
    [(CertUICertificatePropertiesInfo *)v6 _setup:v7];
  }
  return v6;
}

- (CertUICertificatePropertiesInfo)initWithTrust:(__SecTrust *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CertUICertificatePropertiesInfo;
  id v4 = [(CertUICertificatePropertiesInfo *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v6 = [(CertUICertificatePropertiesInfo *)v4 _sendablePropertiesFromTrust:a3];
    v7 = [v6 firstObject];
    objc_super v8 = [(CertUICertificatePropertiesInfo *)v5 _sectionsFromProperties:v7];
    [(CertUICertificatePropertiesInfo *)v5 _setup:v8];
  }
  return v5;
}

- (void)_setup:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v24 = objc_opt_new();
  v23 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v3;
  uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v6 = objc_opt_new();
        v27 = v5;
        v7 = [v5 objectForKey:@"cell infos"];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v29;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v29 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = *(void **)(*((void *)&v28 + 1) + 8 * j);
              v13 = [v12 objectForKey:@"cell title"];
              uint64_t v14 = [v12 objectForKey:@"cell value"];
              v15 = (void *)v14;
              if (v13) {
                BOOL v16 = v14 == 0;
              }
              else {
                BOOL v16 = 1;
              }
              if (!v16)
              {
                [v6 addObject:v13];
                [v6 addObject:v15];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v9);
        }
        if ([v6 count])
        {
          [v24 addObject:v6];
          uint64_t v17 = [v27 objectForKey:@"header title"];
          v18 = (void *)v17;
          v19 = &stru_26C9B5AF8;
          if (v17) {
            v19 = (__CFString *)v17;
          }
          v20 = v19;

          [v23 addObject:v20];
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v26);
  }

  if ([v24 count])
  {
    objc_storeStrong((id *)&self->_sections, v24);
    objc_storeStrong((id *)&self->_sectionTitles, v23);
  }
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
  obuint64_t j = v3;
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
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        uint64_t v10 = [v9 objectForKey:@"localized label"];
        v11 = [v9 objectForKey:@"type"];
        v12 = [v9 objectForKey:@"value"];
        if ([v11 isEqualToString:@"section"])
        {
          v13 = [(CertUICertificatePropertiesInfo *)self _cellInfosForSection:v12];
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
          v13 = v14;
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
  uint64_t v8 = [(CertUICertificatePropertiesInfo *)self _cellInfosForSection:a3];
  uint64_t v9 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v8, @"cell infos", v7, @"header title", 0);

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
  obuint64_t j = v3;
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
        uint64_t v9 = objc_msgSend(v8, "objectForKey:", @"localized label", v15);
        uint64_t v10 = [v8 objectForKey:@"type"];
        v11 = [v8 objectForKey:@"value"];
        if ([v10 isEqualToString:@"section"])
        {
          v12 = [(CertUICertificatePropertiesInfo *)v15 _sectionInfoForCertSection:v11 title:v9];
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
    v13 = [(CertUICertificatePropertiesInfo *)v15 _sectionInfoForCertSection:v16 title:0];
    [v17 addObject:v13];
  }
  return v17;
}

- (id)_sendablePropertyFromProperty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x263F174D8]];
  if ([v5 isEqualToString:*MEMORY[0x263F17508]])
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];

    uint64_t v7 = *MEMORY[0x263F174E0];
    uint64_t v8 = [v4 objectForKey:*MEMORY[0x263F174E0]];
    uint64_t v9 = [v8 absoluteString];
  }
  else
  {
    uint64_t v6 = v4;
    if (![v5 isEqualToString:*MEMORY[0x263F174F8]]) {
      goto LABEL_6;
    }
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];

    uint64_t v7 = *MEMORY[0x263F174E0];
    uint64_t v8 = [v4 objectForKey:*MEMORY[0x263F174E0]];
    uint64_t v9 = [(CertUICertificatePropertiesInfo *)self _sendablePropertiesFromProperties:v8];
  }
  uint64_t v10 = (void *)v9;
  [v6 setObject:v9 forKey:v7];

LABEL_6:
  return v6;
}

- (id)_sendablePropertiesFromProperties:(id)a3
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
        v11 = -[CertUICertificatePropertiesInfo _sendablePropertyFromProperty:](self, "_sendablePropertyFromProperty:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
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
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = [(CertUICertificatePropertiesInfo *)self _copyPropertiesFromTrust:a3];
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
        v11 = -[CertUICertificatePropertiesInfo _sendablePropertiesFromProperties:](self, "_sendablePropertiesFromProperties:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end