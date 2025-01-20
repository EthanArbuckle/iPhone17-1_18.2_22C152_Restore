@interface IdentityManagementUIClient
- (_TtC13CoreIDVShared26IdentityManagementUIClient)init;
- (void)clearDataAfterTerminalProofingStateWithState:(NSString *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)deleteBoundACLWithCompletionHandler:(id)a3;
- (void)fetchBioBindingDetailsWithCompletionHandler:(id)a3;
- (void)fetchBiomeFedStatsUIWithCompletion:(id)a3;
- (void)fetchExtendedReviewDisplayInfo:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5;
- (void)fetchImageQualitySettingsWithCompletion:(id)a3;
- (void)fetchTermsAndConditionsWithCompletion:(id)a3;
- (void)getLivenessConfigWithCompletionHandler:(id)a3;
- (void)globalAuthACLTemplateUUIDsWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)isWatchPairedWithIdType:(int64_t)a3 completionHandler:(id)a4;
- (void)prepareForProofingDisplay:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 idType:(int64_t)a5 completionHandler:(id)a6;
- (void)prepareForProofingIdentity:(_TtC13CoreIDVShared25IdentityProofingDocuments *)a3 completionHandler:(id)a4;
- (void)proofIdentity:(id)a3 :(unint64_t)a4 :(BOOL)a5 totalUploadAssetsFileSizeInBytes:(int64_t)a6 completion:(id)a7;
- (void)proofIdentityUsing:(id)a3 proofingOptions:(unint64_t)a4 completion:(id)a5;
- (void)proofingCancelledWithConfiguration:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5;
- (void)proofingFlowAvailabilityWithCompletionHandler:(id)a3;
- (void)proofingStatusFor:(NSString *)a3 country:(NSString *)a4 completionHandler:(id)a5;
- (void)provisionIdentityWithState:(NSString *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5;
- (void)retrieveBioBindingUnboundACLWithCompletionHandler:(id)a3;
- (void)retrieveBoundACLWithCompletionHandler:(id)a3;
- (void)retrievePasscodeBindingUnboundACLWithCompletionHandler:(id)a3;
- (void)saveIdentityProofingBiomeDataSharingUserConsent:(BOOL)a3 state:(NSString *)a4 proofingOptions:(unint64_t)a5 completionHandler:(id)a6;
- (void)setGlobalBoundACLWithData:(NSData *)a3 type:(int64_t)a4 completionHandler:(id)a5;
- (void)setModifiedGlobalBoundACLWithData:(NSData *)a3 externalizedLAContext:(NSData *)a4 completionHandler:(id)a5;
- (void)triggerAssetsUploadWithProofingOptions:(unint64_t)a3 canUploadOnExpensiveNetwork:(BOOL)a4 completion:(id)a5;
- (void)uploadLivenessVideoWithLivenessVideoURL:(_TtC13CoreIDVShared32IdentityProofingLivenessVideoURL *)a3 shouldScheduleUploads:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation IdentityManagementUIClient

- (void)dealloc
{
  v2 = self;
  IdentityManagementUIClient.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CoreIDVShared26IdentityManagementUIClient_serverConnection));
  swift_release();
  swift_unknownObjectRelease();
  v3 = *(void **)&self->disconnectHandler[OBJC_IVAR____TtC13CoreIDVShared26IdentityManagementUIClient_remoteObjectProxyError];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)triggerAssetsUploadWithProofingOptions:(unint64_t)a3 canUploadOnExpensiveNetwork:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = self;
  sub_1D79D2DC4(a3, v5, (uint64_t)v9, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)prepareForProofingDisplay:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 idType:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v11 - 8, v12, v13, v14, v15, v16, v17, v18);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = _Block_copy(a6);
  v22 = (void *)swift_allocObject();
  v22[2] = a3;
  v22[3] = a4;
  v22[4] = a5;
  v22[5] = v21;
  v22[6] = self;
  uint64_t v23 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v20, 1, 1, v23);
  v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_1EA846598;
  v24[5] = v22;
  v25 = (void *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_1EA8465A0;
  v25[5] = v24;
  v26 = a3;
  v27 = self;
  sub_1D7A32DD4((uint64_t)v20, (uint64_t)&unk_1EA8465A8, (uint64_t)v25);
  swift_release();
}

- (void)prepareForProofingIdentity:(_TtC13CoreIDVShared25IdentityProofingDocuments *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v7 - 8, v8, v9, v10, v11, v12, v13, v14);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = _Block_copy(a4);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a3;
  v18[3] = v17;
  v18[4] = self;
  uint64_t v19 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v16, 1, 1, v19);
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1EA846578;
  v20[5] = v18;
  v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_1EA846580;
  v21[5] = v20;
  v22 = a3;
  uint64_t v23 = self;
  sub_1D7A32DD4((uint64_t)v16, (uint64_t)&unk_1EA846588, (uint64_t)v21);
  swift_release();
}

- (void)provisionIdentityWithState:(NSString *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v9 - 8, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _Block_copy(a5);
  v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = v19;
  v20[5] = self;
  uint64_t v21 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EA846558;
  v22[5] = v20;
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EA846560;
  v23[5] = v22;
  uint64_t v24 = a3;
  v25 = self;
  sub_1D7A32DD4((uint64_t)v18, (uint64_t)&unk_1EA846568, (uint64_t)v23);
  swift_release();
}

- (void)fetchImageQualitySettingsWithCompletion:(id)a3
{
}

- (void)proofIdentity:(id)a3 :(unint64_t)a4 :(BOOL)a5 totalUploadAssetsFileSizeInBytes:(int64_t)a6 completion:(id)a7
{
  BOOL v8 = a5;
  uint64_t v12 = _Block_copy(a7);
  _Block_copy(v12);
  id v13 = a3;
  uint64_t v14 = self;
  sub_1D79D37A8((uint64_t)v13, a4, v8, a6, (uint64_t)v14, (void (**)(void, void, void))v12);
  _Block_release(v12);
  _Block_release(v12);
}

- (void)proofIdentityUsing:(id)a3 proofingOptions:(unint64_t)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_1D7A9BFC8();
  uint64_t v10 = v9;
  _Block_copy(v7);
  uint64_t v11 = self;
  sub_1D79D3CB0(v8, v10, a4, (uint64_t)v11, (void (**)(void, void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)proofingFlowAvailabilityWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v5 - 8, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a3);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = self;
  uint64_t v17 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EA846538;
  v18[5] = v16;
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EA846540;
  v19[5] = v18;
  v20 = self;
  sub_1D7A32DD4((uint64_t)v14, (uint64_t)&unk_1EA846548, (uint64_t)v19);
  swift_release();
}

- (void)proofingStatusFor:(NSString *)a3 country:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v9 - 8, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _Block_copy(a5);
  v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = v19;
  v20[5] = self;
  uint64_t v21 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EA846518;
  v22[5] = v20;
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EA846520;
  v23[5] = v22;
  uint64_t v24 = a3;
  v25 = a4;
  uint64_t v26 = self;
  sub_1D7A32DD4((uint64_t)v18, (uint64_t)&unk_1EA846528, (uint64_t)v23);
  swift_release();
}

- (void)isWatchPairedWithIdType:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v7 - 8, v8, v9, v10, v11, v12, v13, v14);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = _Block_copy(a4);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a3;
  v18[3] = v17;
  v18[4] = self;
  uint64_t v19 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v16, 1, 1, v19);
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1EA8464F8;
  v20[5] = v18;
  uint64_t v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_1EA846500;
  v21[5] = v20;
  v22 = self;
  sub_1D7A32DD4((uint64_t)v16, (uint64_t)&unk_1EA846508, (uint64_t)v21);
  swift_release();
}

- (void)proofingCancelledWithConfiguration:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v9 - 8, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _Block_copy(a5);
  v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = v19;
  v20[5] = self;
  uint64_t v21 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EA8464D8;
  v22[5] = v20;
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EA8464E0;
  v23[5] = v22;
  uint64_t v24 = a3;
  v25 = self;
  sub_1D7A32DD4((uint64_t)v18, (uint64_t)&unk_1EA8464E8, (uint64_t)v23);
  swift_release();
}

- (void)setGlobalBoundACLWithData:(NSData *)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v9 - 8, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _Block_copy(a5);
  v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = v19;
  v20[5] = self;
  uint64_t v21 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EA8464B8;
  v22[5] = v20;
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EA8464C0;
  v23[5] = v22;
  uint64_t v24 = a3;
  v25 = self;
  sub_1D7A32DD4((uint64_t)v18, (uint64_t)&unk_1EA8464C8, (uint64_t)v23);
  swift_release();
}

- (void)setModifiedGlobalBoundACLWithData:(NSData *)a3 externalizedLAContext:(NSData *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v9 - 8, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _Block_copy(a5);
  v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = v19;
  v20[5] = self;
  uint64_t v21 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EA846498;
  v22[5] = v20;
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EA8464A0;
  v23[5] = v22;
  uint64_t v24 = a3;
  v25 = a4;
  uint64_t v26 = self;
  sub_1D7A32DD4((uint64_t)v18, (uint64_t)&unk_1EA8464A8, (uint64_t)v23);
  swift_release();
}

- (void)retrieveBioBindingUnboundACLWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v5 - 8, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a3);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = self;
  uint64_t v17 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EA846478;
  v18[5] = v16;
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EA846480;
  v19[5] = v18;
  v20 = self;
  sub_1D7A32DD4((uint64_t)v14, (uint64_t)&unk_1EA846488, (uint64_t)v19);
  swift_release();
}

- (void)retrievePasscodeBindingUnboundACLWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v5 - 8, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a3);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = self;
  uint64_t v17 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EA846458;
  v18[5] = v16;
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EA846460;
  v19[5] = v18;
  v20 = self;
  sub_1D7A32DD4((uint64_t)v14, (uint64_t)&unk_1EA846468, (uint64_t)v19);
  swift_release();
}

- (void)retrieveBoundACLWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v5 - 8, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a3);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = self;
  uint64_t v17 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EA846438;
  v18[5] = v16;
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EA846440;
  v19[5] = v18;
  v20 = self;
  sub_1D7A32DD4((uint64_t)v14, (uint64_t)&unk_1EA846448, (uint64_t)v19);
  swift_release();
}

- (void)deleteBoundACLWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v5 - 8, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a3);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = self;
  uint64_t v17 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EA846418;
  v18[5] = v16;
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EA846420;
  v19[5] = v18;
  v20 = self;
  sub_1D7A32DD4((uint64_t)v14, (uint64_t)&unk_1EA846428, (uint64_t)v19);
  swift_release();
}

- (void)fetchBioBindingDetailsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v5 - 8, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a3);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = self;
  uint64_t v17 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EA8463F8;
  v18[5] = v16;
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EA846400;
  v19[5] = v18;
  v20 = self;
  sub_1D7A32DD4((uint64_t)v14, (uint64_t)&unk_1EA846408, (uint64_t)v19);
  swift_release();
}

- (void)fetchTermsAndConditionsWithCompletion:(id)a3
{
}

- (void)uploadLivenessVideoWithLivenessVideoURL:(_TtC13CoreIDVShared32IdentityProofingLivenessVideoURL *)a3 shouldScheduleUploads:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v9 - 8, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _Block_copy(a5);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a3;
  *(unsigned char *)(v20 + 24) = a4;
  *(void *)(v20 + 32) = v19;
  *(void *)(v20 + 40) = self;
  uint64_t v21 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EA8463D8;
  v22[5] = v20;
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EA8463E0;
  v23[5] = v22;
  uint64_t v24 = a3;
  v25 = self;
  sub_1D7A32DD4((uint64_t)v18, (uint64_t)&unk_1EA8463E8, (uint64_t)v23);
  swift_release();
}

- (void)getLivenessConfigWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v5 - 8, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a3);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = self;
  uint64_t v17 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EA8463B8;
  v18[5] = v16;
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EA8463C0;
  v19[5] = v18;
  uint64_t v20 = self;
  sub_1D7A32DD4((uint64_t)v14, (uint64_t)&unk_1EA8463C8, (uint64_t)v19);
  swift_release();
}

- (void)fetchExtendedReviewDisplayInfo:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v9 - 8, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _Block_copy(a5);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = v19;
  v20[5] = self;
  uint64_t v21 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EA846398;
  v22[5] = v20;
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EA8463A0;
  v23[5] = v22;
  uint64_t v24 = a3;
  v25 = self;
  sub_1D7A32DD4((uint64_t)v18, (uint64_t)&unk_1EA8463A8, (uint64_t)v23);
  swift_release();
}

- (void)fetchBiomeFedStatsUIWithCompletion:(id)a3
{
}

- (void)saveIdentityProofingBiomeDataSharingUserConsent:(BOOL)a3 state:(NSString *)a4 proofingOptions:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v11 - 8, v12, v13, v14, v15, v16, v17, v18);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = _Block_copy(a6);
  uint64_t v22 = swift_allocObject();
  *(unsigned char *)(v22 + 16) = a3;
  *(void *)(v22 + 24) = a4;
  *(void *)(v22 + 32) = a5;
  *(void *)(v22 + 40) = v21;
  *(void *)(v22 + 48) = self;
  uint64_t v23 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v20, 1, 1, v23);
  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_1EA846378;
  v24[5] = v22;
  v25 = (void *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_1EA846380;
  v25[5] = v24;
  uint64_t v26 = a4;
  uint64_t v27 = self;
  sub_1D7A32DD4((uint64_t)v20, (uint64_t)&unk_1EA846388, (uint64_t)v25);
  swift_release();
}

- (void)clearDataAfterTerminalProofingStateWithState:(NSString *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v9 - 8, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _Block_copy(a5);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = v19;
  v20[5] = self;
  uint64_t v21 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EA846358;
  v22[5] = v20;
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EA846360;
  v23[5] = v22;
  uint64_t v24 = a3;
  v25 = self;
  sub_1D7A32DD4((uint64_t)v18, (uint64_t)&unk_1EA846368, (uint64_t)v23);
  swift_release();
}

- (void)invalidate
{
  v2 = self;
  sub_1D79CD710();
}

- (void)globalAuthACLTemplateUUIDsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDF9978);
  MEMORY[0x1F4188790](v5 - 8, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a3);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = self;
  uint64_t v17 = sub_1D7A9C4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EA846338;
  v18[5] = v16;
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EA846340;
  v19[5] = v18;
  uint64_t v20 = self;
  sub_1D7A32DD4((uint64_t)v14, (uint64_t)&unk_1EA846348, (uint64_t)v19);
  swift_release();
}

- (_TtC13CoreIDVShared26IdentityManagementUIClient)init
{
  result = (_TtC13CoreIDVShared26IdentityManagementUIClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end