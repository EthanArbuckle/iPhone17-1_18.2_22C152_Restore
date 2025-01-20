@interface AppProtectionPlugIn
- (_TtC12ClarityBoard19AppProtectionPlugIn)init;
- (void)setApplication:(APApplication *)a3 shielded:(BOOL)a4 forOutlet:(APSystemAppOutlet *)a5 completion:(id)a6;
@end

@implementation AppProtectionPlugIn

- (void)setApplication:(APApplication *)a3 shielded:(BOOL)a4 forOutlet:(APSystemAppOutlet *)a5 completion:(id)a6
{
  uint64_t v11 = sub_100029F90((uint64_t *)&unk_10017C500);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(unsigned char *)(v15 + 24) = a4;
  *(void *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_10017DC18;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_10017DC20;
  v18[5] = v17;
  v19 = a3;
  v20 = a5;
  v21 = self;
  sub_10008C550((uint64_t)v13, (uint64_t)&unk_10017DC28, (uint64_t)v18);
  swift_release();
}

- (_TtC12ClarityBoard19AppProtectionPlugIn)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_weakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(AppProtectionPlugIn *)&v5 init];
}

- (void).cxx_destruct
{
}

@end