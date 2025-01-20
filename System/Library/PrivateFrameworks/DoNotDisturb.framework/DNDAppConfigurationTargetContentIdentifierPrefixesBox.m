@interface DNDAppConfigurationTargetContentIdentifierPrefixesBox
+ (BOOL)supportsSecureCoding;
- (DNDAppConfigurationTargetContentIdentifierPrefixesBox)initWithCoder:(id)a3;
- (NSDictionary)appConfigurationTargetContentIdentifierPrefixesForModeIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:(id)a3;
@end

@implementation DNDAppConfigurationTargetContentIdentifierPrefixesBox

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (DNDAppConfigurationTargetContentIdentifierPrefixesBox)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v10 = [v5 decodeObjectOfClasses:v9 forKey:@"boxed"];

  v11 = objc_alloc_init(DNDAppConfigurationTargetContentIdentifierPrefixesBox);
  [(DNDAppConfigurationTargetContentIdentifierPrefixesBox *)v11 setAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:v10];

  return v11;
}

- (NSDictionary)appConfigurationTargetContentIdentifierPrefixesForModeIdentifier
{
  return self->_appConfigurationTargetContentIdentifierPrefixesForModeIdentifier;
}

- (void)setAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end