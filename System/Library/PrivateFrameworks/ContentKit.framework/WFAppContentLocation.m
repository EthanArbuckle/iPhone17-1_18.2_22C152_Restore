@interface WFAppContentLocation
+ (BOOL)supportsSecureCoding;
+ (id)locationWithAppDescriptor:(id)a3;
+ (id)locationWithAppDescriptor:(id)a3 managedLevel:(unint64_t)a4;
+ (id)locationWithAppDescriptor:(id)a3 managedLevel:(unint64_t)a4 promptingBehaviour:(unint64_t)a5;
+ (id)locationWithAppDescriptor:(id)a3 promptingBehaviour:(unint64_t)a4;
+ (id)locationWithSystemAppBundleIdentifier:(id)a3;
+ (id)locationWithSystemAppBundleIdentifier:(id)a3 promptingBehaviour:(unint64_t)a4;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
+ (id)platformFileManagerLocation;
- (BOOL)isEqual:(id)a3;
- (INAppDescriptor)appDescriptor;
- (NSDictionary)serializedAppDescriptor;
- (NSString)description;
- (WFAppContentLocation)initWithAppDescriptor:(id)a3 serializedAppDescriptor:(id)a4 identifier:(id)a5 managedLevel:(unint64_t)a6 promptingBehaviour:(unint64_t)a7;
- (WFAppContentLocation)initWithCoder:(id)a3;
- (id)app;
- (id)localizedMDMDescription;
- (id)localizedTitle;
- (id)wfSerializedRepresentation;
- (unint64_t)hash;
- (unint64_t)managedLevel;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAppContentLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedAppDescriptor, 0);
  objc_storeStrong((id *)&self->_appDescriptor, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->localizedTitle, 0);
}

- (unint64_t)managedLevel
{
  return self->_managedLevel;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFAppContentLocation *)self appDescriptor];
  v7 = [v3 stringWithFormat:@"<%@: %p, app descriptor: %@, promptingBehaviour: %tu>", v5, self, v6, -[WFContentLocation promptingBehaviour](self, "promptingBehaviour")];

  return (NSString *)v7;
}

- (id)wfSerializedRepresentation
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  v9.receiver = self;
  v9.super_class = (Class)WFAppContentLocation;
  v4 = [(WFContentLocation *)&v9 wfSerializedRepresentation];
  v5 = [v3 dictionaryWithDictionary:v4];

  v6 = [(WFAppContentLocation *)self serializedAppDescriptor];
  [v5 setValue:v6 forKey:@"appDescriptor"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFAppContentLocation managedLevel](self, "managedLevel"));
  [v5 setValue:v7 forKey:@"managedLevel"];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFAppContentLocation;
  id v4 = a3;
  [(WFContentLocation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_appDescriptor, @"appDescriptor", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_serializedAppDescriptor forKey:@"serializedAppDescriptor"];
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFAppContentLocation managedLevel](self, "managedLevel"), @"managedLevel");
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFContentLocation promptingBehaviour](self, "promptingBehaviour"), @"promptingBehaviour");
}

- (WFAppContentLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appDescriptor"];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"serializedAppDescriptor"];

  uint64_t v14 = [v4 decodeIntegerForKey:@"managedLevel"];
  uint64_t v15 = [v4 decodeIntegerForKey:@"promptingBehaviour"];

  v16 = [(WFAppContentLocation *)self initWithAppDescriptor:v5 serializedAppDescriptor:v13 identifier:@"com.apple.shortcuts.appdestination" managedLevel:v14 promptingBehaviour:v15];
  return v16;
}

- (unint64_t)hash
{
  v2 = [(WFAppContentLocation *)self appDescriptor];
  unint64_t v3 = [v2 hashForSmartPromptPurposes];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10.receiver = self;
    v10.super_class = (Class)WFAppContentLocation;
    if ([(WFContentLocation *)&v10 isEqual:v4])
    {
      objc_super v5 = [(WFAppContentLocation *)self appDescriptor];
      v6 = [v4 appDescriptor];
      char v7 = [v5 isEqualForSmartPromptPurposes:v6];
    }
    else
    {
      char v7 = 0;
    }
    uint64_t v8 = v4;
  }
  else
  {

    uint64_t v8 = 0;
    char v7 = 0;
  }

  return v7;
}

- (id)localizedMDMDescription
{
  unint64_t v3 = [(WFAppContentLocation *)self appDescriptor];
  id v4 = [v3 localizedName];

  if (v4)
  {
    unint64_t v5 = [(WFAppContentLocation *)self managedLevel];
    v6 = NSString;
    if (v5 == 2) {
      char v7 = @"the managed “%@” app";
    }
    else {
      char v7 = @"the unmanaged “%@” app";
    }
    uint64_t v8 = WFLocalizedString(v7);
    uint64_t v9 = objc_msgSend(v6, "localizedStringWithFormat:", v8, v4);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)app
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(WFAppContentLocation *)self appDescriptor];
  id v4 = [v3 bundleIdentifier];

  if (v4)
  {
    unint64_t v5 = [(WFAppContentLocation *)self appDescriptor];
    v6 = [v5 applicationRecord];

    if (v6) {
      goto LABEL_7;
    }
    char v7 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [(WFAppContentLocation *)self appDescriptor];
      uint64_t v9 = [v8 bundleIdentifier];
      int v11 = 136315394;
      v12 = "-[WFAppContentLocation app]";
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_ERROR, "%s Failed to get application record for bundleIdentifier: %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  v6 = 0;
LABEL_7:
  return v6;
}

- (NSDictionary)serializedAppDescriptor
{
  serializedAppDescriptor = self->_serializedAppDescriptor;
  if (!serializedAppDescriptor)
  {
    serializedAppDescriptor = self->_appDescriptor;
    if (serializedAppDescriptor)
    {
      id v4 = [serializedAppDescriptor serializedRepresentation];
      unint64_t v5 = self->_serializedAppDescriptor;
      self->_serializedAppDescriptor = v4;

      serializedAppDescriptor = self->_serializedAppDescriptor;
    }
  }
  return (NSDictionary *)serializedAppDescriptor;
}

- (INAppDescriptor)appDescriptor
{
  appDescriptor = self->_appDescriptor;
  if (!appDescriptor)
  {
    if (self->_serializedAppDescriptor)
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x263F0F988]) initWithSerializedRepresentation:self->_serializedAppDescriptor];
      unint64_t v5 = [MEMORY[0x263F0F9B0] sharedResolver];
      v6 = [v5 resolvedAppMatchingDescriptor:v4];
      char v7 = self->_appDescriptor;
      self->_appDescriptor = v6;

      appDescriptor = self->_appDescriptor;
    }
    else
    {
      appDescriptor = 0;
    }
  }
  return appDescriptor;
}

- (id)localizedTitle
{
  localizedTitle = self->_localizedTitle;
  if (!localizedTitle)
  {
    v6 = [(WFAppContentLocation *)self appDescriptor];
    char v7 = [v6 localizedName];
    uint64_t v8 = v7;
    if (!v7)
    {
      v2 = [(WFAppContentLocation *)self appDescriptor];
      unint64_t v3 = [v2 applicationRecord];
      uint64_t v8 = [v3 localizedName];
    }
    uint64_t v9 = (NSString *)[v8 copy];
    objc_super v10 = self->_localizedTitle;
    self->_localizedTitle = v9;

    if (!v7)
    {
    }
    localizedTitle = self->_localizedTitle;
  }
  return localizedTitle;
}

- (WFAppContentLocation)initWithAppDescriptor:(id)a3 serializedAppDescriptor:(id)a4 identifier:(id)a5 managedLevel:(unint64_t)a6 promptingBehaviour:(unint64_t)a7
{
  unint64_t v14 = (unint64_t)a3;
  unint64_t v15 = (unint64_t)a4;
  id v16 = a5;
  if (!(v14 | v15))
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFAppContentLocation.m", 43, @"Invalid parameter not satisfying: %@", @"descriptor || serializedAppDescriptor" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)WFAppContentLocation;
  v17 = [(WFContentLocation *)&v22 initWithIdentifier:v16 promptingBehaviour:a7];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_appDescriptor, a3);
    objc_storeStrong((id *)&v18->_serializedAppDescriptor, a4);
    v18->_managedLevel = a6;
    v19 = v18;
  }

  return v18;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"appDescriptor"];
  if (v5)
  {
LABEL_6:
    uint64_t v9 = [v4 wfObjectOfClass:objc_opt_class() forKeyPath:@"managedLevel"];
    uint64_t v10 = [v9 unsignedIntegerValue];

    int v11 = (void *)[objc_alloc((Class)a1) initWithAppDescriptor:0 serializedAppDescriptor:v5 identifier:@"com.apple.shortcuts.appdestination" managedLevel:v10 promptingBehaviour:0];
    goto LABEL_7;
  }
  v6 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  char v7 = getWFWorkflowExecutionLogObject();
  unint64_t v5 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315138;
      unint64_t v14 = "+[WFAppContentLocation objectWithWFSerializedRepresentation:]";
      _os_log_impl(&dword_216505000, v5, OS_LOG_TYPE_DEBUG, "%s Reading legacy bundle identifier from WFAppContentLocation and upgrading to app descriptor", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F0F988]) initWithBundleIdentifier:v6];
    unint64_t v5 = [v8 serializedRepresentation];

    goto LABEL_6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315138;
    unint64_t v14 = "+[WFAppContentLocation objectWithWFSerializedRepresentation:]";
    _os_log_impl(&dword_216505000, v5, OS_LOG_TYPE_ERROR, "%s Failed to decode app descriptor from WFAppContentLocation", (uint8_t *)&v13, 0xCu);
  }
  int v11 = 0;
LABEL_7:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)platformFileManagerLocation
{
  return (id)[a1 locationWithSystemAppBundleIdentifier:*MEMORY[0x263F854E8]];
}

+ (id)locationWithAppDescriptor:(id)a3 managedLevel:(unint64_t)a4 promptingBehaviour:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithAppDescriptor:v8 serializedAppDescriptor:0 identifier:@"com.apple.shortcuts.appdestination" managedLevel:a4 promptingBehaviour:a5];

  return v9;
}

+ (id)locationWithAppDescriptor:(id)a3 managedLevel:(unint64_t)a4
{
  return (id)[a1 locationWithAppDescriptor:a3 managedLevel:a4 promptingBehaviour:0];
}

+ (id)locationWithAppDescriptor:(id)a3 promptingBehaviour:(unint64_t)a4
{
  id v6 = a3;
  char v7 = +[WFManagedConfigurationProfile defaultProfile];
  id v8 = [v6 bundleIdentifier];
  int v9 = [v7 isAppManaged:v8];

  if (v9) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  int v11 = (void *)[objc_alloc((Class)a1) initWithAppDescriptor:v6 serializedAppDescriptor:0 identifier:@"com.apple.shortcuts.appdestination" managedLevel:v10 promptingBehaviour:a4];

  return v11;
}

+ (id)locationWithAppDescriptor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_msgSend(a1, "locationWithAppDescriptor:promptingBehaviour:", v4, objc_msgSend(v4, "isThirdParty"));

  return v5;
}

+ (id)locationWithSystemAppBundleIdentifier:(id)a3 promptingBehaviour:(unint64_t)a4
{
  id v6 = (objc_class *)MEMORY[0x263F0F988];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithBundleIdentifier:v7];

  int v9 = [MEMORY[0x263F0F9B0] sharedResolver];
  uint64_t v10 = [v9 resolvedAppMatchingDescriptor:v8];

  int v11 = [a1 locationWithAppDescriptor:v10 promptingBehaviour:a4];

  return v11;
}

+ (id)locationWithSystemAppBundleIdentifier:(id)a3
{
  return (id)[a1 locationWithSystemAppBundleIdentifier:a3 promptingBehaviour:0];
}

@end