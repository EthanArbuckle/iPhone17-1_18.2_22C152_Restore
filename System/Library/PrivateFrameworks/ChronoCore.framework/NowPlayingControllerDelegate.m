@interface NowPlayingControllerDelegate
- (_TtC10ChronoCore28NowPlayingControllerDelegate)init;
- (void)controller:(id)a3 clientPropertiesDidChangeFrom:(id)a4 to:(id)a5;
- (void)controller:(id)a3 didFailWithError:(id)a4;
- (void)controller:(id)a3 didLoadResponse:(id)a4;
- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5;
- (void)controllerWillReloadForInvalidation:(id)a3;
@end

@implementation NowPlayingControllerDelegate

- (void)controller:(id)a3 didLoadResponse:(id)a4
{
  if (swift_weakLoadStrong())
  {
    id v7 = a3;
    id v8 = a4;
    v9 = self;
    sub_1DABD74B8();

    swift_release();
  }
}

- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5
{
  if (swift_weakLoadStrong())
  {
    id v7 = a3;
    id v8 = self;
    sub_1DABD74B8();

    swift_release();
  }
}

- (void)controller:(id)a3 clientPropertiesDidChangeFrom:(id)a4 to:(id)a5
{
  if (swift_weakLoadStrong())
  {
    id v9 = a3;
    id v10 = a4;
    id v11 = a5;
    v12 = self;
    sub_1DABD74B8();

    swift_release();
  }
}

- (void)controller:(id)a3 didFailWithError:(id)a4
{
  if (swift_weakLoadStrong())
  {
    id v7 = a3;
    id v8 = a4;
    id v9 = self;
    sub_1DABD74B8();

    swift_release();
  }
}

- (void)controllerWillReloadForInvalidation:(id)a3
{
  if (swift_weakLoadStrong())
  {
    id v5 = a3;
    v6 = self;
    sub_1DABD74B8();

    swift_release();
  }
}

- (_TtC10ChronoCore28NowPlayingControllerDelegate)init
{
  result = (_TtC10ChronoCore28NowPlayingControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end