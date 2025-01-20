@interface ASPasswordSignInEventCollector
- (_TtC26AuthenticationServicesCore30ASPasswordSignInEventCollector)init;
- (void)didUseCredentialForUsername:(id)a3 forHost:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inAppWithBundleIdentifier:(id)a6;
- (void)didUseCredentialForUsername:(id)a3 forURL:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inBrowserWithBundleIdentifier:(id)a6;
- (void)providerForRecentlyFilledCredentialWithUsername:(NSString *)a3 forAppWithBundleIdentifier:(NSString *)a4 completionHandler:(id)a5;
- (void)providerForRecentlyFilledCredentialWithUsername:(NSString *)a3 forRelyingPartyIdentifier:(NSString *)a4 inAppWithBundleIdentifier:(NSString *)a5 completionHandler:(id)a6;
@end

@implementation ASPasswordSignInEventCollector

- (void)didUseCredentialForUsername:(id)a3 forURL:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inBrowserWithBundleIdentifier:(id)a6
{
  v35 = self;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC27638);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = v8;
  uint64_t v9 = sub_2193E1FF0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  v13 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v15 = (char *)&v30 - v14;
  uint64_t v16 = sub_2193E2840();
  uint64_t v32 = v17;
  v34 = v15;
  sub_2193E1FA0();
  uint64_t v30 = sub_2193E2840();
  uint64_t v19 = v18;
  uint64_t v31 = sub_2193E2840();
  uint64_t v21 = v20;
  uint64_t v22 = sub_2193E2A60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v8, 1, 1, v22);
  v23 = v15;
  uint64_t v24 = v9;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v23, v9);
  unint64_t v25 = (*(unsigned __int8 *)(v10 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v26 = (v11 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  v27 = (char *)swift_allocObject();
  *((void *)v27 + 2) = 0;
  *((void *)v27 + 3) = 0;
  *((void *)v27 + 4) = v35;
  *((void *)v27 + 5) = v16;
  uint64_t v28 = v30;
  *((void *)v27 + 6) = v32;
  *((void *)v27 + 7) = v28;
  *((void *)v27 + 8) = v19;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v27[v25], v13, v24);
  v29 = (uint64_t *)&v27[v26];
  uint64_t *v29 = v31;
  v29[1] = v21;
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_219380F74((uint64_t)v33, (uint64_t)&unk_267C194B0, (uint64_t)v27);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v34, v24);
}

- (void)didUseCredentialForUsername:(id)a3 forHost:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inAppWithBundleIdentifier:(id)a6
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC27638);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_2193E2840();
  uint64_t v12 = v11;
  if (a4)
  {
    uint64_t v13 = sub_2193E2840();
    a4 = v14;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v15 = sub_2193E2840();
  uint64_t v17 = v16;
  uint64_t v18 = sub_2193E2840();
  uint64_t v20 = v19;
  uint64_t v21 = sub_2193E2A60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v10, 1, 1, v21);
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = v13;
  v22[5] = a4;
  uint64_t v23 = v25;
  v22[6] = self;
  v22[7] = v23;
  v22[8] = v12;
  v22[9] = v15;
  v22[10] = v17;
  v22[11] = v18;
  v22[12] = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain_n();
  sub_219380F74((uint64_t)v10, (uint64_t)&unk_267C194A8, (uint64_t)v22);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)providerForRecentlyFilledCredentialWithUsername:(NSString *)a3 forRelyingPartyIdentifier:(NSString *)a4 inAppWithBundleIdentifier:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC27638);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_2193E2A60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_267C19490;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_267C19498;
  v18[5] = v17;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v21 = a5;
  swift_retain();
  sub_2193D88D4((uint64_t)v13, (uint64_t)&unk_267C194A0, (uint64_t)v18);
  swift_release();
}

- (void)providerForRecentlyFilledCredentialWithUsername:(NSString *)a3 forAppWithBundleIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC27638);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2193E2A60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_267C19478;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_267C19E00;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_2193D88D4((uint64_t)v11, (uint64_t)&unk_267C19480, (uint64_t)v16);
  swift_release();
}

- (_TtC26AuthenticationServicesCore30ASPasswordSignInEventCollector)init
{
  swift_defaultActor_initialize();
  swift_retain();
  *(void *)&self->_anon_60[8] = sub_2193915B4(MEMORY[0x263F8EE78]);
  swift_release();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ASPasswordSignInEventCollector();
  return [(ASPasswordSignInEventCollector *)&v4 init];
}

@end