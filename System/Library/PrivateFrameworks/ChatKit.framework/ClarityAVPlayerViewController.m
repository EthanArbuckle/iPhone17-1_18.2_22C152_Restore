@interface ClarityAVPlayerViewController
- (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController)initWithCoder:(id)a3;
- (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController)initWithPlayerLayerView:(id)a3;
- (void)playerDidFinishPlaying;
@end

@implementation ClarityAVPlayerViewController

- (void)playerDidFinishPlaying
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController_finishedPlayingHandler);
  v3 = self;
  uint64_t v4 = sub_18F7B5790();
  v2(v4);

  swift_release();
}

- (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController)initWithCoder:(id)a3
{
  result = (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController)initWithPlayerLayerView:(id)a3
{
  id v3 = a3;
  result = (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end