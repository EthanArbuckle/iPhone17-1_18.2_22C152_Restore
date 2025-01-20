@interface MultiTaskingDisplayManager
- (_TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager)init;
- (void)externalDisplayDidConnect:(id)a3;
- (void)externalDisplayDidUpdateProperties:(id)a3;
- (void)externalDisplayWillDisconnect:(id)a3;
@end

@implementation MultiTaskingDisplayManager

- (_TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager)init
{
  return (_TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager *)sub_11F08();
}

- (void)externalDisplayDidConnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_12C88((uint64_t)sub_12D8C, (uint64_t)&unk_358E0);
}

- (void)externalDisplayWillDisconnect:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayInfo);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayInfo) = 0;
  id v5 = a3;
  v6 = self;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_29ED8();
}

- (void)externalDisplayDidUpdateProperties:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_12C88((uint64_t)sub_12D8C, (uint64_t)&unk_35890);
}

- (void).cxx_destruct
{
  v3 = (char *)self
     + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager__isExternalDisplayConnected;
  uint64_t v4 = sub_9134(&qword_39348);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_displayService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayInfo));
  id v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayObserver);
}

@end