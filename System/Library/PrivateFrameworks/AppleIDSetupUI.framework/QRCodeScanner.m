@interface QRCodeScanner
- (_TtC14AppleIDSetupUI13QRCodeScanner)init;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
@end

@implementation QRCodeScanner

- (_TtC14AppleIDSetupUI13QRCodeScanner)init
{
  return (_TtC14AppleIDSetupUI13QRCodeScanner *)sub_2482DAB4C();
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  sub_2482CFAD4(0, &qword_2693135C8);
  unint64_t v8 = sub_24835D558();
  id v9 = a3;
  id v10 = a5;
  v11 = self;
  sub_2482DC16C(v8);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14AppleIDSetupUI13QRCodeScanner__string;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693135F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC14AppleIDSetupUI13QRCodeScanner___isRunning;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269312EC0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC14AppleIDSetupUI13QRCodeScanner___captureDevice;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2693135E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  id v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14AppleIDSetupUI13QRCodeScanner_captureSession);
}

@end