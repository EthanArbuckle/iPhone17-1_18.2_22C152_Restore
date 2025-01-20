@interface MUBadgeView
- (MUBadgeView)initWithCoder:(id)a3;
- (MUBadgeView)initWithFrame:(CGRect)a3;
- (NSString)badgeString;
- (void)setBadgeString:(id)a3;
@end

@implementation MUBadgeView

- (MUBadgeView)initWithFrame:(CGRect)a3
{
  return (MUBadgeView *)BadgeView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MUBadgeView)initWithCoder:(id)a3
{
  result = (MUBadgeView *)sub_1933417B0();
  __break(1u);
  return result;
}

- (NSString)badgeString
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUBadgeView_label);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_text);
  if (v4)
  {
    v5 = v4;
    sub_1933413B0();
  }
  else
  {
  }
  v6 = (void *)sub_193341380();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)setBadgeString:(id)a3
{
  sub_1933413B0();
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUBadgeView_label);
  v5 = self;
  id v6 = (id)sub_193341380();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setText_, v6);
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUBadgeView_blurView);
}

@end