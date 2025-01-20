@interface ASManagedConfiguration
+ (id)loadFromDiskWithPlistURL:(id)a3 error:(id *)a4;
- (BOOL)isConfiguredForEnterpriseAttestationForRelyingParty:(id)a3;
- (_TtC26AuthenticationServicesCore22ASManagedConfiguration)init;
- (id)entepriseAttestationIdentityPersistentReferenceForRelyingParty:(id)a3;
@end

@implementation ASManagedConfiguration

+ (id)loadFromDiskWithPlistURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC27160);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_2193E1FA0();
    uint64_t v8 = sub_2193E1FF0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_2193E1FF0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  swift_getObjCClassMetadata();
  v10 = static ASManagedConfiguration.loadFromDisk(plistURL:)((uint64_t)v7);
  sub_2193513F0((uint64_t)v7);

  return v10;
}

- (BOOL)isConfiguredForEnterpriseAttestationForRelyingParty:(id)a3
{
  uint64_t v4 = sub_2193E2840();
  uint64_t v6 = v5;
  swift_beginAccess();
  v7 = self;
  uint64_t v8 = swift_bridgeObjectRetain();
  LOBYTE(v4) = sub_2193B5DD8(v8, v4, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (id)entepriseAttestationIdentityPersistentReferenceForRelyingParty:(id)a3
{
  uint64_t v4 = sub_2193E2840();
  uint64_t v6 = v5;
  swift_beginAccess();
  v7 = self;
  swift_bridgeObjectRetain();
  uint64_t v8 = swift_bridgeObjectRetain();
  sub_2193B1B60(v8, v4, v6, (uint64_t)&v16);
  swift_bridgeObjectRelease();
  uint64_t v9 = v17;
  if (v17)
  {
    uint64_t v10 = v16;
    uint64_t v11 = sub_2193E20A0();
    unint64_t v13 = v12;
    sub_2193B5FC8(v10, v9);

    swift_bridgeObjectRelease();
    v14 = 0;
    if (v13 >> 60 != 15)
    {
      v14 = (void *)sub_2193E2110();
      sub_21934CEB0(v11, v13);
    }
  }
  else
  {

    swift_bridgeObjectRelease();
    v14 = 0;
  }

  return v14;
}

- (_TtC26AuthenticationServicesCore22ASManagedConfiguration)init
{
  result = (_TtC26AuthenticationServicesCore22ASManagedConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC26AuthenticationServicesCore22ASManagedConfiguration_plistURL;
  uint64_t v3 = sub_2193E1FF0();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
}

@end