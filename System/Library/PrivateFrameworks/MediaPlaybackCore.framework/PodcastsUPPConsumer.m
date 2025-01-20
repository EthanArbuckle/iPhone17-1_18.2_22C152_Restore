@interface PodcastsUPPConsumer
+ (NSString)identifier;
+ (void)setIdentifier:(id)a3;
- (_TtC17MediaPlaybackCore19PodcastsUPPConsumer)init;
- (_TtC17MediaPlaybackCore19PodcastsUPPConsumer)initWithPlaybackEngine:(id)a3 playbackPositionHandler:(id)a4;
- (void)subscribeToEventStream:(id)a3;
- (void)unsubscribeFromEventStream:(id)a3;
@end

@implementation PodcastsUPPConsumer

+ (NSString)identifier
{
  sub_21BCB7BFC();
  v2 = (void *)sub_21BEAA138();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

+ (void)setIdentifier:(id)a3
{
  uint64_t v3 = sub_21BEAA178();
  sub_21BCB7C7C(v3, v4);
}

- (_TtC17MediaPlaybackCore19PodcastsUPPConsumer)initWithPlaybackEngine:(id)a3 playbackPositionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v5 = sub_21BC4D084;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC17MediaPlaybackCore19PodcastsUPPConsumer *)sub_21BCB7CCC(a3, (uint64_t)v5, v6);
}

- (void)subscribeToEventStream:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_21BCB7E7C(a3);
  swift_unknownObjectRelease();
}

- (void)unsubscribeFromEventStream:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_21BCB82E4();
  swift_unknownObjectRelease();
}

- (_TtC17MediaPlaybackCore19PodcastsUPPConsumer)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17MediaPlaybackCore19PodcastsUPPConsumer_playbackPositionController));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17MediaPlaybackCore19PodcastsUPPConsumer_playbackPositionHandler);

  sub_21BC020B8(v3);
}

@end