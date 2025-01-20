@interface DNDAppActionsBox
+ (BOOL)supportsSecureCoding;
- (DNDAppActionsBox)initWithCoder:(id)a3;
- (NSDictionary)appActionsForModeIdentifier;
- (id)appConfigurationActionsForModeIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAppActionsForModeIdentifier:(id)a3;
@end

@implementation DNDAppActionsBox

- (id)appConfigurationActionsForModeIdentifier
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSDictionary count](self->_appActionsForModeIdentifier, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self->_appActionsForModeIdentifier;
  uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = -[NSDictionary objectForKeyedSubscript:](self->_appActionsForModeIdentifier, "objectForKeyedSubscript:", v9, (void)v13);
        v11 = objc_msgSend(v10, "bs_compactMap:", &__block_literal_global_16);
        [v3 setObject:v11 forKeyedSubscript:v9];
      }
      uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

uint64_t __60__DNDAppActionsBox_appConfigurationActionsForModeIdentifier__block_invoke(uint64_t a1, void *a2)
{
  return [a2 action];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (DNDAppActionsBox)initWithCoder:(id)a3
{
  id v4 = a3;
  if (NSClassFromString(&cfstr_Lnaction.isa))
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"boxed"];

    v11 = objc_alloc_init(DNDAppActionsBox);
    [(DNDAppActionsBox *)v11 setAppActionsForModeIdentifier:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSDictionary)appActionsForModeIdentifier
{
  return self->_appActionsForModeIdentifier;
}

- (void)setAppActionsForModeIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end