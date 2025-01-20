@interface FairPlayPassbookProvisioningObjC
+ (void)getProvisioningInfoWithAuditToken:(id *)a3 nonce:(NSData *)a4 completionHandler:(id)a5;
- (FairPlayPassbookProvisioningObjC)init;
@end

@implementation FairPlayPassbookProvisioningObjC

+ (void)getProvisioningInfoWithAuditToken:(id *)a3 nonce:(NSData *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E9D708);
  MEMORY[0x270FA5388](v9 - 8, v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v21 = *(_OWORD *)a3->var0;
  uint64_t v13 = *(void *)&a3->var0[4];
  uint64_t v14 = *(void *)&a3->var0[6];
  v15 = _Block_copy(a5);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = v21;
  *(void *)(v16 + 32) = v13;
  *(void *)(v16 + 40) = v14;
  *(void *)(v16 + 48) = a4;
  *(void *)(v16 + 56) = v15;
  *(void *)(v16 + 64) = a1;
  uint64_t v17 = sub_24469D0D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v12, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_268E9ECE8;
  v18[5] = v16;
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_268E9ECF8;
  v19[5] = v18;
  v20 = a4;
  sub_24466CE84((uint64_t)v12, (uint64_t)&unk_268E9ED08, (uint64_t)v19);
  swift_release();
}

- (FairPlayPassbookProvisioningObjC)init
{
  v3.receiver = self;
  v3.super_class = (Class)FairPlayPassbookProvisioningObjC;
  return [(FairPlayPassbookProvisioningObjC *)&v3 init];
}

@end