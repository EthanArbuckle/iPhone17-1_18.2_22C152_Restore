@interface CHSMutableControlDescriptor
- (id)copyWithZone:(_NSZone *)a3;
- (void)setActionMetadata:(id)a3;
- (void)setControlType:(unint64_t)a3;
- (void)setControlVersion:(unint64_t)a3;
- (void)setDefaultIntentReference:(id)a3;
- (void)setDisablesControlStateCaching:(BOOL)a3;
- (void)setDisplayName:(id)a3;
- (void)setEnablement:(unint64_t)a3;
- (void)setEventMachServiceName:(id)a3;
- (void)setExtensionIdentity:(id)a3;
- (void)setHiddenBySensitiveUI:(BOOL)a3;
- (void)setHiddenControl:(BOOL)a3;
- (void)setIntentType:(id)a3;
- (void)setKind:(id)a3;
- (void)setLocaleToken:(id)a3;
- (void)setNativeContainerBundleIdentifier:(id)a3;
- (void)setPlatform:(unint64_t)a3;
- (void)setPreferredControlSize:(unint64_t)a3;
- (void)setPromptsForUserConfiguration:(BOOL)a3;
- (void)setRequiredFeatureFlags:(id)a3;
- (void)setSdkVersion:(id)a3;
- (void)setShowsContextualMenu:(BOOL)a3;
- (void)setSupportsPush:(BOOL)a3;
- (void)setVisibility:(int64_t)a3;
- (void)setWidgetDescription:(id)a3;
@end

@implementation CHSMutableControlDescriptor

- (void)setControlVersion:(unint64_t)a3
{
  self->super._controlVersion = a3;
}

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

- (void)setControlType:(unint64_t)a3
{
  self->super._controlType = a3;
}

- (void)setPreferredControlSize:(unint64_t)a3
{
  self->super._preferredControlSize = a3;
}

- (void)setSupportsPush:(BOOL)a3
{
  self->super._supportsPush = a3;
}

- (void)setDisplayName:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  displayName = self->super.super._displayName;
  self->super.super._displayName = v4;
}

- (void)setIntentType:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  intentType = self->super._intentType;
  self->super._intentType = v4;
}

- (void)setWidgetDescription:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  widgetDescription = self->super.super._widgetDescription;
  self->super.super._widgetDescription = v4;
}

- (void)setVisibility:(int64_t)a3
{
  self->super._visibility = a3;
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

- (void)setSdkVersion:(id)a3
{
}

- (void)setPlatform:(unint64_t)a3
{
  self->super.super._platform = a3;
}

- (void)setHiddenControl:(BOOL)a3
{
  self->super._hiddenControl = a3;
}

- (void)setShowsContextualMenu:(BOOL)a3
{
  self->super._showsContextualMenu = a3;
}

- (void)setDisablesControlStateCaching:(BOOL)a3
{
  self->super._disablesControlStateCaching = a3;
}

- (void)setActionMetadata:(id)a3
{
  id v6 = a3;
  v4 = (CHSControlActionMetadata *)[v6 copy];
  actionMetadata = self->super._actionMetadata;
  self->super._actionMetadata = v4;
}

- (void)setDefaultIntentReference:(id)a3
{
  v5 = (CHSIntentReference *)a3;
  if (self->super._defaultIntentReference != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->super._defaultIntentReference, a3);
    v5 = v6;
  }
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
  v4 = [CHSControlDescriptor alloc];
  return [(CHSControlDescriptor *)v4 initFromDescriptor:self includeIntents:1];
}

@end