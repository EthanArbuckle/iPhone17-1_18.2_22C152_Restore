@interface UnpairSessionAccessoryController
- (UnpairSessionAccessoryController)init;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
@end

@implementation UnpairSessionAccessoryController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  if ([a4 respondsToSelector:"unpairSessionAccessoryOnTestCompletion"])
  {
    *(void *)&v6->DKDiagnosticController_opaque[OBJC_IVAR___UnpairSessionAccessoryController_accessoryResponder] = a4;

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
  }

  swift_unknownObjectRelease();
}

- (void)start
{
  v2 = self;
  sub_1000036C0();
}

- (UnpairSessionAccessoryController)init
{
  *(void *)&self->DKDiagnosticController_opaque[OBJC_IVAR___UnpairSessionAccessoryController_accessoryResponder] = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UnpairSessionAccessoryController();
  return [(UnpairSessionAccessoryController *)&v3 init];
}

- (void).cxx_destruct
{
}

@end