@interface UserAlertPresenterController
- (UserAlertPresenterController)init;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
@end

@implementation UserAlertPresenterController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7 = self;
  sub_100001C64((uint64_t)a3, a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)start
{
  v2 = self;
  sub_100001F0C();
}

- (UserAlertPresenterController)init
{
  *(void *)&self->DKDiagnosticController_opaque[OBJC_IVAR___UserAlertPresenterController_inputs] = 0;
  *(void *)&self->DKDiagnosticController_opaque[OBJC_IVAR___UserAlertPresenterController_responder] = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UserAlertPresenterController();
  return [(UserAlertPresenterController *)&v3 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end