@interface CLKComplicationDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)allowedDictionaryClasses;
+ (id)legacyComplicationDescriptor;
+ (id)legacyComplicationDescriptorWithSupportedFamilies:(id)a3;
- (BOOL)hasUserInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualForIdNameAndLocale:(id)a3;
- (BOOL)needsAppNotify;
- (CLKComplicationDescriptor)initWithCoder:(id)a3;
- (CLKComplicationDescriptor)initWithIdentifier:(NSString *)identifier displayName:(NSString *)displayName supportedFamilies:(NSArray *)supportedFamilies;
- (CLKComplicationDescriptor)initWithIdentifier:(NSString *)identifier displayName:(NSString *)displayName supportedFamilies:(NSArray *)supportedFamilies userActivity:(NSUserActivity *)userActivity;
- (CLKComplicationDescriptor)initWithIdentifier:(NSString *)identifier displayName:(NSString *)displayName supportedFamilies:(NSArray *)supportedFamilies userInfo:(NSDictionary *)userInfo;
- (CLKComplicationDescriptor)initWithJSONObjectRepresentation:(id)a3;
- (CLKUserActivity)clkUserActivity;
- (CLKWidgetComplicationDescriptor)widgetDescriptor;
- (NSArray)supportedFamilies;
- (NSDictionary)userInfo;
- (NSLocale)locale;
- (NSString)displayName;
- (NSString)identifier;
- (NSUserActivity)userActivity;
- (id)JSONObjectRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setClkUserActivity:(id)a3;
- (void)setNeedsAppNotify:(BOOL)a3;
- (void)setWidgetDescriptor:(id)a3;
- (void)validate;
@end

@implementation CLKComplicationDescriptor

- (CLKComplicationDescriptor)initWithIdentifier:(NSString *)identifier displayName:(NSString *)displayName supportedFamilies:(NSArray *)supportedFamilies
{
  v8 = identifier;
  v9 = displayName;
  v10 = supportedFamilies;
  v21.receiver = self;
  v21.super_class = (Class)CLKComplicationDescriptor;
  v11 = [(CLKComplicationDescriptor *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [(NSString *)v8 copy];
    v13 = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [(NSString *)v9 copy];
    v15 = v11->_displayName;
    v11->_displayName = (NSString *)v14;

    uint64_t v16 = [(NSArray *)v10 copy];
    v17 = v11->_supportedFamilies;
    v11->_supportedFamilies = (NSArray *)v16;

    uint64_t v18 = [MEMORY[0x263EFF960] currentLocale];
    locale = v11->_locale;
    v11->_locale = (NSLocale *)v18;
  }
  return v11;
}

- (CLKComplicationDescriptor)initWithIdentifier:(NSString *)identifier displayName:(NSString *)displayName supportedFamilies:(NSArray *)supportedFamilies userInfo:(NSDictionary *)userInfo
{
  v10 = userInfo;
  v11 = [(CLKComplicationDescriptor *)self initWithIdentifier:identifier displayName:displayName supportedFamilies:supportedFamilies];
  if (v11)
  {
    uint64_t v12 = [(NSDictionary *)v10 copy];
    v13 = v11->_userInfo;
    v11->_userInfo = (NSDictionary *)v12;
  }
  return v11;
}

- (CLKComplicationDescriptor)initWithIdentifier:(NSString *)identifier displayName:(NSString *)displayName supportedFamilies:(NSArray *)supportedFamilies userActivity:(NSUserActivity *)userActivity
{
  v10 = userActivity;
  v11 = [(CLKComplicationDescriptor *)self initWithIdentifier:identifier displayName:displayName supportedFamilies:supportedFamilies];
  if (v11)
  {
    uint64_t v12 = [[CLKUserActivity alloc] initWithUserActivity:v10];
    clkUserActivity = v11->_clkUserActivity;
    v11->_clkUserActivity = v12;
  }
  return v11;
}

+ (id)legacyComplicationDescriptor
{
  v3 = CLKAllComplicationFamilies();
  v4 = [a1 legacyComplicationDescriptorWithSupportedFamilies:v3];

  return v4;
}

+ (id)legacyComplicationDescriptorWithSupportedFamilies:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithIdentifier:@"CLKDefaultComplicationIdentifier" displayName:&stru_26CCC52F8 supportedFamilies:v4];

  return v5;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"[\n_identifier:%@ \n_displayName:%@ \n_supportedFamilies:%@ \n_locale:%@] ", self->_identifier, self->_displayName, self->_supportedFamilies, self->_locale];

  return v2;
}

- (NSUserActivity)userActivity
{
  return [(CLKUserActivity *)self->_clkUserActivity userActivity];
}

- (BOOL)hasUserInfo
{
  v3 = [(CLKComplicationDescriptor *)self identifier];
  if (![v3 isEqualToString:@"CLKDefaultComplicationIdentifier"] || self->_userInfo)
  {

    return 1;
  }
  clkUserActivity = self->_clkUserActivity;

  return clkUserActivity != 0;
}

- (void)validate
{
  if (!self->_identifier) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"CLKComplicationDescriptor: identifier cannot be nil"];
  }
  if (!self->_displayName) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"CLKComplicationDescriptor: displayName cannot be nil"];
  }
  supportedFamilies = self->_supportedFamilies;
  if (supportedFamilies)
  {
    uint64_t v4 = objc_opt_class();
    CLKValidateArray(supportedFamilies, v4);
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"CLKComplicationDescriptor: supportedFamilies cannot be nil"];
  }
  userInfo = self->_userInfo;
  if (userInfo)
  {
    v6 = +[CLKComplicationDescriptor allowedDictionaryClasses];
    CLKRecursivelyValidateDictionary(userInfo, v6);
  }
  clkUserActivity = self->_clkUserActivity;
  if (clkUserActivity)
  {
    id v10 = [(CLKUserActivity *)clkUserActivity userActivity];
    v8 = [v10 userInfo];
    v9 = +[CLKComplicationDescriptor allowedDictionaryClasses];
    CLKRecursivelyValidateDictionary(v8, v9);
  }
}

+ (id)allowedDictionaryClasses
{
  if (allowedDictionaryClasses_onceToken != -1) {
    dispatch_once(&allowedDictionaryClasses_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)allowedDictionaryClasses__allowedDictionaryClasses;

  return v2;
}

uint64_t __53__CLKComplicationDescriptor_allowedDictionaryClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  uint64_t v7 = allowedDictionaryClasses__allowedDictionaryClasses;
  allowedDictionaryClasses__allowedDictionaryClasses = v6;

  return MEMORY[0x270F9A758](v6, v7);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_displayName copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSArray *)self->_supportedFamilies copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSDictionary *)self->_userInfo copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  objc_storeStrong((id *)(v5 + 56), self->_clkUserActivity);
  *(unsigned char *)(v5 + 8) = self->_needsAppNotify;
  objc_storeStrong((id *)(v5 + 48), self->_locale);
  uint64_t v14 = [(CLKWidgetComplicationDescriptor *)self->_widgetDescriptor copy];
  v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(CLKComplicationDescriptor *)self identifier];
    uint64_t v6 = [v4 identifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualForIdNameAndLocale:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  identifier = self->_identifier;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __55__CLKComplicationDescriptor_isEqualForIdNameAndLocale___block_invoke;
  v20[3] = &unk_26440E4E0;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendString:identifier counterpart:v20];
  displayName = self->_displayName;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __55__CLKComplicationDescriptor_isEqualForIdNameAndLocale___block_invoke_2;
  v18[3] = &unk_26440E4E0;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendString:displayName counterpart:v18];
  locale = self->_locale;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__CLKComplicationDescriptor_isEqualForIdNameAndLocale___block_invoke_3;
  v16[3] = &unk_26440E508;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendObject:locale counterpart:v16];
  LOBYTE(locale) = [v5 isEqual];

  return (char)locale;
}

id __55__CLKComplicationDescriptor_isEqualForIdNameAndLocale___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __55__CLKComplicationDescriptor_isEqualForIdNameAndLocale___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

id __55__CLKComplicationDescriptor_isEqualForIdNameAndLocale___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 48);
}

- (unint64_t)hash
{
  uint64_t v2 = [(CLKComplicationDescriptor *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLKComplicationDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CLKComplicationDescriptor;
  uint64_t v5 = [(CLKComplicationDescriptor *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    id v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"supportedFamilies"];
    supportedFamilies = v5->_supportedFamilies;
    v5->_supportedFamilies = (NSArray *)v13;

    v15 = +[CLKComplicationDescriptor allowedDictionaryClasses];
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userActivity"];
    id v19 = [[CLKUserActivity alloc] initWithEncodedUserActivity:v18];
    clkUserActivity = v5->_clkUserActivity;
    v5->_clkUserActivity = v19;

    v5->_needsAppNotify = [v4 decodeBoolForKey:@"needsAppNotify"];
    id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    if (v21)
    {
      uint64_t v22 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v21];
      locale = v5->_locale;
      v5->_locale = (NSLocale *)v22;
    }
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widgetDescriptor"];
    widgetDescriptor = v5->_widgetDescriptor;
    v5->_widgetDescriptor = (CLKWidgetComplicationDescriptor *)v24;

    v26 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v7 = a3;
  [v7 encodeObject:identifier forKey:@"identifier"];
  [v7 encodeObject:self->_displayName forKey:@"displayName"];
  [v7 encodeObject:self->_supportedFamilies forKey:@"supportedFamilies"];
  [v7 encodeObject:self->_userInfo forKey:@"userInfo"];
  uint64_t v5 = [(CLKUserActivity *)self->_clkUserActivity encodedUserActivity];
  [v7 encodeObject:v5 forKey:@"userActivity"];

  [v7 encodeBool:self->_needsAppNotify forKey:@"needsAppNotify"];
  uint64_t v6 = [(NSLocale *)self->_locale localeIdentifier];
  [v7 encodeObject:v6 forKey:@"locale"];

  [v7 encodeObject:self->_widgetDescriptor forKey:@"widgetDescriptor"];
}

- (id)JSONObjectRepresentation
{
  v16[2] = *MEMORY[0x263EF8340];
  identifier = (__CFString *)self->_identifier;
  if (!identifier) {
    identifier = @"CLKDefaultComplicationIdentifier";
  }
  v15[0] = @"identifier";
  v15[1] = @"supportedFamilies";
  supportedFamilies = self->_supportedFamilies;
  if (!supportedFamilies) {
    supportedFamilies = (NSArray *)MEMORY[0x263EFFA68];
  }
  v16[0] = identifier;
  v16[1] = supportedFamilies;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  uint64_t v6 = (void *)[v5 mutableCopy];

  displayName = self->_displayName;
  if (displayName) {
    [v6 setObject:displayName forKeyedSubscript:@"displayName"];
  }
  userInfo = self->_userInfo;
  if (userInfo) {
    [v6 setObject:userInfo forKeyedSubscript:@"userInfo"];
  }
  clkUserActivity = self->_clkUserActivity;
  if (clkUserActivity)
  {
    id v10 = [(CLKUserActivity *)clkUserActivity encodedUserActivity];
    [v6 setObject:v10 forKeyedSubscript:@"userActivity"];
  }
  if (self->_needsAppNotify)
  {
    uint64_t v11 = [NSNumber numberWithBool:1];
    [v6 setObject:v11 forKeyedSubscript:@"needsAppNotify"];
  }
  uint64_t v12 = [(NSLocale *)self->_locale localeIdentifier];
  [v6 setObject:v12 forKeyedSubscript:@"locale"];

  uint64_t v13 = [(CLKWidgetComplicationDescriptor *)self->_widgetDescriptor JSONObjectRepresentation];
  [v6 setObject:v13 forKeyedSubscript:@"widgetDescriptor"];

  return v6;
}

- (CLKComplicationDescriptor)initWithJSONObjectRepresentation:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CLKComplicationDescriptor;
  uint64_t v5 = [(CLKComplicationDescriptor *)&v33 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    if (!v5->_identifier) {
      goto LABEL_6;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263F08170], @"CLKComplicationDescriptor identifier is disallowed class %@", objc_opt_class() format];
    }
    if (!v5->_identifier)
    {
LABEL_6:
      uint64_t v8 = [v4 objectForKeyedSubscript:@"type"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v8, "unsignedIntegerValue"));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v9 = v8;
        }
        else {
          v9 = @"CLKDefaultComplicationIdentifier";
        }
      }
      id v10 = v5->_identifier;
      v5->_identifier = &v9->isa;
    }
    uint64_t v11 = [v4 objectForKeyedSubscript:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v11;

    if (!v5->_displayName)
    {
      uint64_t v13 = [v4 objectForKeyedSubscript:@"localizedDisplayName"];
      id v14 = v5->_displayName;
      v5->_displayName = (NSString *)v13;
    }
    uint64_t v15 = [v4 objectForKeyedSubscript:@"supportedFamilies"];
    supportedFamilies = v5->_supportedFamilies;
    v5->_supportedFamilies = (NSArray *)v15;

    uint64_t v17 = [v4 objectForKeyedSubscript:@"userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v17;

    id v19 = [v4 objectForKeyedSubscript:@"userActivity"];
    v20 = [[CLKUserActivity alloc] initWithEncodedUserActivity:v19];
    clkUserActivity = v5->_clkUserActivity;
    v5->_clkUserActivity = v20;

    uint64_t v22 = [v4 objectForKeyedSubscript:@"needsAppNotify"];
    v5->_needsAppNotify = [v22 BOOLValue];

    v23 = [v4 objectForKeyedSubscript:@"locale"];
    if (v23)
    {
      uint64_t v24 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v23];
      locale = v5->_locale;
      v5->_locale = (NSLocale *)v24;
    }
    v26 = [v4 objectForKeyedSubscript:@"widgetDescriptor"];

    if (v26)
    {
      v27 = [CLKWidgetComplicationDescriptor alloc];
      objc_super v28 = [v4 objectForKeyedSubscript:@"widgetDescriptor"];
      uint64_t v29 = [(CLKWidgetComplicationDescriptor *)v27 initWithJSONObjectRepresentation:v28];
      widgetDescriptor = v5->_widgetDescriptor;
      v5->_widgetDescriptor = (CLKWidgetComplicationDescriptor *)v29;
    }
    v31 = v5;
  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)supportedFamilies
{
  return self->_supportedFamilies;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (BOOL)needsAppNotify
{
  return self->_needsAppNotify;
}

- (void)setNeedsAppNotify:(BOOL)a3
{
  self->_needsAppNotify = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (CLKUserActivity)clkUserActivity
{
  return self->_clkUserActivity;
}

- (void)setClkUserActivity:(id)a3
{
}

- (CLKWidgetComplicationDescriptor)widgetDescriptor
{
  return self->_widgetDescriptor;
}

- (void)setWidgetDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetDescriptor, 0);
  objc_storeStrong((id *)&self->_clkUserActivity, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_supportedFamilies, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end