@interface HKUserDomainConceptLocalizedString
+ (BOOL)supportsSecureCoding;
+ (id)_propertiesByLocale:(id)a3;
+ (id)mergeListsOfPropertiesWithType:(int64_t)a3 intoListOfProperties:(id)a4 fromListOfProperties:(id)a5 options:(unint64_t)a6;
+ (id)nullPropertyWithType:(int64_t)a3 locale:(id)a4 version:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (HKUserDomainConceptLocalizedString)init;
- (HKUserDomainConceptLocalizedString)initWithCoder:(id)a3;
- (HKUserDomainConceptLocalizedString)initWithType:(int64_t)a3 stringValue:(id)a4 locale:(id)a5 version:(int64_t)a6;
- (HKUserDomainConceptLocalizedString)initWithType:(int64_t)a3 stringValue:(id)a4 locale:(id)a5 version:(int64_t)a6 timestamp:(double)a7;
- (HKUserDomainConceptLocalizedString)initWithType:(int64_t)a3 stringValue:(id)a4 locale:(id)a5 version:(int64_t)a6 timestamp:(double)a7 deleted:(BOOL)a8;
- (HKUserDomainConceptLocalizedString)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6;
- (NSString)locale;
- (NSString)stringValue;
- (id)valueDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKUserDomainConceptLocalizedString

- (HKUserDomainConceptLocalizedString)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKUserDomainConceptLocalizedString)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6
{
  v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3C8];
  v9 = NSStringFromSelector(a2);
  [v7 raise:v8, @"The -%@ method is not available on %@", v9, objc_opt_class() format];

  return 0;
}

- (HKUserDomainConceptLocalizedString)initWithType:(int64_t)a3 stringValue:(id)a4 locale:(id)a5 version:(int64_t)a6 timestamp:(double)a7 deleted:(BOOL)a8
{
  BOOL v8 = a8;
  id v15 = a4;
  id v16 = a5;
  v17 = v16;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"HKUserDomainConceptLocalizedString.m", 40, @"Invalid parameter not satisfying: %@", @"stringValue" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"HKUserDomainConceptLocalizedString.m", 41, @"Invalid parameter not satisfying: %@", @"locale" object file lineNumber description];

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)HKUserDomainConceptLocalizedString;
  v18 = [(HKUserDomainConceptProperty *)&v26 initWithType:a3 version:a6 timestamp:v8 deleted:a7];
  if (v18)
  {
    uint64_t v19 = [v15 copy];
    stringValue = v18->_stringValue;
    v18->_stringValue = (NSString *)v19;

    uint64_t v21 = [v17 copy];
    locale = v18->_locale;
    v18->_locale = (NSString *)v21;
  }
  return v18;
}

+ (id)nullPropertyWithType:(int64_t)a3 locale:(id)a4 version:(int64_t)a5
{
  id v7 = a4;
  BOOL v8 = [[HKUserDomainConceptLocalizedString alloc] initWithType:a3 stringValue:&stru_1EEC60288 locale:v7 version:a5 timestamp:1 deleted:CFAbsoluteTimeGetCurrent()];

  return v8;
}

- (HKUserDomainConceptLocalizedString)initWithType:(int64_t)a3 stringValue:(id)a4 locale:(id)a5 version:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  v12 = [(HKUserDomainConceptLocalizedString *)self initWithType:a3 stringValue:v11 locale:v10 version:a6 timestamp:CFAbsoluteTimeGetCurrent()];

  return v12;
}

- (HKUserDomainConceptLocalizedString)initWithType:(int64_t)a3 stringValue:(id)a4 locale:(id)a5 version:(int64_t)a6 timestamp:(double)a7
{
  return [(HKUserDomainConceptLocalizedString *)self initWithType:a3 stringValue:a4 locale:a5 version:a6 timestamp:0 deleted:a7];
}

- (id)valueDescription
{
  return (id)[NSString stringWithFormat:@"'(%@, %@)'", self->_stringValue, self->_locale];
}

+ (id)mergeListsOfPropertiesWithType:(int64_t)a3 intoListOfProperties:(id)a4 fromListOfProperties:(id)a5 options:(unint64_t)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __119__HKUserDomainConceptLocalizedString_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options___block_invoke;
  v52[3] = &__block_descriptor_40_e37_B16__0__HKUserDomainConceptProperty_8l;
  v52[4] = a3;
  if ((objc_msgSend(v9, "hk_allObjectsPassTest:", v52) & 1) == 0)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, a1, @"HKUserDomainConceptLocalizedString.m", 96, @"Invalid parameter not satisfying: %@", @"[intoListOfProperties hk_allObjectsPassTest:^BOOL(HKUserDomainConceptProperty *property) { return property.type == type && [property isKindOfClass:HKUserDomainConceptLocalizedString.class]; }]" object file lineNumber description];
  }
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __119__HKUserDomainConceptLocalizedString_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options___block_invoke_2;
  v51[3] = &__block_descriptor_40_e37_B16__0__HKUserDomainConceptProperty_8l;
  v51[4] = a3;
  if ((objc_msgSend(v10, "hk_allObjectsPassTest:", v51) & 1) == 0)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, a1, @"HKUserDomainConceptLocalizedString.m", 99, @"Invalid parameter not satisfying: %@", @"[fromListOfProperties hk_allObjectsPassTest:^BOOL(HKUserDomainConceptProperty *property) { return property.type == type && [property isKindOfClass:HKUserDomainConceptLocalizedString.class]; }]" object file lineNumber description];
  }
  if (![v10 count])
  {
    id v31 = v9;
    goto LABEL_30;
  }
  id v11 = [a1 _propertiesByLocale:v9];
  v12 = [a1 _propertiesByLocale:v10];
  v40 = v11;
  v38 = (void *)[v11 mutableCopy];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    id v35 = v10;
    id v36 = v9;
    char v37 = 0;
    uint64_t v16 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v48 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v19 = [v13 objectForKeyedSubscript:v18];
        uint64_t v20 = [v40 objectForKeyedSubscript:v18];
        uint64_t v21 = (void *)v20;
        v22 = (void *)MEMORY[0x1E4F1CBF0];
        if (v20) {
          v22 = (void *)v20;
        }
        id v23 = v22;

        v46.receiver = a1;
        v46.super_class = (Class)&OBJC_METACLASS___HKUserDomainConceptLocalizedString;
        objc_msgSendSuper2(&v46, sel_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options_, a3, v23, v19, a6);
        id v24 = (id)objc_claimAutoreleasedReturnValue();

        if (v24 != v23)
        {
          [v38 setObject:v24 forKeyedSubscript:v18];
          char v37 = 1;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v15);

    id v10 = v35;
    id v9 = v36;
    if (v37)
    {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      objc_super v26 = [v38 allValues];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v53 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v43 != v29) {
              objc_enumerationMutation(v26);
            }
            [v25 addObjectsFromArray:*(void *)(*((void *)&v42 + 1) + 8 * j)];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v53 count:16];
        }
        while (v28);
      }

      id v31 = (id)[v25 copy];
      goto LABEL_29;
    }
  }
  else
  {
  }
  id v31 = v9;
LABEL_29:

LABEL_30:

  return v31;
}

uint64_t __119__HKUserDomainConceptLocalizedString_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == *(void *)(a1 + 32))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

uint64_t __119__HKUserDomainConceptLocalizedString_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == *(void *)(a1 + 32))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HKUserDomainConceptLocalizedString *)a3;
  if (v5 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v21.receiver = self;
      v21.super_class = (Class)HKUserDomainConceptLocalizedString;
      if (![(HKUserDomainConceptProperty *)&v21 isEqual:v6])
      {
        char v12 = 0;
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v7 = 40;
      stringValue = self->_stringValue;
      id v9 = [(HKUserDomainConceptLocalizedString *)v6 stringValue];
      if (stringValue == v9) {
        goto LABEL_11;
      }
      uint64_t v10 = [(HKUserDomainConceptLocalizedString *)v6 stringValue];
      if (!v10)
      {
        char v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
      id v3 = (void *)v10;
      id v11 = self->_stringValue;
      uint64_t v7 = [(HKUserDomainConceptLocalizedString *)v6 stringValue];
      if ([(NSString *)v11 isEqual:v7])
      {
LABEL_11:
        locale = self->_locale;
        uint64_t v14 = [(HKUserDomainConceptLocalizedString *)v6 locale];
        if (locale == (NSString *)v14)
        {

          char v12 = 1;
        }
        else
        {
          uint64_t v15 = (void *)v14;
          uint64_t v16 = [(HKUserDomainConceptLocalizedString *)v6 locale];
          if (v16)
          {
            v17 = (void *)v16;
            uint64_t v18 = self->_locale;
            uint64_t v19 = [(HKUserDomainConceptLocalizedString *)v6 locale];
            char v12 = [(NSString *)v18 isEqual:v19];
          }
          else
          {

            char v12 = 0;
          }
        }
        if (stringValue == v9) {
          goto LABEL_19;
        }
      }
      else
      {
        char v12 = 0;
      }

      goto LABEL_19;
    }
    char v12 = 0;
  }
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)HKUserDomainConceptLocalizedString;
  unint64_t v3 = [(HKUserDomainConceptProperty *)&v6 hash];
  NSUInteger v4 = [(NSString *)self->_stringValue hash] ^ v3;
  return v4 ^ [(NSString *)self->_locale hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKUserDomainConceptLocalizedString;
  id v4 = a3;
  [(HKUserDomainConceptProperty *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_stringValue, @"stringValue", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_locale forKey:@"locale"];
}

- (HKUserDomainConceptLocalizedString)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKUserDomainConceptLocalizedString;
  objc_super v5 = [(HKUserDomainConceptProperty *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringValue"];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    locale = v5->_locale;
    v5->_locale = (NSString *)v8;
  }
  return v5;
}

+ (id)_propertiesByLocale:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
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
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_super v11 = objc_msgSend(v10, "locale", (void)v15);
        id v12 = [v4 objectForKeyedSubscript:v11];
        if (!v12)
        {
          id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v4 setObject:v12 forKeyedSubscript:v11];
        }
        [v12 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = (void *)[v4 copy];

  return v13;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSString)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end