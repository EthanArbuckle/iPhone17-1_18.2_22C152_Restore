@interface StickerPickerServiceViewController
- (_TtC20StickerPickerService34StickerPickerServiceViewController)initWithCoder:(id)a3;
- (_TtC20StickerPickerService34StickerPickerServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation StickerPickerServiceViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for StickerPickerServiceViewController();
  [(StickerPickerServiceViewController *)&v2 viewDidLoad];
}

- (_TtC20StickerPickerService34StickerPickerServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for StickerPickerServiceViewController();
  v9 = [(StickerPickerServiceViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC20StickerPickerService34StickerPickerServiceViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StickerPickerServiceViewController();
  return [(StickerPickerServiceViewController *)&v5 initWithCoder:a3];
}

@end