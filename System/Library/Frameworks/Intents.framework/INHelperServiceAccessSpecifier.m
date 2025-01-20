@interface INHelperServiceAccessSpecifier
+ (id)accessSpecifierAppropriateForCurrentProcess;
+ (id)accessSpecifierAppropriateForXPCConnection:(id)a3;
+ (id)accessSpecifierFilteredForAssociatedAppBundleIdentifier:(id)a3;
+ (id)accessSpecifierUnrestricted;
+ (id)accessSpecifierWithNoAccess;
+ (void)initialize;
- (INHelperServiceAccessSpecifier)initWithAccessLevel:(unint64_t)a3 associatedAppBundleIdentifier:(id)a4;
- (NSString)associatedAppBundleIdentifier;
- (id)debugDescription;
- (unint64_t)accessLevel;
@end

@implementation INHelperServiceAccessSpecifier

- (void).cxx_destruct
{
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (id)debugDescription
{
  unint64_t v3 = [(INHelperServiceAccessSpecifier *)self accessLevel];
  if (v3 == 2)
  {
    v4 = @"Unrestricted";
  }
  else if (v3 == 1)
  {
    v5 = NSString;
    v6 = [(INHelperServiceAccessSpecifier *)self associatedAppBundleIdentifier];
    [v5 stringWithFormat:@"FilteredByBundleID=%@", v6];
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3)
  {
    v4 = 0;
  }
  else
  {
    v4 = @"None";
  }
  v7 = NSString;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [v7 stringWithFormat:@"<%@: %p %@>", v9, self, v4];

  return v10;
}

- (INHelperServiceAccessSpecifier)initWithAccessLevel:(unint64_t)a3 associatedAppBundleIdentifier:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INHelperServiceAccessSpecifier;
  v7 = [(INHelperServiceAccessSpecifier *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_accessLevel = a3;
    uint64_t v9 = [v6 copy];
    associatedAppBundleIdentifier = v8->_associatedAppBundleIdentifier;
    v8->_associatedAppBundleIdentifier = (NSString *)v9;
  }
  return v8;
}

+ (id)accessSpecifierAppropriateForXPCConnection:(id)a3
{
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = v3;
  int v5 = [v4 processIdentifier];
  bzero(buffer, 0x1000uLL);
  int v6 = proc_pidpath(v5, buffer, 0x1000u);
  if (v6 >= 1
    && (v7 = (void *)[[NSString alloc] initWithBytes:buffer length:v6 encoding:4], v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CB10]), "initFileURLWithPath:isDirectory:", v7, 1), uint64_t v9 = (void *)_CFBundleCopyBundleURLForExecutableURL(), v8, v7, v9))
  {
    v10 = [MEMORY[0x1E4F223F0] bundleProxyForURL:v9];
    if (!v10)
    {
      v11 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        int v23 = 136315394;
        v24 = "bundleProxyForPID";
        __int16 v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_INFO, "%s No bundleProxy for bundleURL=%{publid}@", (uint8_t *)&v23, 0x16u);
      }
    }
  }
  else
  {
    objc_super v12 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      int v23 = 136315394;
      v24 = "bundleProxyForPID";
      __int16 v25 = 1024;
      LODWORD(v26) = v5;
      _os_log_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_INFO, "%s No bundleURL for pid=%{publid}d", (uint8_t *)&v23, 0x12u);
    }
    v10 = 0;
  }
  v13 = [v4 valueForEntitlement:@"com.apple.intents.intents-helper"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 BOOLValue])
  {
    v14 = +[INHelperServiceAccessSpecifier accessSpecifierUnrestricted];
  }
  else
  {
    v15 = [v4 valueForEntitlement:@"com.apple.intents.extension.discovery"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v15 BOOLValue]
      || !v10
      || ([v10 bundleIdentifier],
          v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [v16 isEqualToString:@"com.apple.WorkflowUI.AddShortcutExtension"],
          v16,
          v17))
    {
      v14 = +[INHelperServiceAccessSpecifier accessSpecifierUnrestricted];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v18 = v10;
      }
      else {
        v18 = 0;
      }
      id v19 = v18;
      v20 = v19;
      if (v19 && objc_msgSend(v19, "if_isSystem"))
      {
        v14 = +[INHelperServiceAccessSpecifier accessSpecifierUnrestricted];
      }
      else
      {
        v21 = [v10 bundleIdentifier];
        if (v21) {
          +[INHelperServiceAccessSpecifier accessSpecifierFilteredForAssociatedAppBundleIdentifier:v21];
        }
        else {
        v14 = +[INHelperServiceAccessSpecifier accessSpecifierWithNoAccess];
        }
      }
    }
  }

  return v14;
}

+ (id)accessSpecifierAppropriateForCurrentProcess
{
  if (INThisProcessIsAssistantd_onceToken != -1) {
    dispatch_once(&INThisProcessIsAssistantd_onceToken, &__block_literal_global_74918);
  }
  if (INThisProcessIsAssistantd_isAssistantd) {
    goto LABEL_10;
  }
  if (INThisProcessIsSiri_onceToken != -1) {
    dispatch_once(&INThisProcessIsSiri_onceToken, &__block_literal_global_40);
  }
  if (INThisProcessIsSiri_isSiri) {
    goto LABEL_10;
  }
  if (INThisProcessIsCarousel_onceToken != -1) {
    dispatch_once(&INThisProcessIsCarousel_onceToken, &__block_literal_global_43);
  }
  if (INThisProcessIsCarousel_isCarousel)
  {
LABEL_10:
    id v3 = [a1 accessSpecifierUnrestricted];
  }
  else
  {
    id v3 = [a1 accessSpecifierWithNoAccess];
  }

  return v3;
}

+ (id)accessSpecifierWithNoAccess
{
  v2 = (void *)[objc_alloc((Class)a1) initWithAccessLevel:0 associatedAppBundleIdentifier:0];

  return v2;
}

+ (id)accessSpecifierFilteredForAssociatedAppBundleIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = (void *)[objc_alloc((Class)a1) initWithAccessLevel:1 associatedAppBundleIdentifier:v4];

  return v5;
}

+ (id)accessSpecifierUnrestricted
{
  v2 = (void *)[objc_alloc((Class)a1) initWithAccessLevel:2 associatedAppBundleIdentifier:0];

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

@end