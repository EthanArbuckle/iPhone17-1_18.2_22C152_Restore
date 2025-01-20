@interface HMDACWGKeyManager
+ (HMDACWGKeyManager)shared;
- (HMDACWGKeyManager)init;
- (void)getIssuerKeyPairExternalRepresentationFromKeychainWithCompletionHandler:(id)a3;
- (void)getOrCreateIssuerKeyAndSaveToSharedUserReverseShareWithHomeUUID:(NSUUID *)a3 context:(HMCContext *)a4 flow:(HMFFlow *)a5 completionHandler:(id)a6;
- (void)getOrCreateIssuerKeyPairExternalRepresentationWithFlow:(HMFFlow *)a3 completionHandler:(id)a4;
@end

@implementation HMDACWGKeyManager

+ (HMDACWGKeyManager)shared
{
  if (qword_2686D6388 != -1) {
    swift_once();
  }
  v2 = (void *)swift_retain();
  return (HMDACWGKeyManager *)v2;
}

- (void)getOrCreateIssuerKeyPairExternalRepresentationWithFlow:(HMFFlow *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2686D87A8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2686D87B0;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_22F6C83BC((uint64_t)v9, (uint64_t)&unk_2686D87B8, (uint64_t)v14);
  swift_release();
}

- (void)getOrCreateIssuerKeyAndSaveToSharedUserReverseShareWithHomeUUID:(NSUUID *)a3 context:(HMCContext *)a4 flow:(HMFFlow *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2686D8788;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_2686D8790;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  swift_retain();
  sub_22F6C83BC((uint64_t)v13, (uint64_t)&unk_2686D8798, (uint64_t)v18);
  swift_release();
}

- (void)getIssuerKeyPairExternalRepresentationFromKeychainWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2686D8768;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2686D8770;
  v12[5] = v11;
  swift_retain();
  sub_22F6C83BC((uint64_t)v7, (uint64_t)&unk_2686D98D0, (uint64_t)v12);
  swift_release();
}

- (HMDACWGKeyManager)init
{
  swift_defaultActor_initialize();
  result = (HMDACWGKeyManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end