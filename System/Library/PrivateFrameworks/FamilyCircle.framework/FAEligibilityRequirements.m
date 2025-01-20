@interface FAEligibilityRequirements
+ (BOOL)supportsSecureCoding;
- (FAEligibilityRequirements)init;
- (FAEligibilityRequirements)initWithCoder:(id)a3;
- (FAEligibilityRequirements)initWithDictionaryRepresentation:(id)a3;
- (FAEligibilityRequirements)initWithPropertyRequirements:(id)a3;
- (id)requirementsForPropertyName:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FAEligibilityRequirements

- (void).cxx_destruct
{
}

- (FAEligibilityRequirements)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
        v12 = [FAPropertyEligibilityRequirements alloc];
        v13 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v18);
        v14 = [(FAPropertyEligibilityRequirements *)v12 initWithPropertyName:v11 dictionaryRepresentation:v13];
        [v5 setObject:v14 forKeyedSubscript:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  v15 = (void *)[v5 copy];
  v16 = [(FAEligibilityRequirements *)self initWithPropertyRequirements:v15];

  return v16;
}

- (FAEligibilityRequirements)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FAEligibilityRequirements *)self init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"properties"];
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v10;
  }
  return v5;
}

- (FAEligibilityRequirements)initWithPropertyRequirements:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAEligibilityRequirements;
  id v5 = [(FAEligibilityRequirements *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v6;
  }
  return v5;
}

- (FAEligibilityRequirements)init
{
  return [(FAEligibilityRequirements *)self initWithPropertyRequirements:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)requirementsForPropertyName:(id)a3
{
  return [(NSDictionary *)self->_properties objectForKeyedSubscript:a3];
}

@end