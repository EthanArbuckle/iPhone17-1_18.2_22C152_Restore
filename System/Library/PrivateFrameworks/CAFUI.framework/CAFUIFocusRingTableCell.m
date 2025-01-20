@interface CAFUIFocusRingTableCell
- (_TtC5CAFUI23CAFUIFocusRingTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CAFUIFocusRingTableCell

- (_TtC5CAFUI23CAFUIFocusRingTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC5CAFUI23CAFUIFocusRingTableCell *)@objc CAFUITableCell.init(style:reuseIdentifier:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))specialized CAFUIFocusRingTableCell.init(style:reuseIdentifier:));
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI23CAFUIFocusRingTableCell_focusRing));
}

@end