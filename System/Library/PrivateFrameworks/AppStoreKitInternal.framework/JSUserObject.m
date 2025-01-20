@interface JSUserObject
- (BOOL)isFitnessAppInstallationAllowed;
- (BOOL)isManagedAppleID;
- (BOOL)isOnDevicePersonalizationEnabled;
- (BOOL)isUnderThirteen;
- (NSNumber)userAgeIfAvailable;
- (NSString)accountIdentifier;
- (NSString)dsid;
- (NSString)firstName;
- (NSString)lastName;
- (_TtC19AppStoreKitInternal12JSUserObject)init;
- (id)onDevicePersonalizationDataContainerForAppIds:(id)a3;
- (void)queryFitnessAppInstallationAllowed;
@end

@implementation JSUserObject

- (BOOL)isOnDevicePersonalizationEnabled
{
  v2 = self;
  char v3 = sub_1E158CEE4(MEMORY[0x1E4F4D9D8]);

  return v3 & 1;
}

- (NSString)dsid
{
  v2 = self;
  sub_1E1686718();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)firstName
{
  return (NSString *)sub_1E1942320(self, (uint64_t)a2, (SEL *)&selRef_ams_firstName);
}

- (NSString)lastName
{
  return (NSString *)sub_1E1942320(self, (uint64_t)a2, (SEL *)&selRef_ams_lastName);
}

- (NSString)accountIdentifier
{
  return (NSString *)sub_1E1942320(self, (uint64_t)a2, (SEL *)&selRef_username);
}

- (BOOL)isManagedAppleID
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF367C0);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  MEMORY[0x1E4E51960]();
  uint64_t v7 = sub_1E1D5B988();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) == 1)
  {
    sub_1E15B07DC((uint64_t)v5, &qword_1EBF367C0);
    unsigned __int8 v9 = 0;
  }
  else
  {
    v10 = (_TtC19AppStoreKitInternal12JSUserObject *)sub_1E1D5B978();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
    unsigned __int8 v9 = [(JSUserObject *)v10 ams_isManagedAppleID];

    v6 = v10;
  }

  return v9;
}

- (BOOL)isUnderThirteen
{
  v2 = self;
  char v3 = sub_1E158CEE4(MEMORY[0x1E4F4D9E0]);

  return v3 & 1;
}

- (NSNumber)userAgeIfAvailable
{
  return (NSNumber *)0;
}

- (BOOL)isFitnessAppInstallationAllowed
{
  v2 = self;
  char v3 = sub_1E1942588();

  return v3 & 1;
}

- (void)queryFitnessAppInstallationAllowed
{
  char v3 = self;
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v7[4] = sub_1E16868C4;
  v7[5] = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  v7[2] = sub_1E164C340;
  v7[3] = &block_descriptor_38;
  v5 = _Block_copy(v7);
  v6 = self;
  swift_release();
  objc_msgSend(v3, sel_fetchIsFitnessAvailableForDeviceWithCompletion_, v5);
  _Block_release(v5);
}

- (id)onDevicePersonalizationDataContainerForAppIds:(id)a3
{
  uint64_t v4 = sub_1E1D5C248();
  v5 = self;
  id v6 = sub_1E1942810(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC19AppStoreKitInternal12JSUserObject)init
{
  result = (_TtC19AppStoreKitInternal12JSUserObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal12JSUserObject_onDevicePersonalizationDataManager));
  swift_release();
  char v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19AppStoreKitInternal12JSUserObject_fitnessAppInstallationAllowedConditionLock);
}

@end