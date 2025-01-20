@interface CLKComplicationIntentWidgetMigrationConfiguration
+ (BOOL)supportsSecureCoding;
+ (CLKComplicationIntentWidgetMigrationConfiguration)intentWidgetMigrationConfigurationWithKind:(NSString *)kind extensionBundleIdentifier:(NSString *)extensionBundleIdentifier intent:(INIntent *)intent localizedDisplayName:(NSString *)localizedDisplayName;
- (BOOL)isEqual:(id)a3;
- (CLKComplicationIntentWidgetMigrationConfiguration)initWithCoder:(id)a3;
- (CLKComplicationIntentWidgetMigrationConfiguration)initWithKind:(NSString *)kind extensionBundleIdentifier:(NSString *)extensionBundleIdentifier intent:(INIntent *)intent localizedDisplayName:(NSString *)localizedDisplayName;
- (INIntent)intent;
- (NSString)extensionBundleIdentifier;
- (NSString)kind;
- (NSString)localizedDisplayName;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIntent:(id)a3;
@end

@implementation CLKComplicationIntentWidgetMigrationConfiguration

- (CLKComplicationIntentWidgetMigrationConfiguration)initWithKind:(NSString *)kind extensionBundleIdentifier:(NSString *)extensionBundleIdentifier intent:(INIntent *)intent localizedDisplayName:(NSString *)localizedDisplayName
{
  v10 = kind;
  v11 = extensionBundleIdentifier;
  v12 = intent;
  v13 = localizedDisplayName;
  v24.receiver = self;
  v24.super_class = (Class)CLKComplicationIntentWidgetMigrationConfiguration;
  v14 = [(CLKComplicationWidgetMigrationConfiguration *)&v24 initPrivate];
  if (v14)
  {
    uint64_t v15 = [(NSString *)v10 copy];
    v16 = v14->_kind;
    v14->_kind = (NSString *)v15;

    uint64_t v17 = [(NSString *)v11 copy];
    v18 = v14->_extensionBundleIdentifier;
    v14->_extensionBundleIdentifier = (NSString *)v17;

    uint64_t v19 = [(INIntent *)v12 copy];
    v20 = v14->_intent;
    v14->_intent = (INIntent *)v19;

    uint64_t v21 = [(NSString *)v13 copy];
    v22 = v14->_localizedDisplayName;
    v14->_localizedDisplayName = (NSString *)v21;
  }
  return v14;
}

- (void)setIntent:(id)a3
{
  p_intent = &self->_intent;
  id v5 = a3;
  if ((-[INIntent isEqual:](*p_intent, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_intent, a3);
  }
}

+ (CLKComplicationIntentWidgetMigrationConfiguration)intentWidgetMigrationConfigurationWithKind:(NSString *)kind extensionBundleIdentifier:(NSString *)extensionBundleIdentifier intent:(INIntent *)intent localizedDisplayName:(NSString *)localizedDisplayName
{
  v10 = localizedDisplayName;
  v11 = intent;
  v12 = extensionBundleIdentifier;
  v13 = kind;
  v14 = (void *)[objc_alloc((Class)a1) initWithKind:v13 extensionBundleIdentifier:v12 intent:v11 localizedDisplayName:v10];

  return (CLKComplicationIntentWidgetMigrationConfiguration *)v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLKComplicationIntentWidgetMigrationConfiguration;
  if ([(CLKComplicationWidgetMigrationConfiguration *)&v16 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    kind = self->_kind;
    v7 = [v5 kind];
    if ([(NSString *)kind isEqualToString:v7])
    {
      extensionBundleIdentifier = self->_extensionBundleIdentifier;
      v9 = [v5 extensionBundleIdentifier];
      if ([(NSString *)extensionBundleIdentifier isEqualToString:v9])
      {
        intent = self->_intent;
        v11 = [v5 intent];
        if ([(INIntent *)intent isEqual:v11])
        {
          localizedDisplayName = self->_localizedDisplayName;
          v13 = [v5 localizedDisplayName];
          BOOL v14 = [(NSString *)localizedDisplayName isEqualToString:v13];
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLKComplicationIntentWidgetMigrationConfiguration;
  id v4 = [(CLKComplicationWidgetMigrationConfiguration *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 1, self->_kind);
  objc_storeStrong(v4 + 2, self->_extensionBundleIdentifier);
  objc_storeStrong(v4 + 3, self->_intent);
  objc_storeStrong(v4 + 4, self->_localizedDisplayName);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLKComplicationIntentWidgetMigrationConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLKComplicationIntentWidgetMigrationConfiguration;
  id v5 = [(CLKComplicationWidgetMigrationConfiguration *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_WidgetMigrationConfigurationKind"];
    kind = v5->_kind;
    v5->_kind = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_WidgetMigrationConfigurationKindExtensionBundleIdentifier"];
    extensionBundleIdentifier = v5->_extensionBundleIdentifier;
    v5->_extensionBundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_WidgetMigrationConfigurationKindIntent"];
    intent = v5->_intent;
    v5->_intent = (INIntent *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_WidgetMigrationConfigurationKindLocalizedDisplayName"];
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLKComplicationIntentWidgetMigrationConfiguration;
  id v4 = a3;
  [(CLKComplicationWidgetMigrationConfiguration *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_kind, @"_WidgetMigrationConfigurationKind", v6.receiver, v6.super_class);
  [v4 encodeObject:self->_extensionBundleIdentifier forKey:@"_WidgetMigrationConfigurationKindExtensionBundleIdentifier"];
  id v5 = INIntentWithTypedIntent();
  [v4 encodeObject:v5 forKey:@"_WidgetMigrationConfigurationKindIntent"];

  [v4 encodeObject:self->_localizedDisplayName forKey:@"_WidgetMigrationConfigurationKindLocalizedDisplayName"];
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (INIntent)intent
{
  return self->_intent;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_kind, 0);
}

@end