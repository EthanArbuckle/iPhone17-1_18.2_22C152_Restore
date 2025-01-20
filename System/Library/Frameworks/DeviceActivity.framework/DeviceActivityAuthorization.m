@interface DeviceActivityAuthorization
+ (BOOL)isAuthorized;
+ (BOOL)isAuthorized:(id)a3;
+ (BOOL)isOverridden;
+ (BOOL)sharingEnabled;
+ (NSArray)authorizedClientIdentifiers;
+ (void)setIsOverridden:(BOOL)a3;
- (_TtC14DeviceActivity27DeviceActivityAuthorization)init;
@end

@implementation DeviceActivityAuthorization

+ (BOOL)isAuthorized:(id)a3
{
  uint64_t v3 = sub_1C6CAC848();
  char v5 = _s14DeviceActivity0aB13AuthorizationC12isAuthorizedySbSSFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

+ (BOOL)isAuthorized
{
  return _s14DeviceActivity0aB13AuthorizationC12isAuthorizedSbvgZ_0();
}

+ (NSArray)authorizedClientIdentifiers
{
  if (qword_1EC05FDD8 != -1) {
    swift_once();
  }
  id v2 = objc_msgSend((id)qword_1EC05FDD0, sel_deviceActivity);
  id v3 = objc_msgSend(v2, sel_allowedClients);

  if (v3)
  {
    sub_1C6C219B4();
    sub_1C6C219F4();
    uint64_t v4 = sub_1C6CAC9C8();

    sub_1C6C206D4(v4);
    swift_bridgeObjectRelease();
  }
  char v5 = (void *)sub_1C6CAC8F8();
  swift_bridgeObjectRelease();

  return (NSArray *)v5;
}

+ (BOOL)sharingEnabled
{
  if (qword_1EC05FDD8 != -1) {
    swift_once();
  }
  id v2 = objc_msgSend((id)qword_1EC05FDD0, sel_deviceActivity);
  id v3 = objc_msgSend(v2, sel_shareAcrossDevices);

  if (!v3) {
    return 1;
  }
  unsigned __int8 v4 = objc_msgSend(v3, sel_BOOLValue);

  return v4;
}

+ (BOOL)isOverridden
{
  int v2 = os_variant_allows_internal_security_policies();
  if (v2)
  {
    id v3 = objc_msgSend(self, sel_standardUserDefaults);
    unsigned __int8 v4 = (void *)sub_1C6CAC818();
    unsigned __int8 v5 = objc_msgSend(v3, sel_BOOLForKey_, v4);

    LOBYTE(v2) = v5;
  }
  return v2;
}

+ (void)setIsOverridden:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_allows_internal_security_policies())
  {
    id v4 = objc_msgSend(self, sel_standardUserDefaults);
    id v5 = (id)sub_1C6CAC818();
    objc_msgSend(v4, sel_setBool_forKey_, v3, v5);
  }
}

- (_TtC14DeviceActivity27DeviceActivityAuthorization)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DeviceActivityAuthorization();
  return [(DeviceActivityAuthorization *)&v3 init];
}

@end