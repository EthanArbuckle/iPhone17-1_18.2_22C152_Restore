@interface IdentityProofingDataSharingClient
- (_TtC13CoreIDVShared33IdentityProofingDataSharingClient)init;
- (void)checkUserConsentWithCompletionHandler:(id)a3;
- (void)didChangeUserConsent:(int64_t)a3 completion:(id)a4;
- (void)fetchUserConsentWithCompletionHandler:(id)a3;
@end

@implementation IdentityProofingDataSharingClient

- (_TtC13CoreIDVShared33IdentityProofingDataSharingClient)init
{
  return (_TtC13CoreIDVShared33IdentityProofingDataSharingClient *)IdentityProofingDataSharingClient.init()();
}

- (void)fetchUserConsentWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v5 - 8, v6, v7, v8, v9, v10, v11, v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a3);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = self;
  uint64_t v17 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EA847220;
  v18[5] = v16;
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EA847228;
  v19[5] = v18;
  v20 = self;
  sub_1D7A32DD4((uint64_t)v14, (uint64_t)&unk_1EA847230, (uint64_t)v19);
  swift_release();
}

- (void)didChangeUserConsent:(int64_t)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_1D7A33B9C(a3, (char *)v7, v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)checkUserConsentWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v5 - 8, v6, v7, v8, v9, v10, v11, v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a3);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = self;
  uint64_t v17 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EA8471F0;
  v18[5] = v16;
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EA846340;
  v19[5] = v18;
  v20 = self;
  sub_1D7A32DD4((uint64_t)v14, (uint64_t)&unk_1EA846348, (uint64_t)v19);
  swift_release();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CoreIDVShared33IdentityProofingDataSharingClient_serverConnection));
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  v3 = *(void **)&self->remoteObjectProxy[OBJC_IVAR____TtC13CoreIDVShared33IdentityProofingDataSharingClient_remoteObjectProxyError];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end