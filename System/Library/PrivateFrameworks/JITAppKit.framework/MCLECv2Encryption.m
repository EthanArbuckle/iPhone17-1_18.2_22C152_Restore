@interface MCLECv2Encryption
- (BOOL)prependsEphemeralKeyPadding;
- (MCLECv2Encryption)init;
- (void)encrypt:(id)a3 recipientCertBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6;
- (void)encrypt:(id)a3 recipientKeyBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6;
- (void)encrypt:(id)a3 recipientKeyHexEncoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6;
- (void)encryptJSON:(id)a3 recipientCertBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6;
- (void)encryptJSON:(id)a3 recipientKeyHexEncoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6;
- (void)encryptString:(id)a3 recipientKeyBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6;
- (void)setPrependsEphemeralKeyPadding:(BOOL)a3;
@end

@implementation MCLECv2Encryption

- (BOOL)prependsEphemeralKeyPadding
{
  v2 = self;
  sub_229111F2C();

  return sub_22912B458() & 1;
}

- (void)setPrependsEphemeralKeyPadding:(BOOL)a3
{
  v3 = self;
  char v4 = sub_22912B468();
  sub_229111FE8(v4 & 1);
}

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
  sub_229112118(v20, v15, v18, sub_22911283C, v17, sub_229112920, v16);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)encryptJSON:(id)a3 recipientKeyHexEncoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
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
  sub_229112928(v20, v15, v18, sub_229112E70, v17, sub_229112EB8, v16);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)encryptString:(id)a3 recipientKeyBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
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
  sub_229112EC0(v17, v22, v16, v20, (uint64_t)sub_229113338, v19, (void (*)(void))sub_229113380, v18);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)encrypt:(id)a3 recipientCertBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
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
  MCLECv2Encryption.encrypt(_:recipientCertBase64Encoded:onSuccess:onFailure:)(v21, v22, v16, v19, (uint64_t)sub_22911461C, v18, (uint64_t)sub_229114664, v17);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_22910F1C0(v21, v22);
}

- (void)encrypt:(id)a3 recipientKeyHexEncoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
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
  MCLECv2Encryption.encrypt(_:recipientKeyHexEncoded:onSuccess:onFailure:)(v21, v22, v16, v19, (uint64_t)sub_2291156A0, v18, (uint64_t)sub_2291156E8, v17);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_22910F1C0(v21, v22);
}

- (void)encrypt:(id)a3 recipientKeyBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
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
  MCLECv2Encryption.encrypt(_:recipientKeyBase64Encoded:onSuccess:onFailure:)(v21, v22, v16, v19, (uint64_t)sub_229116820, v18, (uint64_t)sub_229116868, v17);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_22910F1C0(v21, v22);
}

- (MCLECv2Encryption)init
{
  return (MCLECv2Encryption *)MCLECv2Encryption.init()();
}

- (void).cxx_destruct
{
}

@end