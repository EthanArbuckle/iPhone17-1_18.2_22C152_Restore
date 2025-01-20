@interface AudioPlayer
- (_TtC6DropIn11AudioPlayer)init;
- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
@end

@implementation AudioPlayer

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_24D01D9F0();
}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v8 = a3;
  v6 = self;
  id v7 = a4;
  sub_24D01DAE8((uint64_t)v7, a4);
}

- (_TtC6DropIn11AudioPlayer)init
{
}

- (void).cxx_destruct
{
  sub_24D01DD94(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC6DropIn11AudioPlayer_playHandler));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6DropIn11AudioPlayer_timeoutTimer);
}

@end