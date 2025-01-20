@interface MCLECv3Encryption
- (MCLECv3Encryption)init;
- (void)encryptJSON:(id)a3 recipientCertBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6;
- (void)encryptWithPayload:(id)a3 recipientCertBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6;
@end

@implementation MCLECv3Encryption

- (void)encryptJSON:(id)a3 recipientCertBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
{
  id v7 = a3;
  id v8 = a4;
  v13 = _Block_copy(a5);
  v14 = _Block_copy(a6);
  v9 = self;
  v20 = (void *)sub_22912B728();
  v15 = (void *)sub_22912B788();
  v18 = v10;
  v17 = (void *)swift_allocObject();
  v17[2] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = v14;
  sub_2291232E8(v20, v15, v18, sub_2291238E4, v17, sub_22912392C, v16);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)encryptWithPayload:(id)a3 recipientCertBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
{
  id v7 = a3;
  id v8 = a4;
  v14 = _Block_copy(a5);
  v15 = _Block_copy(a6);
  v9 = self;
  uint64_t v21 = sub_22912B3D8();
  unint64_t v22 = v10;
  uint64_t v16 = sub_22912B788();
  uint64_t v19 = v11;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v14;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v15;
  sub_229123934(v21, v22, v16, v19, (uint64_t)sub_229128754, v18, (uint64_t)sub_22912879C, v17);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_22910F1C0(v21, v22);
}

- (MCLECv3Encryption)init
{
  return (MCLECv3Encryption *)MCLECv3Encryption.init()();
}

- (void).cxx_destruct
{
}

@end