@interface AnnouncePlaybackHelper
- (_TtC8Announce22AnnouncePlaybackHelper)init;
- (void)connectionInterrupted;
@end

@implementation AnnouncePlaybackHelper

- (_TtC8Announce22AnnouncePlaybackHelper)init
{
  result = (_TtC8Announce22AnnouncePlaybackHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Announce22AnnouncePlaybackHelper____lazy_storage___tonePlayer));
  v3 = (char *)self + OBJC_IVAR____TtC8Announce22AnnouncePlaybackHelper_logger;
  uint64_t v4 = sub_220FCB5E0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)connectionInterrupted
{
  uint64_t v2 = OBJC_IVAR____TtC8Announce22AnnouncePlaybackHelper_localPlaybackSession;
  v3 = *(void **)&a1[OBJC_IVAR____TtC8Announce22AnnouncePlaybackHelper_localPlaybackSession];
  uint64_t v4 = a1;
  if (v3)
  {
    objc_msgSend(v3, sel_setDelegate_, 0);
    id v5 = *(id *)&a1[v2];
  }
  else
  {
    id v5 = 0;
  }
  *(void *)&a1[v2] = 0;
}

@end