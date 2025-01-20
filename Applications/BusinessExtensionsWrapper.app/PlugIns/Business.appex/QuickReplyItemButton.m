@interface QuickReplyItemButton
- (BOOL)isHighlighted;
- (_TtC8Business20QuickReplyItemButton)initWithCoder:(id)a3;
- (_TtC8Business20QuickReplyItemButton)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation QuickReplyItemButton

- (_TtC8Business20QuickReplyItemButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business20QuickReplyItemButton____lazy_storage___titleLabel) = 0;
  id v4 = a3;

  result = (_TtC8Business20QuickReplyItemButton *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for QuickReplyItemButton();
  return [(QuickReplyItemButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  id v4 = self;
  sub_100069494(a3);
}

- (_TtC8Business20QuickReplyItemButton)initWithFrame:(CGRect)a3
{
  result = (_TtC8Business20QuickReplyItemButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20QuickReplyItemButton____lazy_storage___titleLabel));
}

@end