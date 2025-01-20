@interface IMCTRCSUtilitiesManager
+ (id)sharedManager;
- (BOOL)carrierRequiresFirstTimeOnAlert;
- (BOOL)carrierRequiresFirstTimeOnAlertForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)enabledForContext:(id)a3;
- (BOOL)enabledForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)groupMessagingEnabledForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)groupTextReplicationSupportedForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)isRBMEnabledForContext:(id)a3;
- (BOOL)isRBMSupportedForContext:(id)a3;
- (BOOL)networkSupportsInterworkingForContext:(id)a3;
- (BOOL)supportedForPhoneNumber:(id)a3 simID:(id)a4;
- (IMCTRCSUtilitiesManager)init;
- (id)privateIdentityForContext:(id)a3;
- (id)revokeIntervalForPhoneNumber:(id)a3 simID:(id)a4;
- (int64_t)groupMessagingMaxGroupSizeForPhoneNumber:(id)a3 simID:(id)a4;
- (void)registerServiceCapabilityNotifications;
@end

@implementation IMCTRCSUtilitiesManager

- (BOOL)enabledForPhoneNumber:(id)a3 simID:(id)a4
{
  return sub_1A0782E18(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1A0782EC8);
}

- (BOOL)enabledForContext:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_1A0784CA4(v3);

  return v3 & 1;
}

+ (id)sharedManager
{
  if (qword_1EB4A5A70 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB4A5A60;

  return v2;
}

- (BOOL)isRBMSupportedForContext:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1A0782B18(v4);

  return self & 1;
}

- (IMCTRCSUtilitiesManager)init
{
  *(void *)&self->delegate[OBJC_IVAR___IMCTRCSUtilitiesManager_delegate] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)IMCTRCSUtilitiesManager;
  return [(IMCTRCSUtilitiesManager *)&v4 init];
}

- (BOOL)carrierRequiresFirstTimeOnAlert
{
  v2 = self;
  char v3 = sub_1A0791CAC();

  return v3 & 1;
}

- (void)registerServiceCapabilityNotifications
{
  char v3 = (char *)self + OBJC_IVAR___IMCTRCSUtilitiesManager_delegate;
  if (MEMORY[0x1A6228D10]((char *)self + OBJC_IVAR___IMCTRCSUtilitiesManager_delegate, a2))
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v7 = self;
    v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

- (BOOL)carrierRequiresFirstTimeOnAlertForPhoneNumber:(id)a3 simID:(id)a4
{
  return sub_1A0782E18(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1A0873928);
}

- (BOOL)supportedForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v5 = sub_1A09F3E18();
  uint64_t v7 = v6;
  uint64_t v8 = sub_1A09F3E18();
  uint64_t v10 = v9;
  v11 = (char *)self + OBJC_IVAR___IMCTRCSUtilitiesManager_delegate;
  if (MEMORY[0x1A6228D10]((char *)self + OBJC_IVAR___IMCTRCSUtilitiesManager_delegate))
  {
    uint64_t v12 = *((void *)v11 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 40);
    v15 = self;
    char v16 = v14(v5, v7, v8, v10, ObjectType, v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    v17 = self;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v16 = 0;
  }

  return v16 & 1;
}

- (id)revokeIntervalForPhoneNumber:(id)a3 simID:(id)a4
{
  id v4 = a4;
  if (a3)
  {
    uint64_t v6 = sub_1A09F3E18();
    uint64_t v8 = v7;
    if (v4)
    {
LABEL_3:
      uint64_t v9 = sub_1A09F3E18();
      id v4 = v10;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = 0;
LABEL_6:
  v11 = (char *)self + OBJC_IVAR___IMCTRCSUtilitiesManager_delegate;
  if (MEMORY[0x1A6228D10]((char *)self + OBJC_IVAR___IMCTRCSUtilitiesManager_delegate))
  {
    uint64_t v12 = *((void *)v11 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, id, uint64_t, uint64_t))(v12 + 48);
    v15 = self;
    char v16 = (void *)v14(v6, v8, v9, v4, ObjectType, v12);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = self;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v16 = 0;
  }

  return v16;
}

- (BOOL)groupMessagingEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  id v4 = a4;
  if (!a3)
  {
    uint64_t v6 = 0;
    unint64_t v8 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = sub_1A09F3E18();
  unint64_t v8 = v7;
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = sub_1A09F3E18();
  id v4 = v10;
LABEL_6:
  v11 = self;
  BOOL v12 = sub_1A0874F40(v6, v8, v9, (unint64_t)v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

- (int64_t)groupMessagingMaxGroupSizeForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v6 = sub_1A09F3E18();
  unint64_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = sub_1A09F3E18();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v11 = self;
  int64_t v12 = sub_1A087531C(v6, v8, v9, (unint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

- (BOOL)groupTextReplicationSupportedForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v6 = sub_1A09F3E18();
  unint64_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = sub_1A09F3E18();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v11 = self;
  char v12 = sub_1A08756FC(v6, v8, v9, (unint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

- (BOOL)isRBMEnabledForContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_1A0874278(v4);

  return self & 1;
}

- (BOOL)networkSupportsInterworkingForContext:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  uint64_t v6 = self;
  LOBYTE(v3) = sub_1A087455C(v3);

  return v3 & 1;
}

- (id)privateIdentityForContext:(id)a3
{
  id v5 = (char *)self + OBJC_IVAR___IMCTRCSUtilitiesManager_delegate;
  uint64_t v6 = (void *)MEMORY[0x1A6228D10]((char *)self + OBJC_IVAR___IMCTRCSUtilitiesManager_delegate, a2);
  if (v6)
  {
    uint64_t v7 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v9 = *(void (**)(id, uint64_t, uint64_t))(v7 + 32);
    id v10 = a3;
    v11 = self;
    v9(v10, ObjectType, v7);
    uint64_t v13 = v12;

    swift_unknownObjectRelease();
    if (v13)
    {
      uint64_t v6 = (void *)sub_1A09F3DE8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v6 = 0;
    }
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end