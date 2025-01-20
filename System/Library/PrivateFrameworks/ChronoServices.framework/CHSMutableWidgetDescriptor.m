@interface CHSMutableWidgetDescriptor
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBackgroundRemovable:(BOOL)a3;
- (void)setContainerBundleIdentifier:(id)a3;
- (void)setDisfavoredLocations:(id)a3;
- (void)setDisfavoredLocations:(unint64_t)a3 on:(int64_t)a4;
- (void)setDisplayName:(id)a3;
- (void)setEnablement:(unint64_t)a3;
- (void)setEnablesMultipleTapTargets:(BOOL)a3;
- (void)setEventMachServiceName:(id)a3;
- (void)setExtensionBundleIdentifier:(id)a3;
- (void)setExtensionIdentity:(id)a3;
- (void)setHiddenBySensitiveUI:(BOOL)a3;
- (void)setIntentRecommendationsContainer:(id)a3;
- (void)setIntentType:(id)a3;
- (void)setKind:(id)a3;
- (void)setLocaleToken:(id)a3;
- (void)setNativeContainerBundleIdentifier:(id)a3;
- (void)setPlatform:(unint64_t)a3;
- (void)setPreferredBackgroundStyle:(int64_t)a3;
- (void)setPromptsForUserConfiguration:(BOOL)a3;
- (void)setRequiredFeatureFlags:(id)a3;
- (void)setSdkVersion:(id)a3;
- (void)setSupportedFamilies:(unint64_t)a3;
- (void)setSupportsAccentedContent:(BOOL)a3;
- (void)setSupportsInteraction:(BOOL)a3;
- (void)setSupportsVibrantContent:(BOOL)a3;
- (void)setTransparent:(BOOL)a3;
- (void)setWidgetDescription:(id)a3;
- (void)setWidgetVisibility:(int64_t)a3;
@end

@implementation CHSMutableWidgetDescriptor

- (void)setExtensionIdentity:(id)a3
{
  id v6 = a3;
  v4 = (CHSExtensionIdentity *)[v6 copy];
  extensionIdentity = self->super.super._extensionIdentity;
  self->super.super._extensionIdentity = v4;
}

- (void)setNativeContainerBundleIdentifier:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  nativeContainerBundleIdentifier = self->super.super._nativeContainerBundleIdentifier;
  self->super.super._nativeContainerBundleIdentifier = v4;
}

- (void)setKind:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  kind = self->super._kind;
  self->super._kind = v4;
}

- (void)setDisplayName:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  displayName = self->super.super._displayName;
  self->super.super._displayName = v4;
}

- (void)setSupportedFamilies:(unint64_t)a3
{
  self->super._supportedFamilies = a3;
}

- (void)setIntentType:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  intentType = self->super._intentType;
  self->super._intentType = v4;
}

- (void)setIntentRecommendationsContainer:(id)a3
{
}

- (void)setWidgetDescription:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  widgetDescription = self->super.super._widgetDescription;
  self->super.super._widgetDescription = v4;
}

- (void)setWidgetVisibility:(int64_t)a3
{
  self->super._widgetVisibility = a3;
}

- (void)setDisfavoredLocations:(id)a3
{
}

- (void)setDisfavoredLocations:(unint64_t)a3 on:(int64_t)a4
{
  v7 = (NSDictionary *)[(NSDictionary *)self->super._disfavoredLocations mutableCopy];
  v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
  [(NSDictionary *)v7 setObject:v8 forKeyedSubscript:v9];

  disfavoredLocations = self->super._disfavoredLocations;
  self->super._disfavoredLocations = v7;
}

- (void)setLocaleToken:(id)a3
{
  id v6 = a3;
  v4 = (NSData *)[v6 copy];
  localeToken = self->super.super._localeToken;
  self->super.super._localeToken = v4;
}

- (void)setEventMachServiceName:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  eventMachServiceName = self->super.super._eventMachServiceName;
  self->super.super._eventMachServiceName = v4;
}

- (void)setTransparent:(BOOL)a3
{
  int64_t v3 = 2;
  if (!a3) {
    int64_t v3 = 0;
  }
  self->super.super._preferredBackgroundStyle = v3;
  self->super.super._supportsVibrantContent = a3;
}

- (void)setPreferredBackgroundStyle:(int64_t)a3
{
  self->super.super._preferredBackgroundStyle = a3;
}

- (void)setSupportsVibrantContent:(BOOL)a3
{
  self->super.super._supportsVibrantContent = a3;
}

- (void)setSupportsAccentedContent:(BOOL)a3
{
  self->super._supportsAccentedContent = [(CHSBaseDescriptor *)self isLinkedOnOrAfter:1] && a3;
}

- (void)setSupportsInteraction:(BOOL)a3
{
  self->super._supportsInteraction = a3;
}

- (void)setSdkVersion:(id)a3
{
}

- (void)setPlatform:(unint64_t)a3
{
  self->super.super._platform = a3;
}

- (void)setEnablesMultipleTapTargets:(BOOL)a3
{
  self->super._enablesMultipleTapTargets = a3;
}

- (void)setBackgroundRemovable:(BOOL)a3
{
  self->super._backgroundRemovable = a3;
  [(CHSWidgetDescriptor *)self _evaluateSupportsAccentedContent];
}

- (void)setHiddenBySensitiveUI:(BOOL)a3
{
  self->super.super._hiddenBySensitiveUI = a3;
}

- (void)setPromptsForUserConfiguration:(BOOL)a3
{
  self->super.super._promptsForUserConfiguration = a3;
}

- (void)setEnablement:(unint64_t)a3
{
  self->super.super._enablement = a3;
}

- (void)setRequiredFeatureFlags:(id)a3
{
  id v6 = a3;
  v4 = (NSArray *)[v6 copy];
  requiredFeatureFlags = self->super.super._requiredFeatureFlags;
  self->super.super._requiredFeatureFlags = v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CHSWidgetDescriptor alloc];
  return [(CHSWidgetDescriptor *)v4 initFromDescriptor:self includeIntents:1];
}

- (void)setExtensionBundleIdentifier:(id)a3
{
  id v10 = a3;
  v4 = [CHSExtensionIdentity alloc];
  v5 = (void *)[v10 copy];
  id v6 = [(CHSExtensionIdentity *)self->super.super._extensionIdentity containerBundleIdentifier];
  v7 = [(CHSExtensionIdentity *)self->super.super._extensionIdentity deviceIdentifier];
  v8 = [(CHSExtensionIdentity *)v4 initWithExtensionBundleIdentifier:v5 containerBundleIdentifier:v6 deviceIdentifier:v7];
  extensionIdentity = self->super.super._extensionIdentity;
  self->super.super._extensionIdentity = v8;
}

- (void)setContainerBundleIdentifier:(id)a3
{
  id v10 = a3;
  v4 = [CHSExtensionIdentity alloc];
  v5 = [(CHSExtensionIdentity *)self->super.super._extensionIdentity extensionBundleIdentifier];
  id v6 = (void *)[v10 copy];
  v7 = [(CHSExtensionIdentity *)self->super.super._extensionIdentity deviceIdentifier];
  v8 = [(CHSExtensionIdentity *)v4 initWithExtensionBundleIdentifier:v5 containerBundleIdentifier:v6 deviceIdentifier:v7];
  extensionIdentity = self->super.super._extensionIdentity;
  self->super.super._extensionIdentity = v8;
}

@end