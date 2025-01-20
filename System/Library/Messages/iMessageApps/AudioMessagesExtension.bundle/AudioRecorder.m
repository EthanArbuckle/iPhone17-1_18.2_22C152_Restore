@interface AudioRecorder
- (_TtC22AudioMessagesExtension13AudioRecorder)init;
@end

@implementation AudioRecorder

- (_TtC22AudioMessagesExtension13AudioRecorder)init
{
  *(void *)&self->delegate[OBJC_IVAR____TtC22AudioMessagesExtension13AudioRecorder_delegate] = 0;
  swift_unknownObjectWeakInit();
  v3 = (char *)self + OBJC_IVAR____TtC22AudioMessagesExtension13AudioRecorder_power;
  *(_DWORD *)v3 = 0;
  v3[4] = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudioRecorder();
  return [(AudioRecorder *)&v5 init];
}

- (void).cxx_destruct
{
}

@end