@interface AudioBoxController
- (AudioBoxController)init;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
@end

@implementation AudioBoxController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7 = self;
  sub_10001B2CC((uint64_t)a3, a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)start
{
  v2 = self;
  sub_10001B5B4();
}

- (void)teardown
{
  v2 = self;
  sub_10001BB44();
}

- (AudioBoxController)init
{
  return (AudioBoxController *)sub_10001FBC8();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v3 = &self->DKDiagnosticController_opaque[OBJC_IVAR___AudioBoxController_audioFileFolderURL];
  uint64_t v4 = sub_1000216F0();
  v5 = *(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end