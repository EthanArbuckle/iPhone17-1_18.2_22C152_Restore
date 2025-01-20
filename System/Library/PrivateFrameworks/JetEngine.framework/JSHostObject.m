@interface JSHostObject
- (BOOL)isOSAtLeast:(id)a3 :(id)a4 :(id)a5;
- (NSString)clientIdentifier;
- (NSString)clientVersion;
- (NSString)deviceLocalizedModel;
- (NSString)deviceMarketingFamilyName;
- (NSString)deviceModel;
- (NSString)deviceModelFamily;
- (NSString)devicePhysicalModel;
- (NSString)osBuild;
- (NSString)platform;
- (_TtC9JetEngine12JSHostObject)init;
@end

@implementation JSHostObject

- (_TtC9JetEngine12JSHostObject)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(JSHostObject *)&v3 init];
}

- (NSString)platform
{
  v2 = (void *)sub_19F1DBD4C();
  return (NSString *)v2;
}

- (BOOL)isOSAtLeast:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  uint64_t v12 = (int)objc_msgSend(v8, sel_toInt32);
  uint64_t v13 = (int)objc_msgSend(v9, sel_toInt32);
  uint64_t v14 = (int)objc_msgSend(v10, sel_toInt32);
  id v15 = objc_msgSend(self, sel_processInfo);
  v17[0] = v12;
  v17[1] = v13;
  v17[2] = v14;
  LOBYTE(v12) = objc_msgSend(v15, sel_isOperatingSystemAtLeastVersion_, v17);

  return v12;
}

- (NSString)clientIdentifier
{
  objc_super v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_mainBundle);
  id v6 = objc_msgSend(v5, sel_bundleIdentifier);

  if (v6)
  {
    sub_19F1DBD7C();
  }
  else
  {
  }
  v7 = (void *)sub_19F1DBD4C();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)osBuild
{
  return (NSString *)sub_19EE5F4C8(self, (uint64_t)a2, (uint64_t (*)(void))JEGestaltGetBuildVersion);
}

- (NSString)deviceModel
{
  return (NSString *)sub_19EE5F4C8(self, (uint64_t)a2, (uint64_t (*)(void))JEGestaltGetDeviceModel);
}

- (NSString)deviceLocalizedModel
{
  return (NSString *)sub_19EE5F4C8(self, (uint64_t)a2, (uint64_t (*)(void))JEGestaltGetLocalizedDeviceModel);
}

- (NSString)devicePhysicalModel
{
  return (NSString *)sub_19EE5F4C8(self, (uint64_t)a2, (uint64_t (*)(void))JEGestaltGetProductType);
}

- (NSString)deviceModelFamily
{
  return (NSString *)sub_19EE5F4C8(self, (uint64_t)a2, (uint64_t (*)(void))JEGestaltGetDeviceClass);
}

- (NSString)deviceMarketingFamilyName
{
  return (NSString *)sub_19EE5F4C8(self, (uint64_t)a2, (uint64_t (*)(void))JEGestaltGetMarketingDeviceFamilyName);
}

- (NSString)clientVersion
{
  sub_19F1AC4D0();
  v2 = (void *)sub_19F1DBD4C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

@end