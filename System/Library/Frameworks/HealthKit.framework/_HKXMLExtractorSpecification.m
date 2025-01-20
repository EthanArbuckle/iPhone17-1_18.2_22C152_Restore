@interface _HKXMLExtractorSpecification
- (BOOL)matchesElementStack:(id)a3;
- (NSArray)specificationElements;
- (NSString)specificationString;
- (_HKXMLExtractorSpecification)initWithSpecificationString:(id)a3;
@end

@implementation _HKXMLExtractorSpecification

- (_HKXMLExtractorSpecification)initWithSpecificationString:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_HKXMLExtractorSpecification;
  v6 = [(_HKXMLExtractorSpecification *)&v26 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_specificationString, a3);
    v8 = objc_msgSend(MEMORY[0x1E4F28B88], "hk_forwardSlashCharacterSet");
    v9 = [v5 componentsSeparatedByCharactersInSet:v8];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v15);
          v17 = [_HKXMLExtractorElement alloc];
          v18 = -[_HKXMLExtractorElement initWithTagSpecification:](v17, "initWithTagSpecification:", v16, (void)v22);
          [v10 addObject:v18];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v13);
    }

    uint64_t v19 = [v10 copy];
    specificationElements = v7->_specificationElements;
    v7->_specificationElements = (NSArray *)v19;
  }
  return v7;
}

- (BOOL)matchesElementStack:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  if (v5 == [(NSArray *)self->_specificationElements count])
  {
    uint64_t v6 = v5 - 1;
    if (v5 < 1)
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      uint64_t v7 = 0;
      do
      {
        v8 = [(NSArray *)self->_specificationElements objectAtIndexedSubscript:v7];
        v9 = [v4 objectAtIndexedSubscript:v7];
        int v10 = [v8 matchesElement:v9];

        if (v10) {
          BOOL v11 = v6 == v7;
        }
        else {
          BOOL v11 = 1;
        }
        ++v7;
      }
      while (!v11);
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (NSString)specificationString
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)specificationElements
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificationElements, 0);

  objc_storeStrong((id *)&self->_specificationString, 0);
}

@end