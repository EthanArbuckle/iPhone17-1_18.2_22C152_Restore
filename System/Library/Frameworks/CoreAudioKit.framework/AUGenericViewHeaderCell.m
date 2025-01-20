@interface AUGenericViewHeaderCell
- (UILabel)auManufacturerLabel;
- (UILabel)auNameLabel;
- (UILabel)auVersionLabel;
- (_TtC12CoreAudioKit23AUGenericViewHeaderCell)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit23AUGenericViewHeaderCell)initWithFrame:(CGRect)a3;
- (void)setAuManufacturerLabel:(id)a3;
- (void)setAuNameLabel:(id)a3;
- (void)setAuVersionLabel:(id)a3;
@end

@implementation AUGenericViewHeaderCell

- (UILabel)auNameLabel
{
  v2 = (void *)MEMORY[0x223C2B6C0]((char *)self + OBJC_IVAR____TtC12CoreAudioKit23AUGenericViewHeaderCell_auNameLabel, a2);

  return (UILabel *)v2;
}

- (void)setAuNameLabel:(id)a3
{
}

- (UILabel)auVersionLabel
{
  v2 = (void *)MEMORY[0x223C2B6C0]((char *)self + OBJC_IVAR____TtC12CoreAudioKit23AUGenericViewHeaderCell_auVersionLabel, a2);

  return (UILabel *)v2;
}

- (void)setAuVersionLabel:(id)a3
{
}

- (UILabel)auManufacturerLabel
{
  v2 = (void *)MEMORY[0x223C2B6C0]((char *)self + OBJC_IVAR____TtC12CoreAudioKit23AUGenericViewHeaderCell_auManufacturerLabel, a2);

  return (UILabel *)v2;
}

- (void)setAuManufacturerLabel:(id)a3
{
}

- (_TtC12CoreAudioKit23AUGenericViewHeaderCell)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit23AUGenericViewHeaderCell *)sub_21E55310C(a3);
}

- (_TtC12CoreAudioKit23AUGenericViewHeaderCell)initWithFrame:(CGRect)a3
{
  result = (_TtC12CoreAudioKit23AUGenericViewHeaderCell *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit23AUGenericViewHeaderCell_audioUnit);
}

@end