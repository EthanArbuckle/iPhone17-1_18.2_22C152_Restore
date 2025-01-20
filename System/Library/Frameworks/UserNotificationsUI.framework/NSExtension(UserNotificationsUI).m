@interface NSExtension(UserNotificationsUI)
- (double)un_effectiveContentSizeRatio;
- (id)_un_contentSizeRatio;
- (id)_un_customSectionIdentifiers;
- (id)_un_extensionContainerBundleIdentifier;
- (id)un_allowedSourceIdentifiers;
- (id)un_supportedCategoryIdentifiers;
- (uint64_t)un_isDefaultContentHidden;
- (uint64_t)un_isDefaultTitleOverridden;
- (uint64_t)un_isUserInteractionEnabled;
- (void)_un_customSectionIdentifiers;
- (void)_un_extensionContainerBundleIdentifier;
- (void)un_supportedCategoryIdentifiers;
@end

@implementation NSExtension(UserNotificationsUI)

- (id)_un_extensionContainerBundleIdentifier
{
  id v2 = objc_alloc(MEMORY[0x263F01858]);
  v3 = [a1 identifier];
  id v10 = 0;
  v4 = (void *)[v2 initWithBundleIdentifier:v3 error:&v10];
  id v5 = v10;

  if (v4)
  {
    v6 = [v4 containingBundleRecord];
    v7 = [v6 bundleIdentifier];
  }
  else
  {
    v8 = (void *)UNLogExtensions;
    if (os_log_type_enabled((os_log_t)UNLogExtensions, OS_LOG_TYPE_ERROR)) {
      [(NSExtension(UserNotificationsUI) *)v8 _un_extensionContainerBundleIdentifier];
    }
    v7 = 0;
  }

  return v7;
}

- (id)_un_customSectionIdentifiers
{
  v13[1] = *MEMORY[0x263EF8340];
  id v2 = [a1 identifier];
  int v3 = [v2 hasPrefix:@"com.apple."];

  if (v3)
  {
    v4 = [a1 attributes];
    id v5 = [v4 objectForKey:@"UNNotificationExtensionCustomSectionIdentifier"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = UNLogExtensions;
        if (os_log_type_enabled((os_log_t)UNLogExtensions, OS_LOG_TYPE_ERROR)) {
          -[NSExtension(UserNotificationsUI) _un_customSectionIdentifiers](v9);
        }
        v8 = 0;
        goto LABEL_13;
      }
      v13[0] = v5;
      id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    }
    v8 = v6;
LABEL_13:

    goto LABEL_14;
  }
  v7 = (void *)UNLogExtensions;
  if (os_log_type_enabled((os_log_t)UNLogExtensions, OS_LOG_TYPE_ERROR)) {
    [(NSExtension(UserNotificationsUI) *)v7 _un_customSectionIdentifiers];
  }
  v8 = 0;
LABEL_14:
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (void *)MEMORY[0x263EFFA68];
  }
  id v11 = v10;

  return v11;
}

- (id)un_allowedSourceIdentifiers
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(a1, "_un_extensionContainerBundleIdentifier");
  int v3 = (void *)v2;
  if (v2)
  {
    v7[0] = v2;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    uint64_t v4 = objc_msgSend(a1, "_un_customSectionIdentifiers");
  }
  id v5 = (void *)v4;

  return v5;
}

- (id)un_supportedCategoryIdentifiers
{
  v7[1] = *MEMORY[0x263EF8340];
  v1 = [a1 attributes];
  uint64_t v2 = [v1 objectForKey:@"UNNotificationExtensionCategory"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
LABEL_5:
    uint64_t v4 = v3;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7[0] = v2;
    id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    goto LABEL_5;
  }
  id v5 = UNLogExtensions;
  if (os_log_type_enabled((os_log_t)UNLogExtensions, OS_LOG_TYPE_ERROR)) {
    -[NSExtension(UserNotificationsUI) un_supportedCategoryIdentifiers](v5);
  }
  uint64_t v4 = (void *)MEMORY[0x263EFFA68];
LABEL_9:

  return v4;
}

- (id)_un_contentSizeRatio
{
  v1 = [a1 attributes];
  uint64_t v2 = [v1 objectForKey:@"UNNotificationExtensionInitialContentSizeRatio"];

  return v2;
}

- (double)un_effectiveContentSizeRatio
{
  v1 = objc_msgSend(a1, "_un_contentSizeRatio");
  uint64_t v2 = v1;
  if (v1)
  {
    [v1 floatValue];
    double v4 = v3;
  }
  else
  {
    double v4 = 1.0;
  }

  return v4;
}

- (uint64_t)un_isDefaultContentHidden
{
  v1 = [a1 attributes];
  uint64_t v2 = [v1 objectForKey:@"UNNotificationExtensionDefaultContentHidden"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)un_isDefaultTitleOverridden
{
  v1 = [a1 attributes];
  uint64_t v2 = [v1 objectForKey:@"UNNotificationExtensionOverridesDefaultTitle"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)un_isUserInteractionEnabled
{
  v1 = [a1 attributes];
  uint64_t v2 = [v1 objectForKey:@"UNNotificationExtensionUserInteractionEnabled"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (void)_un_extensionContainerBundleIdentifier
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = [a2 identifier];
  v7 = [a3 localizedDescription];
  int v8 = 138543618;
  v9 = v6;
  __int16 v10 = 2114;
  id v11 = v7;
  _os_log_error_impl(&dword_222224000, v5, OS_LOG_TYPE_ERROR, "Encountered error obtaining application extension record for extension %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
}

- (void)_un_customSectionIdentifiers
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  double v4 = [a2 identifier];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_222224000, v3, OS_LOG_TYPE_ERROR, "Extension %{public}@ requested a custom section identifier but it is not an internal extension", (uint8_t *)&v5, 0xCu);
}

- (void)un_supportedCategoryIdentifiers
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  uint64_t v2 = @"UNNotificationExtensionCategory";
  _os_log_error_impl(&dword_222224000, log, OS_LOG_TYPE_ERROR, "Invalid value for %{public}@ in Info.plist", (uint8_t *)&v1, 0xCu);
}

@end