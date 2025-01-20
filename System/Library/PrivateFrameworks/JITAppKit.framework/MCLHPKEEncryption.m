@interface MCLHPKEEncryption
- (MCLHPKEEncryption)init;
- (void)encryptJSON:(id)a3 certBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6;
- (void)encryptString:(id)a3 certBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6;
@end

@implementation MCLHPKEEncryption

- (void)encryptString:(id)a3 certBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
{
  id v7 = a3;
  id v8 = a4;
  v14 = _Block_copy(a5);
  v15 = _Block_copy(a6);
  v9 = self;
  uint64_t v17 = sub_22912B788();
  uint64_t v22 = v10;
  uint64_t v16 = sub_22912B788();
  uint64_t v20 = v11;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v14;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v15;
  sub_22911E8FC(v17, v22, v16, v20, (uint64_t)sub_22911F748, v19, (uint64_t)sub_22911F790, v18);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)encryptJSON:(id)a3 certBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
{
  id v7 = a3;
  id v8 = a4;
  v13 = _Block_copy(a5);
  v14 = _Block_copy(a6);
  v9 = self;
  uint64_t v20 = (void *)sub_22912B728();
  v15 = (void *)sub_22912B788();
  uint64_t v18 = v10;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v14;
  sub_22911ED84(v20, v15, v18, sub_22911F7D8, v17, sub_22911F820, v16);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (MCLHPKEEncryption)init
{
  return (MCLHPKEEncryption *)sub_229121594();
}

- (void).cxx_destruct
{
}

@end