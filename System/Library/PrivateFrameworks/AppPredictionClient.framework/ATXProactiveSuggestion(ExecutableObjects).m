@interface ATXProactiveSuggestion(ExecutableObjects)
+ (__CFString)genericStringForExecutableObject:()ExecutableObjects;
- (id)appClipHeroAppPredictionExecutableObject;
- (id)atxActionExecutableObject;
- (id)atxInfoSuggestionExecutableObject;
- (id)atxShortcutsActionExecutableObject;
- (id)atxSpotlightActionExecutableObject;
- (id)bundleIdExecutableObject;
- (id)genericStringForSuggestionExecutableObject;
- (id)heroDataExecutableObject;
- (id)linkActionExecutableObject;
@end

@implementation ATXProactiveSuggestion(ExecutableObjects)

- (id)bundleIdExecutableObject
{
  v1 = [a1 executableSpecification];
  if ([v1 executableType] == 1
    && ([v1 executableObject],
        v2 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v2,
        (isKindOfClass & 1) != 0))
  {
    v4 = [v1 executableObject];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)heroDataExecutableObject
{
  v2 = [a1 executableSpecification];
  if ([v2 executableType] == 1
    && ([v2 executableObject],
        v3 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v3,
        (isKindOfClass & 1) != 0))
  {
    uint64_t v5 = [v2 executableObject];
  }
  else
  {
    uint64_t v5 = [a1 appClipHeroAppPredictionExecutableObject];
  }
  v6 = (void *)v5;

  return v6;
}

- (id)appClipHeroAppPredictionExecutableObject
{
  v1 = [a1 executableSpecification];
  if ([v1 executableType] != 5) {
    goto LABEL_4;
  }
  v2 = [v1 executableClassString];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  int v5 = [v2 isEqualToString:v4];

  if (v5)
  {
    v6 = [v1 executableObject];
  }
  else
  {
LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (id)atxActionExecutableObject
{
  v1 = [a1 executableSpecification];
  if ([v1 executableType] != 2) {
    goto LABEL_4;
  }
  v2 = [v1 executableClassString];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  int v5 = [v2 isEqualToString:v4];

  if (v5)
  {
    v6 = [v1 executableObject];
  }
  else
  {
LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (id)atxInfoSuggestionExecutableObject
{
  v1 = [a1 executableSpecification];
  if ([v1 executableType] != 3) {
    goto LABEL_4;
  }
  v2 = [v1 executableClassString];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  int v5 = [v2 isEqualToString:v4];

  if (v5)
  {
    v6 = [v1 executableObject];
  }
  else
  {
LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (id)atxSpotlightActionExecutableObject
{
  v1 = [a1 executableSpecification];
  if ([v1 executableType] != 8) {
    goto LABEL_4;
  }
  v2 = [v1 executableClassString];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  int v5 = [v2 isEqualToString:v4];

  if (v5)
  {
    v6 = [v1 executableObject];
  }
  else
  {
LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (id)atxShortcutsActionExecutableObject
{
  v1 = [a1 executableSpecification];
  if ([v1 executableType] != 9) {
    goto LABEL_4;
  }
  v2 = [v1 executableClassString];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  int v5 = [v2 isEqualToString:v4];

  if (v5)
  {
    v6 = [v1 executableObject];
  }
  else
  {
LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (id)linkActionExecutableObject
{
  v1 = [a1 executableSpecification];
  if ([v1 executableType] != 10) {
    goto LABEL_4;
  }
  v2 = [v1 executableClassString];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  int v5 = [v2 isEqualToString:v4];

  if (v5)
  {
    v6 = [v1 executableObject];
  }
  else
  {
LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (id)genericStringForSuggestionExecutableObject
{
  v1 = [a1 executableSpecification];
  v2 = [v1 executableObject];

  v3 = [(id)objc_opt_class() genericStringForExecutableObject:v2];

  return v3;
}

+ (__CFString)genericStringForExecutableObject:()ExecutableObjects
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 actionKey];
LABEL_10:
    v11 = v4;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = (objc_class *)NSString;
    id v6 = v3;
    id v7 = [v5 alloc];
    v8 = [v6 appBundleIdentifier];
    v9 = [v6 widgetBundleIdentifier];
    v10 = [v6 widgetKind];

    v11 = (__CFString *)[v7 initWithFormat:@"%@:%@:%@", v8, v9, v10];
LABEL_5:

    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 bundleId];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (__CFString *)v3;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = (objc_class *)NSString;
    id v14 = v3;
    id v15 = [v13 alloc];
    v8 = [v14 bundleId];
    v9 = [v14 action];

    v16 = [v9 identifier];
    v11 = (__CFString *)[v15 initWithFormat:@"%@:%@", v8, v16];

    goto LABEL_5;
  }
  v11 = &stru_1EFD9B408;
LABEL_11:

  return v11;
}

@end