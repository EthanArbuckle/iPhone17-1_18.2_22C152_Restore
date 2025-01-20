@interface MercuryPosterUpdater
- (_TtC22MercuryPosterExtension20MercuryPosterUpdater)init;
- (void)updateDescriptors:(id)a3 withSessionInfo:(id)a4 completion:(id)a5;
@end

@implementation MercuryPosterUpdater

- (_TtC22MercuryPosterExtension20MercuryPosterUpdater)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MercuryPosterUpdater();
  return [(MercuryPosterUpdater *)&v3 init];
}

- (void)updateDescriptors:(id)a3 withSessionInfo:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  sub_100022200();
  uint64_t v8 = sub_10005DDF8();
  _Block_copy(v7);
  id v9 = a4;
  v10 = self;
  sub_100022BF8(v8, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

@end