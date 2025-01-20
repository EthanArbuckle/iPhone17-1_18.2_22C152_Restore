@interface SecureImageTranscoder
- (_TtC31com_apple_CallKit_CallDirectory21SecureImageTranscoder)init;
- (void)generatePreviewImageFrom:(NSData *)a3 completionHandler:(id)a4;
@end

@implementation SecureImageTranscoder

- (_TtC31com_apple_CallKit_CallDirectory21SecureImageTranscoder)init
{
  return (_TtC31com_apple_CallKit_CallDirectory21SecureImageTranscoder *)SecureImageTranscoder.init()();
}

- (void)generatePreviewImageFrom:(NSData *)a3 completionHandler:(id)a4
{
  sub_100004B80(&qword_10003CF28);
  __chkstk_darwin();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_100025CA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10003CF38;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10003CF40;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_1000221A4((uint64_t)v8, (uint64_t)&unk_10003CF48, (uint64_t)v13);
  swift_release();
}

- (void).cxx_destruct
{
  sub_10001A210((uint64_t)self + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21SecureImageTranscoder_blastDoor);

  swift_bridgeObjectRelease();
}

@end