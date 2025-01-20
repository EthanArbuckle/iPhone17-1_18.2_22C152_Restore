@interface CAFNowPlayingObservable
- (NSString)description;
- (_TtC10CAFCombine23CAFNowPlayingObservable)init;
- (void)dealloc;
- (void)nowPlayingService:(id)a3 didUpdateAlbum:(id)a4;
- (void)nowPlayingService:(id)a3 didUpdateArtist:(id)a4;
- (void)nowPlayingService:(id)a3 didUpdateArtwork:(id)a4;
- (void)nowPlayingService:(id)a3 didUpdateCurrentMediaSourceIdentifier:(id)a4;
- (void)nowPlayingService:(id)a3 didUpdateJumpBackwardInterval:(id)a4;
- (void)nowPlayingService:(id)a3 didUpdateJumpForwardInterval:(id)a4;
- (void)nowPlayingService:(id)a3 didUpdatePlaybackState:(unsigned __int8)a4;
- (void)nowPlayingService:(id)a3 didUpdateTitle:(id)a4;
- (void)nowPlayingService:(id)a3 didUpdateUserVisibleDescription:(id)a4;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation CAFNowPlayingObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFNowPlayingObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFNowPlayingObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC10CAFCombine23CAFNowPlayingObservable)init
{
}

- (void)nowPlayingService:(id)a3 didUpdateCurrentMediaSourceIdentifier:(id)a4
{
}

- (void)nowPlayingService:(id)a3 didUpdateTitle:(id)a4
{
}

- (void)nowPlayingService:(id)a3 didUpdateArtist:(id)a4
{
}

- (void)nowPlayingService:(id)a3 didUpdateAlbum:(id)a4
{
}

- (void)nowPlayingService:(id)a3 didUpdateUserVisibleDescription:(id)a4
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  CAFNowPlayingObservable.nowPlayingService(_:didUpdateUserVisibleDescription:)();

  swift_bridgeObjectRelease();
}

- (void)nowPlayingService:(id)a3 didUpdateArtwork:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  CAFNowPlayingObservable.nowPlayingService(_:didUpdateArtwork:)();
  outlined consume of Data._Representation(v8, v10);
}

- (void)nowPlayingService:(id)a3 didUpdateJumpBackwardInterval:(id)a4
{
}

- (void)nowPlayingService:(id)a3 didUpdateJumpForwardInterval:(id)a4
{
}

- (void)nowPlayingService:(id)a3 didUpdatePlaybackState:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = self;
  CAFNowPlayingObservable.nowPlayingService(_:didUpdatePlaybackState:)();
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFNowPlayingObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  CAFNowPlayingObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFNowPlayingObservable.serviceDidFinishGroupUpdate(_:)();
}

@end