@interface DEDExtension
+ (id)archivedClasses;
+ (id)extensionWithDEExtension:(id)a3;
+ (id)extensionWithDictionary:(id)a3;
- (BOOL)requiresDataClassBAccessToRun;
- (DEDExtensionIdentifier)dedExtensionIdentifier;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedConsentText;
- (NSString)localizedDataCollectedExplanation;
- (NSString)localizedDataCollectedSummary;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serialize;
- (void)setDedExtensionIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocalizedConsentText:(id)a3;
- (void)setLocalizedDataCollectedExplanation:(id)a3;
- (void)setLocalizedDataCollectedSummary:(id)a3;
- (void)setName:(id)a3;
- (void)setRequiresDataClassBAccessToRun:(BOOL)a3;
@end

@implementation DEDExtension

+ (id)extensionWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 objectForKeyedSubscript:@"name"];
  v6 = stringIfNil(v5);
  [v4 setName:v6];

  v7 = [v3 objectForKeyedSubscript:@"identifier"];
  v8 = stringIfNil(v7);
  [v4 setIdentifier:v8];

  v9 = [v3 objectForKeyedSubscript:@"localizedConsentText"];
  [v4 setLocalizedConsentText:v9];

  v10 = [v3 objectForKeyedSubscript:@"localizedDataCollectedExplanation"];
  [v4 setLocalizedDataCollectedExplanation:v10];

  v11 = [v3 objectForKeyedSubscript:@"localizedDataCollectedSummary"];
  [v4 setLocalizedDataCollectedSummary:v11];

  v12 = [v3 objectForKeyedSubscript:@"requiresDataClassBAccessToRun"];
  objc_msgSend(v4, "setRequiresDataClassBAccessToRun:", objc_msgSend(v12, "BOOLValue"));

  v13 = [v3 objectForKeyedSubscript:@"dedExtensionIdentifier"];

  if (v13)
  {
    v14 = [DEDExtensionIdentifier alloc];
    v15 = [v3 objectForKeyedSubscript:@"dedExtensionIdentifier"];
    v16 = [(DEDExtensionIdentifier *)v14 initWithString:v15];
    [v4 setDedExtensionIdentifier:v16];
  }
  return v4;
}

+ (id)extensionWithDEExtension:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 attachmentsName];
  v6 = stringIfNil(v5);
  [v4 setName:v6];

  v7 = [v3 identifier];
  v8 = stringIfNil(v7);
  [v4 setIdentifier:v8];

  v9 = [v3 identifier];
  [v9 isEqualToString:@"com.apple.DiagnosticExtensions.iOSExtension"];

  uint64_t v10 = [v3 requiresDataClassBAccessToRun];
  [v4 setRequiresDataClassBAccessToRun:v10];
  return v4;
}

- (id)serialize
{
  v24[4] = *MEMORY[0x263EF8340];
  v23[0] = @"name";
  id v3 = [(DEDExtension *)self name];
  v4 = stringIfNil(v3);
  v24[0] = v4;
  v23[1] = @"identifier";
  v5 = [(DEDExtension *)self identifier];
  v6 = stringIfNil(v5);
  v24[1] = v6;
  v23[2] = @"dedExtensionIdentifier";
  v7 = [(DEDExtension *)self dedExtensionIdentifier];
  v8 = [v7 stringValue];
  v9 = stringIfNil(v8);
  v24[2] = v9;
  v23[3] = @"requiresDataClassBAccessToRun";
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[DEDExtension requiresDataClassBAccessToRun](self, "requiresDataClassBAccessToRun"));
  v24[3] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];

  v12 = [(DEDExtension *)self localizedConsentText];
  if (v12
    || ([(DEDExtension *)self localizedDataCollectedSummary],
        (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    v13 = (void *)[v11 mutableCopy];
    v14 = [(DEDExtension *)self localizedConsentText];
    v15 = stringIfNil(v14);
    [v13 setObject:v15 forKeyedSubscript:@"localizedConsentText"];

    v16 = [(DEDExtension *)self localizedDataCollectedExplanation];
    v17 = stringIfNil(v16);
    [v13 setObject:v17 forKeyedSubscript:@"localizedDataCollectedExplanation"];

    v18 = [(DEDExtension *)self localizedDataCollectedSummary];
    v19 = stringIfNil(v18);
    [v13 setObject:v19 forKeyedSubscript:@"localizedDataCollectedSummary"];

    id v20 = [NSDictionary dictionaryWithDictionary:v13];

    goto LABEL_5;
  }
  v22 = [(DEDExtension *)self localizedDataCollectedExplanation];

  if (v22) {
    goto LABEL_4;
  }
  id v20 = v11;
LABEL_5:

  return v20;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DEDExtension;
  v4 = [(DEDExtension *)&v8 description];
  v5 = [(DEDExtension *)self serialize];
  v6 = [v3 stringWithFormat:@"%@ - %@", v4, v5];

  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[DEDExtension allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_name, self->_name);
  objc_storeStrong((id *)&v4->_identifier, self->_identifier);
  objc_storeStrong((id *)&v4->_dedExtensionIdentifier, self->_dedExtensionIdentifier);
  v4->_requiresDataClassBAccessToRun = self->_requiresDataClassBAccessToRun;
  return v4;
}

+ (id)archivedClasses
{
  if (archivedClasses_onceToken_1 != -1) {
    dispatch_once(&archivedClasses_onceToken_1, &__block_literal_global_15);
  }
  v2 = (void *)archivedClasses__classes_0;
  return v2;
}

void __31__DEDExtension_archivedClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v1 = objc_opt_class();
  v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  id v3 = +[DEDExtensionIdentifier archivedClasses];
  [v2 unionSet:v3];

  v4 = (void *)archivedClasses__classes_0;
  archivedClasses__classes_0 = (uint64_t)v2;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (DEDExtensionIdentifier)dedExtensionIdentifier
{
  return (DEDExtensionIdentifier *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDedExtensionIdentifier:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setName:(id)a3
{
}

- (BOOL)requiresDataClassBAccessToRun
{
  return self->_requiresDataClassBAccessToRun;
}

- (void)setRequiresDataClassBAccessToRun:(BOOL)a3
{
  self->_requiresDataClassBAccessToRun = a3;
}

- (NSString)localizedConsentText
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocalizedConsentText:(id)a3
{
}

- (NSString)localizedDataCollectedExplanation
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocalizedDataCollectedExplanation:(id)a3
{
}

- (NSString)localizedDataCollectedSummary
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLocalizedDataCollectedSummary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDataCollectedSummary, 0);
  objc_storeStrong((id *)&self->_localizedDataCollectedExplanation, 0);
  objc_storeStrong((id *)&self->_localizedConsentText, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_dedExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end