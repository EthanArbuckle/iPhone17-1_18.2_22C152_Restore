@interface ArcadeAIDAAccountManagerDelegate
- (_TtC19AppStoreKitInternalP33_8D1DC5A59BCBA4F7D36E5B1D7235875932ArcadeAIDAAccountManagerDelegate)init;
- (id)accountsForAccountManager:(id)a3;
@end

@implementation ArcadeAIDAAccountManagerDelegate

- (_TtC19AppStoreKitInternalP33_8D1DC5A59BCBA4F7D36E5B1D7235875932ArcadeAIDAAccountManagerDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ArcadeAIDAAccountManagerDelegate();
  return [(ArcadeAIDAAccountManagerDelegate *)&v3 init];
}

- (id)accountsForAccountManager:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_accountStore);
  id v7 = objc_msgSend(v6, sel_aa_primaryAppleAccount);

  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1EAD86EF0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1E1D666B0;
    v9 = (void *)*MEMORY[0x1E4F4D8E8];
    *(void *)(inited + 32) = *MEMORY[0x1E4F4D8E8];
    *(void *)(inited + 40) = v7;
    id v10 = v9;
    uint64_t v11 = inited;
  }
  else
  {
    uint64_t v11 = MEMORY[0x1E4FBC860];
  }
  sub_1E188EA08(v11);

  type metadata accessor for AIDAServiceType(0);
  sub_1E15E9E84(0, &qword_1EBF2D060);
  sub_1E1A0083C();
  v12 = (void *)sub_1E1D5BCA8();
  swift_bridgeObjectRelease();
  return v12;
}

@end