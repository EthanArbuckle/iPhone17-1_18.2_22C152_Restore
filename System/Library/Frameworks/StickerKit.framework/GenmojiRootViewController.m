@interface GenmojiRootViewController
- (BOOL)canBecomeFirstResponder;
- (_TtC10StickerKitP33_EA33ED8DB99C4DEC95D72ADC49E80F3125GenmojiRootViewController)initWithCoder:(id)a3;
- (_TtC10StickerKitP33_EA33ED8DB99C4DEC95D72ADC49E80F3125GenmojiRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation GenmojiRootViewController

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (_TtC10StickerKitP33_EA33ED8DB99C4DEC95D72ADC49E80F3125GenmojiRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_2453FFB38();
    id v6 = a4;
    v7 = (void *)sub_2453FFB08();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for GenmojiRootViewController();
  v9 = [(GenmojiRootViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC10StickerKitP33_EA33ED8DB99C4DEC95D72ADC49E80F3125GenmojiRootViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GenmojiRootViewController();
  return [(GenmojiRootViewController *)&v5 initWithCoder:a3];
}

@end