@interface ButtonBackground
- (_TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground)initWithCoder:(id)a3;
- (_TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ButtonBackground

- (_TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground)initWithFrame:(CGRect)a3
{
  return (_TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground *)sub_22B52A534(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22B52ABBC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_22B52ACE4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_backdropLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_maskLayer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusLighterLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13AssetExplorerP33_40797D6A7E016042C02AA52347E32AD816ButtonBackground_illuminatedPlusDarkerLayer);
}

@end