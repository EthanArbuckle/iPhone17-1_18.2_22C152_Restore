@interface GKMultiplayerPickerPlayerCell
+ (CGSize)preferredSizeFitting:(CGSize)a3 inTraitEnvironment:(id)a4;
+ (NSString)reuseIdentifier;
- (_TtC12GameCenterUI29GKMultiplayerPickerPlayerCell)initWithCoder:(id)a3;
- (_TtC12GameCenterUI29GKMultiplayerPickerPlayerCell)initWithFrame:(CGRect)a3;
- (void)applyWithPlayer:(id)a3 isCoreRecent:(BOOL)a4;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation GKMultiplayerPickerPlayerCell

+ (NSString)reuseIdentifier
{
  static GKMultiplayerPickerPlayerCell.reuseIdentifier.getter();
  v2 = (void *)sub_1AF7AE0A0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC12GameCenterUI29GKMultiplayerPickerPlayerCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI29GKMultiplayerPickerPlayerCell *)GKMultiplayerPickerPlayerCell.init(frame:)();
}

- (_TtC12GameCenterUI29GKMultiplayerPickerPlayerCell)initWithCoder:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  GKMultiplayerPickerPlayerCell.layoutSubviews()();
}

- (void)applyWithPlayer:(id)a3 isCoreRecent:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  GKMultiplayerPickerPlayerCell.apply(player:isCoreRecent:)((GKPlayer)v6, a4);
}

+ (CGSize)preferredSizeFitting:(CGSize)a3 inTraitEnvironment:(id)a4
{
  swift_unknownObjectRetain();
  static GKMultiplayerPickerPlayerCell.preferredSize(fitting:in:)(a4);
  double v6 = v5;
  double v8 = v7;
  swift_unknownObjectRelease();
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  v9.is_nil = (char)v6;
  double v7 = v6;
  v9.value.super.isa = (Class)a3;
  GKMultiplayerPickerPlayerCell.traitCollectionDidChange(_:)(v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29GKMultiplayerPickerPlayerCell_lockupView));
}

@end