@interface _HKXMLExtractorElement
- (BOOL)matchesElement:(id)a3;
- (NSDictionary)specificationAttributes;
- (NSString)specificationElement;
- (_HKXMLExtractorElement)initWithElementName:(id)a3 attributes:(id)a4;
- (_HKXMLExtractorElement)initWithTagSpecification:(id)a3;
@end

@implementation _HKXMLExtractorElement

- (_HKXMLExtractorElement)initWithTagSpecification:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_HKXMLExtractorElement;
  v6 = [(_HKXMLExtractorElement *)&v29 init];
  if (v6)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28B88], "hk_percentCharacterSet");
    v8 = [v5 componentsSeparatedByCharactersInSet:v7];
    uint64_t v9 = [v8 count];
    if (v9 >= 2)
    {
      uint64_t v10 = v9;
      v26 = v7;
      id v28 = v5;
      uint64_t v11 = [v8 objectAtIndexedSubscript:0];
      specificationElement = v6->_specificationElement;
      v27 = v6;
      v6->_specificationElement = (NSString *)v11;

      v13 = objc_msgSend(MEMORY[0x1E4F28B88], "hk_equalCharacterSet");
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v15 = 1;
      while (1)
      {
        v16 = [v8 objectAtIndexedSubscript:v15];
        v17 = [v16 componentsSeparatedByCharactersInSet:v13];
        uint64_t v18 = [v17 count];
        if (v18 == 2)
        {
          uint64_t v19 = [v17 objectAtIndexedSubscript:1];
        }
        else
        {
          if (v18 != 1)
          {
            v20 = objc_msgSend(v17, "subarrayWithRange:", 1, objc_msgSend(v17, "count") - 1);
            v21 = [v20 componentsJoinedByString:@"="];
            v22 = [v17 objectAtIndexedSubscript:0];
            [v14 setObject:v21 forKey:v22];

            goto LABEL_10;
          }
          uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
        }
        v20 = (void *)v19;
        v21 = [v17 objectAtIndexedSubscript:0];
        [v14 setObject:v20 forKey:v21];
LABEL_10:

        if (v10 == ++v15)
        {
          uint64_t v23 = [v14 copy];
          v6 = v27;
          specificationAttributes = v27->_specificationAttributes;
          v27->_specificationAttributes = (NSDictionary *)v23;

          id v5 = v28;
          v7 = v26;
          goto LABEL_13;
        }
      }
    }
    objc_storeStrong((id *)&v6->_specificationElement, a3);
    v13 = v6->_specificationAttributes;
    v6->_specificationAttributes = 0;
LABEL_13:
  }
  return v6;
}

- (_HKXMLExtractorElement)initWithElementName:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HKXMLExtractorElement;
  v8 = [(_HKXMLExtractorElement *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    specificationElement = v8->_specificationElement;
    v8->_specificationElement = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    specificationAttributes = v8->_specificationAttributes;
    v8->_specificationAttributes = (NSDictionary *)v11;
  }
  return v8;
}

- (BOOL)matchesElement:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  specificationElement = self->_specificationElement;
  id v6 = [v4 specificationElement];
  LODWORD(specificationElement) = [(NSString *)specificationElement isEqualToString:v6];

  if (specificationElement)
  {
    if (self->_specificationAttributes)
    {
      id v7 = [v4 specificationAttributes];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v8 = self->_specificationAttributes;
      uint64_t v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        id v21 = v4;
        uint64_t v11 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            uint64_t v14 = [v7 objectForKeyedSubscript:v13];
            if (!v14) {
              goto LABEL_18;
            }
            uint64_t v15 = (void *)v14;
            v16 = [(NSDictionary *)self->_specificationAttributes objectForKeyedSubscript:v13];
            v17 = [MEMORY[0x1E4F1CA98] null];
            char v18 = [v16 isEqual:v17];

            if ((v18 & 1) == 0 && ![v15 isEqualToString:v16])
            {

LABEL_18:
              BOOL v19 = 0;
              goto LABEL_19;
            }
          }
          uint64_t v10 = [(NSDictionary *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v10) {
            continue;
          }
          break;
        }
        BOOL v19 = 1;
LABEL_19:
        id v4 = v21;
      }
      else
      {
        BOOL v19 = 1;
      }
    }
    else
    {
      BOOL v19 = 1;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (NSString)specificationElement
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)specificationAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificationAttributes, 0);

  objc_storeStrong((id *)&self->_specificationElement, 0);
}

@end