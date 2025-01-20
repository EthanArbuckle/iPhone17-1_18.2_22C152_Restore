@interface VideoPlayer
- (_TtC27AppleMediaServicesUIDynamic11VideoPlayer)init;
- (_TtC27AppleMediaServicesUIDynamic11VideoPlayer)initWithPlayerItem:(id)a3;
- (_TtC27AppleMediaServicesUIDynamic11VideoPlayer)initWithURL:(id)a3;
- (void)dealloc;
- (void)pause;
- (void)play;
@end

@implementation VideoPlayer

- (void)dealloc
{
  v2 = self;
  VideoPlayer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_1BF3DDEA8((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoUrl, &qword_1EBA94B20);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoObserver));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem));
  sub_1BF3DDEA8((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failure, &qword_1EA148870);
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate;

  sub_1BF3C5518((uint64_t)v3);
}

- (void)play
{
  v2 = self;
  VideoPlayer.play()();
}

- (void)pause
{
  v2 = self;
  VideoPlayer.pause()();
}

- (_TtC27AppleMediaServicesUIDynamic11VideoPlayer)init
{
}

- (_TtC27AppleMediaServicesUIDynamic11VideoPlayer)initWithURL:(id)a3
{
  uint64_t v3 = sub_1BF464E58();
  MEMORY[0x1F4188790](v3 - 8);
  sub_1BF464E08();
  VideoPlayer.init(url:)();
}

- (_TtC27AppleMediaServicesUIDynamic11VideoPlayer)initWithPlayerItem:(id)a3
{
  id v3 = a3;
  VideoPlayer.init(playerItem:)();
}

@end