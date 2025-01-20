@interface CalculateKeys
+ (id)keysWithOptions:(uint64_t)a1;
- (NSDictionary)options;
- (id)initWithOptions:(id *)a1;
- (id)locales;
- (id)numberFormatter;
- (id)variables;
- (uint64_t)allowPartialExpressions;
- (uint64_t)assumeDegrees;
- (uint64_t)autoScientificNotation;
- (uint64_t)engine;
- (uint64_t)flexibleFractionDigits;
- (uint64_t)format;
- (uint64_t)scientificNotationFormat;
- (void)setOptions:(id)a3;
@end

@implementation CalculateKeys

- (void).cxx_destruct
{
}

- (id)variables
{
  if (a1)
  {
    v1 = [*(id *)(a1 + 8) objectForKeyedSubscript:@"CalculateKeyVariables"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v2 = v1;
    }
    else {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)numberFormatter
{
  if (a1)
  {
    v1 = [*(id *)(a1 + 8) objectForKeyedSubscript:@"CalculateKeyNumberFormatter"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v2 = v1;
    }
    else {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)locales
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = [*(id *)(a1 + 8) objectForKeyedSubscript:@"CalculateKeyLocales"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v1];
      v7[0] = v2;
      uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v1;
        v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v4 = 0;
        goto LABEL_10;
      }
      id v2 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global];
      uint64_t v3 = [v1 filteredArrayUsingPredicate:v2];
    }
    v4 = (void *)v3;

LABEL_10:
    goto LABEL_11;
  }
  v4 = 0;
LABEL_11:
  return v4;
}

- (id)initWithOptions:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)CalculateKeys;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (uint64_t)format
{
  if (!a1) {
    return 0;
  }
  v1 = [*(id *)(a1 + 8) objectForKeyedSubscript:@"CalculateKeyFormat"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = (int)[v1 intValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)flexibleFractionDigits
{
  if (!a1) {
    return 0;
  }
  v1 = [*(id *)(a1 + 8) objectForKeyedSubscript:@"CalculateKeyFlexibleFractionDigits"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

- (uint64_t)engine
{
  if (!a1) {
    return 0;
  }
  v1 = [*(id *)(a1 + 8) objectForKeyedSubscript:@"CalculateKeyEngine"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = (int)[v1 intValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)assumeDegrees
{
  if (!a1) {
    return 0;
  }
  v1 = [*(id *)(a1 + 8) objectForKeyedSubscript:@"CalculateKeyAssumeDegrees"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)allowPartialExpressions
{
  if (result)
  {
    v1 = [*(id *)(result + 8) objectForKeyedSubscript:@"CalculateKeyAllowPartialExpressions"];
    uint64_t v2 = [v1 BOOLValue];

    return v2;
  }
  return result;
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

+ (id)keysWithOptions:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = -[CalculateKeys initWithOptions:]((id *)[CalculateKeys alloc], v2);

  return v3;
}

uint64_t __24__CalculateKeys_locales__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (uint64_t)autoScientificNotation
{
  if (!a1) {
    return 0;
  }
  v1 = [*(id *)(a1 + 8) objectForKeyedSubscript:@"CalculateKeyAutoScientificNotation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

- (uint64_t)scientificNotationFormat
{
  if (!a1) {
    return 0;
  }
  v1 = [*(id *)(a1 + 8) objectForKeyedSubscript:@"CalculateKeyScientificNotationFormat"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = (int)[v1 intValue];
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

uint64_t __34__CalculateKeys_expectedUnitTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end