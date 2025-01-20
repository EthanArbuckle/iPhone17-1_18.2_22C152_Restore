@interface MAElementFilter
+ (BOOL)scanDomains:(id *)a3 withScanner:(id)a4;
+ (BOOL)scanElementFilterLabels:(id *)a3 domains:(id *)a4 properties:(id *)a5 withScanner:(id)a6;
+ (BOOL)scanInstance:(id *)a3 withScanner:(id)a4;
+ (BOOL)scanLabels:(id *)a3 withScanner:(id)a4;
+ (BOOL)scanProperties:(id *)a3 withScanner:(id)a4;
+ (BOOL)scanPropertyOption:(id *)a3 withScanner:(id)a4;
+ (BOOL)scanPropertyValue:(id *)a3 withScanner:(id)a4;
+ (id)any;
+ (id)scanFilterWithScanner:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesDomainOfElement:(id)a3;
- (BOOL)matchesElement:(id)a3;
- (BOOL)matchesLabelOfElement:(id)a3;
- (BOOL)matchesPropertiesOfElement:(id)a3;
- (KGElementIdentifierSet)domains;
- (MAElementFilter)initWithLabel:(id)a3 domain:(unsigned __int16)a4;
- (MAElementFilter)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (MAElementFilter)initWithLabel:(id)a3 domains:(id)a4 properties:(id)a5;
- (MAElementFilter)initWithLabels:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (MAElementFilter)initWithLabels:(id)a3 domains:(id)a4 properties:(id)a5;
- (NSArray)kgOptionalLabels;
- (NSArray)kgRequiredLabels;
- (NSDictionary)properties;
- (NSSet)labels;
- (NSString)visualString;
- (id)filterBySettingProperties:(id)a3;
- (unint64_t)hash;
- (void)_appendPropertyOption:(id)a3 toString:(id)a4;
- (void)appendVisualStringToString:(id)a3;
@end

@implementation MAElementFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_domains, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (KGElementIdentifierSet)domains
{
  return self->_domains;
}

- (NSSet)labels
{
  return self->_labels;
}

- (id)filterBySettingProperties:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLabels:self->_labels domains:self->_domains properties:v4];

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(KGElementIdentifierSet *)self->_domains hash] + 2654435769u;
  unint64_t v4 = ([(NSSet *)self->_labels hash] + (v3 << 6) + (v3 >> 2) + 2654435769u) ^ v3;
  return ([(NSDictionary *)self->_properties hash] + (v4 << 6) + (v4 >> 2) + 2654435769u) ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (MAElementFilter *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      domains = self->_domains;
      v7 = [(MAElementFilter *)v5 domains];
      LODWORD(domains) = [(KGElementIdentifierSet *)domains isEqualToElementIdentifierSet:v7];

      if (domains
        && (labels = self->_labels,
            [(MAElementFilter *)v5 labels],
            v9 = objc_claimAutoreleasedReturnValue(),
            LODWORD(labels) = [(NSSet *)labels isEqualToSet:v9],
            v9,
            labels))
      {
        properties = self->_properties;
        v11 = [(MAElementFilter *)v5 properties];
        char v12 = [(NSDictionary *)properties isEqualToDictionary:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (NSString)visualString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [(MAElementFilter *)self appendVisualStringToString:v3];
  return (NSString *)v3;
}

- (void)appendVisualStringToString:(id)a3
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 appendString:@":"];
  labels = self->_labels;
  v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1 selector:sel_compare_];
  v49[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
  v8 = [(NSSet *)labels sortedArrayUsingDescriptors:v7];

  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(obj);
        }
        [v4 appendString:*(void *)(*((void *)&v38 + 1) + 8 * i)];
        unint64_t v12 = v43[3] + 1;
        v43[3] = v12;
        if (v12 < [obj count]) {
          [v4 appendString:@"/"];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v9);
  }

  [v4 appendString:@":"];
  v43[3] = 0;
  domains = self->_domains;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __46__MAElementFilter_appendVisualStringToString___block_invoke;
  v34[3] = &unk_1E68DBEA8;
  id v14 = v4;
  v36 = self;
  v37 = &v42;
  id v35 = v14;
  [(KGElementIdentifierSet *)domains enumerateIdentifiersWithBlock:v34];
  if ([(NSDictionary *)self->_properties count])
  {
    [v14 appendString:@" { "];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v23 = self->_properties;
    uint64_t v15 = [(NSDictionary *)v23 countByEnumeratingWithState:&v30 objects:v47 count:16];
    if (v15)
    {
      uint64_t v24 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v23);
          }
          uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * j);
          [v14 appendFormat:@"%@:", v17];
          v18 = [(NSDictionary *)self->_properties objectForKeyedSubscript:v17];
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            [v14 appendString:@"["];
            long long v28 = 0u;
            long long v29 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            id v19 = v18;
            uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v46 count:16];
            if (v20)
            {
              uint64_t v21 = *(void *)v27;
              do
              {
                for (uint64_t k = 0; k != v20; ++k)
                {
                  if (*(void *)v27 != v21) {
                    objc_enumerationMutation(v19);
                  }
                  [(MAElementFilter *)self _appendPropertyOption:*(void *)(*((void *)&v26 + 1) + 8 * k) toString:v14];
                  [v14 appendString:@", "];
                }
                uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v46 count:16];
              }
              while (v20);
            }

            [v14 appendString:@"]"];
          }
          else
          {
            [(MAElementFilter *)self _appendPropertyOption:v18 toString:v14];
          }
          [v14 appendString:@", "];
        }
        uint64_t v15 = [(NSDictionary *)v23 countByEnumeratingWithState:&v30 objects:v47 count:16];
      }
      while (v15);
    }

    [v14 appendString:@"}"];
  }

  _Block_object_dispose(&v42, 8);
}

unint64_t __46__MAElementFilter_appendVisualStringToString___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%lu", a2);
  unint64_t v3 = ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  unint64_t result = [*(id *)(*(void *)(a1 + 40) + 16) count];
  if (v3 < result)
  {
    v5 = *(void **)(a1 + 32);
    return [v5 appendString:@"/"];
  }
  return result;
}

- (void)_appendPropertyOption:(id)a3 toString:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  switch([v5 kgPropertyType])
  {
    case 0:
      v7 = KGLoggingConnection();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v5;
        _os_log_fault_impl(&dword_1D1654000, v7, OS_LOG_TYPE_FAULT, "Unsupported property value: (%@)", buf, 0xCu);
      }
      goto LABEL_7;
    case 1:
      v7 = v5;
      if (([v7 integerValue] & 0x8000000000000000) == 0) {
        [v6 appendString:@"+"];
      }
      [v6 appendFormat:@"%@", v7];
LABEL_7:

      break;
    case 2:
      [v5 doubleValue];
      objc_msgSend(v6, "appendFormat:", @"%f", v8);
      break;
    case 3:
      [v6 appendFormat:@"'%@'", v5];
      break;
    case 4:
      [v6 appendFormat:@"%@", v5];
      break;
    default:
      break;
  }
}

- (NSArray)kgOptionalLabels
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSSet *)self->_labels count] >= 2)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = self->_labels;
    uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 addObject:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
        uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
  if ([(KGElementIdentifierSet *)self->_domains count] >= 2)
  {
    domains = self->_domains;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __35__MAElementFilter_kgOptionalLabels__block_invoke;
    v11[3] = &unk_1E68DC268;
    id v12 = v3;
    [(KGElementIdentifierSet *)domains enumerateIdentifiersWithBlock:v11];
  }
  return (NSArray *)v3;
}

void __35__MAElementFilter_kgOptionalLabels__block_invoke(uint64_t a1, unsigned __int16 a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = +[MAKGDomainConversion kgLabelForMADomain:a2];
  if (v4)
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    uint64_t v5 = KGLoggingConnection();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      uint64_t v6 = [NSNumber numberWithUnsignedShort:a2];
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_fault_impl(&dword_1D1654000, v5, OS_LOG_TYPE_FAULT, "Attempting to filter with invalid domain (%@)", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (NSArray)kgRequiredLabels
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSSet *)self->_labels count] == 1)
  {
    id v4 = [(NSSet *)self->_labels anyObject];
    [v3 addObject:v4];
  }
  if ([(KGElementIdentifierSet *)self->_domains count] == 1)
  {
    unsigned __int16 v5 = [(KGElementIdentifierSet *)self->_domains firstElement];
    if (v5 != 1)
    {
      uint64_t v6 = +[MAKGDomainConversion kgLabelForMADomain:](MAKGDomainConversion, "kgLabelForMADomain:");
      if (v6)
      {
        [v3 addObject:v6];
      }
      else
      {
        int v7 = KGLoggingConnection();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          uint64_t v9 = [NSNumber numberWithUnsignedShort:v5];
          int v10 = 138412290;
          uint64_t v11 = v9;
          _os_log_fault_impl(&dword_1D1654000, v7, OS_LOG_TYPE_FAULT, "Attempting to filter with invalid domain (%@)", (uint8_t *)&v10, 0xCu);
        }
      }
    }
  }
  return (NSArray *)v3;
}

- (BOOL)matchesElement:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MAElementFilter *)self matchesLabelOfElement:v4]
    && [(MAElementFilter *)self matchesDomainOfElement:v4]
    && [(MAElementFilter *)self matchesPropertiesOfElement:v4];

  return v5;
}

- (BOOL)matchesPropertiesOfElement:(id)a3
{
  id v4 = a3;
  BOOL v5 = [KGElementFilter alloc];
  uint64_t v6 = [(KGElementFilter *)v5 initWithRequiredLabels:MEMORY[0x1E4F1CBF0] optionalLabels:MEMORY[0x1E4F1CBF0] properties:self->_properties];
  int v7 = [v4 properties];

  LOBYTE(v4) = [(KGElementFilter *)v6 matchesProperties:v7];
  return (char)v4;
}

- (BOOL)matchesDomainOfElement:(id)a3
{
  id v4 = a3;
  if ([(KGElementIdentifierSet *)self->_domains count]) {
    BOOL v5 = -[KGElementIdentifierSet containsIdentifier:](self->_domains, "containsIdentifier:", [v4 domain]);
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)matchesLabelOfElement:(id)a3
{
  id v4 = a3;
  if ([(NSSet *)self->_labels count])
  {
    labels = self->_labels;
    uint64_t v6 = [v4 label];
    char v7 = [(NSSet *)labels containsObject:v6];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (MAElementFilter)initWithLabels:(id)a3 domains:(id)a4 properties:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MAElementFilter;
  uint64_t v12 = [(MAElementFilter *)&v15 init];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_labels, a3);
    objc_storeStrong((id *)&v13->_domains, a4);
    objc_storeStrong((id *)&v13->_properties, a5);
  }

  return v13;
}

- (MAElementFilter)initWithLabel:(id)a3 domains:(id)a4 properties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MAElementFilter;
  id v11 = [(MAElementFilter *)&v15 init];
  if (v11)
  {
    if (v8) {
      uint64_t v12 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v8, 0);
    }
    else {
      uint64_t v12 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    labels = v11->_labels;
    v11->_labels = v12;

    objc_storeStrong((id *)&v11->_domains, a4);
    objc_storeStrong((id *)&v11->_properties, a5);
  }

  return v11;
}

- (MAElementFilter)initWithLabels:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  unsigned int v6 = a4;
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MAElementFilter;
  id v11 = [(MAElementFilter *)&v16 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_labels, a3);
    if (v6) {
      long long v13 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:v6];
    }
    else {
      long long v13 = objc_alloc_init(KGElementIdentifierSet);
    }
    domains = v12->_domains;
    v12->_domains = v13;

    objc_storeStrong((id *)&v12->_properties, a5);
  }

  return v12;
}

- (MAElementFilter)initWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  return [(MAElementFilter *)self initWithLabel:a3 domain:a4 properties:MEMORY[0x1E4F1CC08]];
}

- (MAElementFilter)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  unsigned int v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MAElementFilter;
  id v10 = [(MAElementFilter *)&v16 init];
  if (v10)
  {
    if (v8) {
      id v11 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v8, 0);
    }
    else {
      id v11 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    labels = v10->_labels;
    v10->_labels = v11;

    if (v6) {
      long long v13 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:v6];
    }
    else {
      long long v13 = objc_alloc_init(KGElementIdentifierSet);
    }
    domains = v10->_domains;
    v10->_domains = v13;

    objc_storeStrong((id *)&v10->_properties, a5);
  }

  return v10;
}

+ (id)any
{
  id v2 = objc_alloc((Class)a1);
  id v3 = (void *)[v2 initWithLabel:0 domain:0 properties:MEMORY[0x1E4F1CC08]];
  return v3;
}

+ (id)scanFilterWithScanner:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 scanLocation];
  id v11 = 0;
  int v6 = [a1 scanInstance:&v11 withScanner:v4];
  id v7 = v11;
  id v8 = v7;
  if (v6)
  {
    id v9 = v7;
  }
  else
  {
    [v4 setScanLocation:v5];
    id v9 = 0;
  }

  return v9;
}

+ (BOOL)scanInstance:(id *)a3 withScanner:(id)a4
{
  id v15 = 0;
  id v16 = 0;
  id v14 = 0;
  int v6 = [a1 scanElementFilterLabels:&v16 domains:&v15 properties:&v14 withScanner:a4];
  id v7 = v16;
  id v8 = v15;
  if (a3 && v6)
  {
    id v9 = v14;
    id v10 = objc_alloc((Class)a1);
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = (id)MEMORY[0x1E4F1CC08];
    }
    id v12 = (id)[v10 initWithLabels:v7 domains:v8 properties:v11];

    *a3 = v12;
  }

  return v6;
}

+ (BOOL)scanPropertyValue:(id *)a3 withScanner:(id)a4
{
  id v6 = a4;
  if (![v6 scanString:@"[" intoString:0])
  {
    char v11 = [a1 scanPropertyOption:a3 withScanner:v6];
    goto LABEL_12;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = 0;
  while (1)
  {
    id v9 = v8;
    id v13 = 0;
    int v10 = [a1 scanPropertyOption:&v13 withScanner:v6];
    id v8 = v13;

    if (!v10 || !v8) {
      break;
    }
    [v7 addObject:v8];
LABEL_7:
    if ([v6 scanString:@"], ", 0 intoString])
    {
      *a3 = v7;
      char v11 = 1;
      goto LABEL_11;
    }
  }
  if (v10) {
    goto LABEL_7;
  }
  char v11 = 0;
LABEL_11:

LABEL_12:
  return v11;
}

+ (BOOL)scanPropertyOption:(id *)a3 withScanner:(id)a4
{
  id v5 = a4;
  if ([v5 scanString:@"'" intoString:0])
  {
    if (([v5 scanUpToString:@"'" intoString:a3] & 1) != 0
      && [v5 scanString:@"'" intoString:0])
    {
      goto LABEL_19;
    }
  }
  else if ([v5 scanString:@"+" intoString:0])
  {
    uint64_t v15 = 123456789;
    if ([v5 scanInteger:&v15])
    {
      *a3 = [NSNumber numberWithInteger:v15];
LABEL_19:
      char v10 = [v5 scanString:@", ", 0 intoString];
      goto LABEL_20;
    }
  }
  else
  {
    id v14 = 0;
    int v6 = [v5 scanUpToString:@"," intoString:&v14];
    id v7 = v14;
    id v8 = v7;
    if (v6)
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v7];
      uint64_t v15 = 123456789;
      if ([v9 scanInteger:&v15] && objc_msgSend(v9, "isAtEnd"))
      {
        *a3 = [NSNumber numberWithInteger:v15];
      }
      else
      {
        char v11 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v8];
        double v13 = NAN;
        if ([v11 scanDouble:&v13] && objc_msgSend(v11, "isAtEnd"))
        {
          *a3 = [NSNumber numberWithDouble:v13];
        }
      }
      goto LABEL_19;
    }
  }
  char v10 = 0;
LABEL_20:

  return v10;
}

+ (BOOL)scanProperties:(id *)a3 withScanner:(id)a4
{
  id v6 = a4;
  if ([v6 scanString:@"{" intoString:0])
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([v6 scanString:@"}" intoString:0])
    {
LABEL_3:
      if (a3) {
        *a3 = v7;
      }
      BOOL v8 = 1;
    }
    else
    {
      while (1)
      {
        id v9 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
        id v16 = 0;
        int v10 = [v6 scanCharactersFromSet:v9 intoString:&v16];
        id v11 = v16;

        if (!v10 || ![v6 scanString:@":" intoString:0]) {
          break;
        }
        id v15 = 0;
        int v12 = [a1 scanPropertyValue:&v15 withScanner:v6];
        id v13 = v15;
        if (!v12) {
          goto LABEL_13;
        }
        [v7 setObject:v13 forKeyedSubscript:v11];

        if ([v6 scanString:@"}" intoString:0]) {
          goto LABEL_3;
        }
      }
      id v13 = 0;
LABEL_13:

      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

+ (BOOL)scanDomains:(id *)a3 withScanner:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(KGMutableElementIdentifierSet);
  uint64_t v9 = 0;
  if ([v5 scanUnsignedLongLong:&v9])
  {
    do
    {
      [(KGMutableElementIdentifierSet *)v6 addIdentifier:v9];
      [v5 scanString:@"/" intoString:0];
    }
    while (([v5 scanUnsignedLongLong:&v9] & 1) != 0);
  }
  id v7 = v6;
  *a3 = v7;

  return 1;
}

+ (BOOL)scanLabels:(id *)a3 withScanner:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CA80] set];
  if ([v5 scanString:@":" intoString:0])
  {
    id v7 = v6;
    BOOL v8 = 0;
LABEL_3:
    *a3 = v7;
    char v9 = 1;
    goto LABEL_19;
  }
  id v18 = 0;
  int v10 = [v5 scanUpToString:@":" intoString:&v18];
  id v11 = v18;
  BOOL v8 = v11;
  if (!v10)
  {
    char v9 = 0;
    goto LABEL_19;
  }
  if (![v11 length])
  {
    id v7 = v6;
    goto LABEL_3;
  }
  int v12 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v8];
  id v13 = 0;
  LOBYTE(v14) = 1;
  do
  {
    if ((v14 & 1) == 0)
    {
      char v9 = 0;
      *a3 = v6;
      goto LABEL_18;
    }
    id v17 = v13;
    int v14 = [v12 scanUpToString:@"/" intoString:&v17];
    id v15 = v17;

    if (v14) {
      int v14 = [v15 length] != 0;
    }
    [v6 addObject:v15];
    id v13 = v15;
  }
  while (([v12 scanString:@"/" intoString:0] & 1) != 0);
  *a3 = v6;
  if (v14) {
    char v9 = [v5 scanString:@":" intoString:0];
  }
  else {
    char v9 = 0;
  }
  id v13 = v15;
LABEL_18:

LABEL_19:
  return v9;
}

+ (BOOL)scanElementFilterLabels:(id *)a3 domains:(id *)a4 properties:(id *)a5 withScanner:(id)a6
{
  id v10 = a6;
  if ([v10 scanString:@":" intoString:0]
    && [a1 scanLabels:a3 withScanner:v10]
    && [a1 scanDomains:a4 withScanner:v10])
  {
    char v11 = [a1 scanProperties:a5 withScanner:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

@end