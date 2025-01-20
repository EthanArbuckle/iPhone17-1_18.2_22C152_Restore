@interface CKAppAudioController
+ (_TtC7ChatKit20CKAppAudioController)sharedInstance;
- (CKAudioController)audioController;
- (_TtC7ChatKit20CKAppAudioController)init;
- (void)setAudioController:(id)a3;
@end

@implementation CKAppAudioController

+ (_TtC7ChatKit20CKAppAudioController)sharedInstance
{
  if (qword_1E922BDB8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E922BDA8;

  return (_TtC7ChatKit20CKAppAudioController *)v2;
}

- (CKAudioController)audioController
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit20CKAppAudioController_audioController);
  swift_beginAccess();
  return (CKAudioController *)*v2;
}

- (void)setAudioController:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit20CKAppAudioController_audioController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC7ChatKit20CKAppAudioController)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit20CKAppAudioController_audioController) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKAppAudioController();
  return [(CKAppAudioController *)&v3 init];
}

- (void).cxx_destruct
{
}

@end