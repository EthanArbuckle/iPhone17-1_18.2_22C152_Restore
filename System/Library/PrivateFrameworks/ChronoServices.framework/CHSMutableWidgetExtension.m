@interface CHSMutableWidgetExtension
- (void)setContainerBundleLocalizedDisplayName:(id)a3;
- (void)setDataProtectionLevel:(int64_t)a3;
- (void)setEntitlements:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setLocalizedDisplayName:(id)a3;
- (void)setOrderedControlDescriptors:(id)a3;
- (void)setOrderedWidgetDescriptors:(id)a3;
@end

@implementation CHSMutableWidgetExtension

- (void)setIdentity:(id)a3
{
  id v6 = a3;
  v4 = (CHSExtensionIdentity *)[v6 copy];
  identity = self->super._identity;
  self->super._identity = v4;

  self->super._hasValidHash = 0;
}

- (void)setLocalizedDisplayName:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  localizedDisplayName = self->super._localizedDisplayName;
  self->super._localizedDisplayName = v4;

  self->super._hasValidHash = 0;
}

- (void)setContainerBundleLocalizedDisplayName:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  containerBundleLocalizedDisplayName = self->super._containerBundleLocalizedDisplayName;
  self->super._containerBundleLocalizedDisplayName = v4;

  self->super._hasValidHash = 0;
}

- (void)setOrderedWidgetDescriptors:(id)a3
{
  id v6 = a3;
  v4 = (NSArray *)[v6 copy];
  orderedWidgetDescriptors = self->super._orderedWidgetDescriptors;
  self->super._orderedWidgetDescriptors = v4;

  self->super._hasValidHash = 0;
}

- (void)setOrderedControlDescriptors:(id)a3
{
  id v6 = a3;
  v4 = (NSArray *)[v6 copy];
  orderedControlDescriptors = self->super._orderedControlDescriptors;
  self->super._orderedControlDescriptors = v4;

  self->super._hasValidHash = 0;
}

- (void)setEntitlements:(id)a3
{
  id v6 = a3;
  v4 = (CHSEntitlementCollection *)[v6 copy];
  entitlements = self->super._entitlements;
  self->super._entitlements = v4;

  self->super._hasValidHash = 0;
}

- (void)setDataProtectionLevel:(int64_t)a3
{
  self->super._dataProtectionLevel = a3;
  self->super._hasValidHash = 0;
}

@end