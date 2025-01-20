@interface DEDExtensionIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)archivedClasses;
+ (id)log;
+ (id)parseDEDIdentifierString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (DEDExtensionIdentifier)initWithCoder:(id)a3;
- (DEDExtensionIdentifier)initWithExtensionIdentifier:(id)a3 invocationNumber:(int64_t)a4;
- (DEDExtensionIdentifier)initWithString:(id)a3;
- (NSString)extensionIdentifier;
- (NSString)stringValue;
- (int64_t)invocationNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setExtensionIdentifier:(id)a3;
- (void)setInvocationNumber:(int64_t)a3;
@end

@implementation DEDExtensionIdentifier

+ (id)log
{
  if (log_onceToken_3 != -1) {
    dispatch_once(&log_onceToken_3, &__block_literal_global_17);
  }
  v2 = (void *)log_log_3;
  return v2;
}

void __29__DEDExtensionIdentifier_log__block_invoke()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "ded-identifier");
  v1 = (void *)log_log_3;
  log_log_3 = (uint64_t)v0;
}

+ (id)parseDEDIdentifierString:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 componentsSeparatedByString:@"."];
  v5 = (void *)[v4 mutableCopy];

  v6 = [v5 lastObject];
  v7 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  v8 = [v6 stringByTrimmingCharactersInSet:v7];

  if ([v8 isEqualToString:&stru_26D197018])
  {
    [v5 removeLastObject];
    v9 = [v5 componentsJoinedByString:@"."];
    v12[0] = v9;
    v12[1] = v6;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  }
  else
  {
    v13[0] = v3;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }

  return v10;
}

- (DEDExtensionIdentifier)initWithString:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DEDExtensionIdentifier;
  v5 = [(DEDExtensionIdentifier *)&v15 init];
  if (!v5)
  {
LABEL_9:
    v10 = v5;
    goto LABEL_10;
  }
  v6 = [(id)objc_opt_class() parseDEDIdentifierString:v4];
  v7 = v6;
  if (v6 && [v6 count])
  {
    if ([v7 count] == 1)
    {
      uint64_t v8 = [v7 firstObject];
      extensionIdentifier = v5->_extensionIdentifier;
      v5->_extensionIdentifier = (NSString *)v8;

      v5->_invocationNumber = 0;
    }
    else
    {
      v11 = [v7 lastObject];
      v5->_invocationNumber = [v11 integerValue];

      uint64_t v12 = [v7 firstObject];
      v13 = v5->_extensionIdentifier;
      v5->_extensionIdentifier = (NSString *)v12;
    }
    goto LABEL_9;
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (DEDExtensionIdentifier)initWithExtensionIdentifier:(id)a3 invocationNumber:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DEDExtensionIdentifier;
  uint64_t v8 = [(DEDExtensionIdentifier *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_extensionIdentifier, a3);
    v9->_invocationNumber = a4;
  }

  return v9;
}

- (NSString)stringValue
{
  if ([(DEDExtensionIdentifier *)self invocationNumber])
  {
    id v3 = NSString;
    id v4 = [(DEDExtensionIdentifier *)self extensionIdentifier];
    v5 = [v3 stringWithFormat:@"%@.%ld", v4, -[DEDExtensionIdentifier invocationNumber](self, "invocationNumber")];
  }
  else
  {
    v5 = [(DEDExtensionIdentifier *)self extensionIdentifier];
  }
  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(DEDExtensionIdentifier *)self extensionIdentifier];
  [v5 encodeObject:v4 forKey:@"extensionIdentifier"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[DEDExtensionIdentifier invocationNumber](self, "invocationNumber"), @"invocationNumber");
}

- (DEDExtensionIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DEDExtensionIdentifier;
  id v5 = [(DEDExtensionIdentifier *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionIdentifier"];
    extensionIdentifier = v5->_extensionIdentifier;
    v5->_extensionIdentifier = (NSString *)v6;

    v5->_invocationNumber = [v4 decodeIntegerForKey:@"invocationNumber"];
  }

  return v5;
}

+ (id)archivedClasses
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__DEDExtensionIdentifier_archivedClasses__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (archivedClasses_onceToken_2 != -1) {
    dispatch_once(&archivedClasses_onceToken_2, block);
  }
  id v2 = (void *)archivedClasses_classes;
  return v2;
}

uint64_t __41__DEDExtensionIdentifier_archivedClasses__block_invoke()
{
  os_log_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  archivedClasses_classes = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  return MEMORY[0x270F9A758]();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [(DEDExtensionIdentifier *)self extensionIdentifier];
    id v7 = [v5 extensionIdentifier];
    if ([v6 isEqualToString:v7])
    {
      int64_t v8 = [(DEDExtensionIdentifier *)self invocationNumber];
      BOOL v9 = v8 == [v5 invocationNumber];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSString)extensionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setExtensionIdentifier:(id)a3
{
}

- (int64_t)invocationNumber
{
  return self->_invocationNumber;
}

- (void)setInvocationNumber:(int64_t)a3
{
  self->_invocationNumber = a3;
}

- (void).cxx_destruct
{
}

@end