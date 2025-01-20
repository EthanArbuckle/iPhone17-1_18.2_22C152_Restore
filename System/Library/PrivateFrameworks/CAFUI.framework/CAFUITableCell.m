@interface CAFUITableCell
- (BOOL)canBecomeFocused;
- (_TtC5CAFUI14CAFUITableCell)initWithCoder:(id)a3;
- (_TtC5CAFUI14CAFUITableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CAFUITableCell

- (_TtC5CAFUI14CAFUITableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC5CAFUI14CAFUITableCell *)@objc CAFUITableCell.init(style:reuseIdentifier:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))specialized CAFUITableCell.init(style:reuseIdentifier:));
}

- (_TtC5CAFUI14CAFUITableCell)initWithCoder:(id)a3
{
  result = (_TtC5CAFUI14CAFUITableCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)canBecomeFocused
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.isa) + 0x60);
  v3 = self;
  LOBYTE(v2) = v2();

  return v2 & 1;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CAFUITableCell();
  id v2 = v4.receiver;
  [(CAFUITableCell *)&v4 prepareForReuse];
  objc_msgSend(v2, sel_setSelectionStyle_, 1, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_setAccessoryType_, 0);
  id v3 = objc_msgSend(v2, sel_accessoryView);
  objc_msgSend(v3, sel_removeFromSuperview);

  objc_msgSend(v2, sel_setAccessoryView_, 0);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  CAFUITableCell.updateConfiguration(using:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v6 = *(unsigned int (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.isa) + 0x58);
  v7 = self;
  uint64_t v8 = v6() & v5;
  uint64_t v9 = v6() & v4;
  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for CAFUITableCell();
  [(CAFUITableCell *)&v10 setHighlighted:v8 animated:v9];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v6 = *(unsigned int (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.isa) + 0x60);
  v7 = self;
  uint64_t v8 = v6() & v5;
  uint64_t v9 = v6() & v4;
  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for CAFUITableCell();
  [(CAFUITableCell *)&v10 setSelected:v8 animated:v9];
}

@end