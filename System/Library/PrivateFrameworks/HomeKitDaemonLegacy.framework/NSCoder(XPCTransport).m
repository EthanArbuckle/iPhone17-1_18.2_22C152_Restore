@interface NSCoder(XPCTransport)
- (id)hmd_clientIdentifier;
- (id)hmd_message;
- (uint64_t)hmd_entitlements;
- (uint64_t)hmd_homeManagerOptions;
- (uint64_t)hmd_isForXPCTransport;
- (uint64_t)hmd_isForXPCTransportAuthorizedForLocationAccess;
- (uint64_t)hmd_isForXPCTransportEntitledForAssistantIdentifiers;
- (uint64_t)hmd_isForXPCTransportEntitledForHomeLocationAccess;
- (uint64_t)hmd_isForXPCTransportEntitledForHomeLocationFeedbackAccess;
- (uint64_t)hmd_isForXPCTransportEntitledForSPIAccess;
@end

@implementation NSCoder(XPCTransport)

- (uint64_t)hmd_isForXPCTransport
{
  v1 = objc_getAssociatedObject(a1, @"kXPCTransportTypeAssociationKey");
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)hmd_isForXPCTransportEntitledForSPIAccess
{
  v1 = objc_msgSend(a1, "hmd_message");
  uint64_t v2 = [v1 isEntitledForSPIAccess];

  return v2;
}

- (id)hmd_message
{
  v1 = objc_getAssociatedObject(a1, @"kXPCMessageKey");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (uint64_t)hmd_homeManagerOptions
{
  uint64_t v2 = objc_msgSend(a1, "hmd_message");

  if (!v2) {
    return -1;
  }
  id v3 = objc_msgSend(a1, "hmd_message");
  uint64_t v4 = [v3 homeManagerOptions];

  return v4;
}

- (uint64_t)hmd_isForXPCTransportEntitledForHomeLocationAccess
{
  v1 = objc_msgSend(a1, "hmd_message");
  uint64_t v2 = [v1 isEntitledForHomeLocationAccess];

  return v2;
}

- (uint64_t)hmd_isForXPCTransportAuthorizedForLocationAccess
{
  v1 = objc_msgSend(a1, "hmd_message");
  uint64_t v2 = [v1 isAuthorizedForLocationAccess];

  return v2;
}

- (uint64_t)hmd_isForXPCTransportEntitledForHomeLocationFeedbackAccess
{
  v1 = objc_msgSend(a1, "hmd_message");
  uint64_t v2 = [v1 isEntitledForHomeLocationFeedbackAccess];

  return v2;
}

- (uint64_t)hmd_isForXPCTransportEntitledForAssistantIdentifiers
{
  v1 = objc_msgSend(a1, "hmd_message");
  uint64_t v2 = [v1 isEntitledForAssistantIdentifiers];

  return v2;
}

- (id)hmd_clientIdentifier
{
  v1 = objc_msgSend(a1, "hmd_message");
  uint64_t v2 = [v1 clientIdentifier];

  return v2;
}

- (uint64_t)hmd_entitlements
{
  v1 = objc_msgSend(a1, "hmd_message");
  uint64_t v2 = [v1 entitlements];

  return v2;
}

@end