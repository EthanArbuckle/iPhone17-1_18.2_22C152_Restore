@interface MusicRecognitionAmbientViewController
- (BOOL)_canShowWhileLocked;
- (_TtC16MusicRecognition37MusicRecognitionAmbientViewController)initWithCoder:(id)a3;
- (_TtC16MusicRecognition37MusicRecognitionAmbientViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)viewDidLoad;
@end

@implementation MusicRecognitionAmbientViewController

- (void)dealloc
{
  v2 = self;
  sub_100010DF8();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionAmbientViewController_matchingFlowView);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000D5874();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MusicRecognition37MusicRecognitionAmbientViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC16MusicRecognition37MusicRecognitionAmbientViewController *)sub_1000D6558(v5, v7, a4);
}

- (_TtC16MusicRecognition37MusicRecognitionAmbientViewController)initWithCoder:(id)a3
{
  return (_TtC16MusicRecognition37MusicRecognitionAmbientViewController *)sub_1000D66B4(a3);
}

@end