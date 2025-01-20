@interface CHSMutableSessionPlatterDescriptor
- (id)copyWithZone:(_NSZone *)a3;
- (void)setActivityAttributesType:(id)a3;
- (void)setContainerBundleIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEventMachServiceName:(id)a3;
- (void)setExtensionBundleIdentifier:(id)a3;
- (void)setExtensionIdentity:(id)a3;
- (void)setLocaleToken:(id)a3;
- (void)setPlatform:(unint64_t)a3;
- (void)setPreferredBackgroundStyle:(int64_t)a3;
- (void)setSdkVersion:(id)a3;
- (void)setSupportsVibrantContent:(BOOL)a3;
- (void)setWidgetDescription:(id)a3;
@end

@implementation CHSMutableSessionPlatterDescriptor

- (void)setExtensionIdentity:(id)a3
{
  id v6 = a3;
  v4 = (CHSExtensionIdentity *)[v6 copy];
  extensionIdentity = self->super.super._extensionIdentity;
  self->super.super._extensionIdentity = v4;
}

- (void)setDisplayName:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  displayName = self->super.super._displayName;
  self->super.super._displayName = v4;
}

- (void)setWidgetDescription:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  widgetDescription = self->super.super._widgetDescription;
  self->super.super._widgetDescription = v4;
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

- (void)setActivityAttributesType:(id)a3
{
  id v6 = a3;
  v4 = (NSData *)[v6 copy];
  activityAttributesType = self->super._activityAttributesType;
  self->super._activityAttributesType = v4;
}

- (void)setPreferredBackgroundStyle:(int64_t)a3
{
  self->super.super._preferredBackgroundStyle = a3;
}

- (void)setSupportsVibrantContent:(BOOL)a3
{
  self->super.super._supportsVibrantContent = a3;
}

- (void)setSdkVersion:(id)a3
{
}

- (void)setPlatform:(unint64_t)a3
{
  self->super.super._platform = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CHSSessionPlatterDescriptor alloc];
  return [(CHSSessionPlatterDescriptor *)v4 _initWithDescriptor:self];
}

- (void)setExtensionBundleIdentifier:(id)a3
{
  id v9 = a3;
  v4 = [CHSExtensionIdentity alloc];
  v5 = (void *)[v9 copy];
  id v6 = [(CHSExtensionIdentity *)self->super.super._extensionIdentity containerBundleIdentifier];
  v7 = [(CHSExtensionIdentity *)v4 initWithExtensionBundleIdentifier:v5 containerBundleIdentifier:v6 deviceIdentifier:0];
  extensionIdentity = self->super.super._extensionIdentity;
  self->super.super._extensionIdentity = v7;
}

- (void)setContainerBundleIdentifier:(id)a3
{
  id v9 = a3;
  v4 = [CHSExtensionIdentity alloc];
  v5 = [(CHSExtensionIdentity *)self->super.super._extensionIdentity extensionBundleIdentifier];
  id v6 = (void *)[v9 copy];
  v7 = [(CHSExtensionIdentity *)v4 initWithExtensionBundleIdentifier:v5 containerBundleIdentifier:v6 deviceIdentifier:0];
  extensionIdentity = self->super.super._extensionIdentity;
  self->super.super._extensionIdentity = v7;
}

@end