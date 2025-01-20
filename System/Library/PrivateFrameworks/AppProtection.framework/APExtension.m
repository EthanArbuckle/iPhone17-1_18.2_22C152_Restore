@interface APExtension
- (APExtension)initWithApplicationExtensionRecord:(id)a3;
- (APExtension)initWithExtensionIdentity:(id)a3 auditToken:(id *)a4;
- (APExtension)initWithExtensionUUID:(id)a3 bundleIdentifier:(id)a4;
- (BOOL)isEffectivelyLocked;
- (BOOL)isHidden;
- (BOOL)isLocked;
- (BOOL)requiresShielding;
- (id)effectiveBundleIdentifier;
@end

@implementation APExtension

- (APExtension)initWithExtensionIdentity:(id)a3 auditToken:(id *)a4
{
  return (APExtension *)sub_247DC86D8(a3);
}

- (APExtension)initWithApplicationExtensionRecord:(id)a3
{
  return (APExtension *)sub_247DC6B38(a3);
}

- (APExtension)initWithExtensionUUID:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v4 = sub_247DD28F0();
  MEMORY[0x270FA5388](v4 - 8, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247DD28D0();
  uint64_t v8 = sub_247DD2C20();
  return (APExtension *)sub_247DC6EDC((uint64_t)v7, v8, v9);
}

- (BOOL)isHidden
{
  return 0;
}

- (BOOL)isLocked
{
  int v2 = *((unsigned __int8 *)&self->super.super.isa + OBJC_IVAR___APExtension_forcedLockedValue);
  if (v2 == 2)
  {
    v3 = self;
    unsigned __int8 v4 = sub_247DC72E8();
  }
  else
  {
    unsigned __int8 v4 = v2 & 1;
  }
  return v4 & 1;
}

- (BOOL)isEffectivelyLocked
{
  return [(APExtension *)self isLocked];
}

- (id)effectiveBundleIdentifier
{
  return sub_247D3A858();
}

- (BOOL)requiresShielding
{
  v3 = self;
  unsigned __int8 v4 = self;
  id v5 = objc_msgSend(v3, sel_sharedGuard);
  unsigned __int8 v6 = objc_msgSend(v5, sel_extensionRequiresAuthentication_, v4);

  return v6;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end