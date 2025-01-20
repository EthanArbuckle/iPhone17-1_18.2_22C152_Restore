@interface HSEntitlementContext
- (BOOL)isEntitledForAll3rdPartyAccessoryTypes;
- (BOOL)isEntitledForHomeKitSPI;
- (BOOL)isEntitledForThirdPartyMatterSetupPayload;
- (BOOL)isEntitledForThirdPartySetupAccessoryPayload;
- (HSEntitlementContext)init;
- (HSEntitlementContext)initWithSetupAccessoryDescription:(id)a3;
- (NSString)bundleIdentifier;
- (id)description;
- (void)setFirstPartyEntitled:(BOOL)a3;
@end

@implementation HSEntitlementContext

- (HSEntitlementContext)initWithSetupAccessoryDescription:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HSEntitlementContext;
  v5 = [(HSEntitlementContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 appIdentifier];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    v5->_isEntitledForHomeKitSPI = [v4 isEntitledForHomeKitSPI];
    v5->_isEntitledForThirdPartySetupAccessoryPayload = [v4 isEntitledForThirdPartySetupAccessoryPayload];
    v5->_isEntitledForThirdPartyMatterSetupPayload = [v4 isEntitledForThirdPartyMatterSetupPayload];
    v5->_isEntitledForAll3rdPartyAccessoryTypes = _os_feature_enabled_impl();
  }

  return v5;
}

- (HSEntitlementContext)init
{
  id v4 = +[NSAssertionHandler currentHandler];
  v5 = NSStringFromSelector("initWithSetupAccessoryDescription:");
  [v4 handleFailureInMethod:a2 object:self file:@"HSEntitlementContext.m" lineNumber:39 description:@"%s is unavailable; use %@ instead"];
    "-[HSEntitlementContext init]",
    v5);

  return 0;
}

- (id)description
{
  v3 = +[NADescriptionBuilder builderWithObject:self];
  id v4 = [(HSEntitlementContext *)self bundleIdentifier];
  [v3 appendString:v4 withName:@"bundleIdentifier"];

  id v5 = [v3 appendBool:[self isEntitledForHomeKitSPI] withName:@"com.apple.homekit.private-spi-access"];
  id v6 = [v3 appendBool:[self isEntitledForThirdPartySetupAccessoryPayload] withName:@"com.apple.developer.homekit.allow-setup-payload"];
  id v7 = [v3 appendBool:[self isEntitledForThirdPartyMatterSetupPayload] withName:@"com.apple.developer.matter.allow-setup-payload"];
  v8 = [v3 build];

  return v8;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isEntitledForHomeKitSPI
{
  return self->_isEntitledForHomeKitSPI;
}

- (void)setFirstPartyEntitled:(BOOL)a3
{
  self->_isEntitledForHomeKitSPI = a3;
}

- (BOOL)isEntitledForThirdPartySetupAccessoryPayload
{
  return self->_isEntitledForThirdPartySetupAccessoryPayload;
}

- (BOOL)isEntitledForThirdPartyMatterSetupPayload
{
  return self->_isEntitledForThirdPartyMatterSetupPayload;
}

- (BOOL)isEntitledForAll3rdPartyAccessoryTypes
{
  return self->_isEntitledForAll3rdPartyAccessoryTypes;
}

- (void).cxx_destruct
{
}

@end