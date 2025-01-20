@interface CAFUITileBaseCell
- (_TtC5CAFUI17CAFUITileBaseCell)initWithCoder:(id)a3;
- (_TtC5CAFUI17CAFUITileBaseCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)prepareForReuse;
@end

@implementation CAFUITileBaseCell

- (_TtC5CAFUI17CAFUITileBaseCell)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC5CAFUI17CAFUITileBaseCell_isParentCell) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC5CAFUI17CAFUITileBaseCell_automakerSettingConfiguration;
  uint64_t v6 = type metadata accessor for CAFUIAutomakerSettingConfiguration(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC5CAFUI17CAFUITileBaseCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC5CAFUI17CAFUITileBaseCell)initWithFrame:(CGRect)a3
{
  return (_TtC5CAFUI17CAFUITileBaseCell *)CAFUITileBaseCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  CAFUITileBaseCell.updateConfiguration(using:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CAFUITileBaseCell();
  id v2 = v3.receiver;
  [(CAFUITileBaseCell *)&v3 prepareForReuse];
  UICollectionViewListCell.accessories.setter();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI17CAFUITileBaseCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI17CAFUITileBaseCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI17CAFUITileBaseCell_symbolView));
  outlined destroy of UIContentConfiguration?((uint64_t)self + OBJC_IVAR____TtC5CAFUI17CAFUITileBaseCell_automakerSettingConfiguration, &demangling cache variable for type metadata for CAFUIAutomakerSettingConfiguration?);
}

@end