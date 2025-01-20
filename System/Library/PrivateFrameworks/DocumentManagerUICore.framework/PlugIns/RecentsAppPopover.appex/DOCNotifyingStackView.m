@interface DOCNotifyingStackView
- (_TtC17RecentsAppPopoverP33_5CFF0318ADA75E65E99FE854BF6EBBE021DOCNotifyingStackView)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopoverP33_5CFF0318ADA75E65E99FE854BF6EBBE021DOCNotifyingStackView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DOCNotifyingStackView

- (void)layoutSubviews
{
  v2 = self;
  sub_100462BE0();
}

- (_TtC17RecentsAppPopoverP33_5CFF0318ADA75E65E99FE854BF6EBBE021DOCNotifyingStackView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC17RecentsAppPopoverP33_5CFF0318ADA75E65E99FE854BF6EBBE021DOCNotifyingStackView_stackViewDidLayoutSubviews);
  v9 = (objc_class *)type metadata accessor for DOCNotifyingStackView();
  void *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[DOCNotifyingStackView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC17RecentsAppPopoverP33_5CFF0318ADA75E65E99FE854BF6EBBE021DOCNotifyingStackView)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC17RecentsAppPopoverP33_5CFF0318ADA75E65E99FE854BF6EBBE021DOCNotifyingStackView_stackViewDidLayoutSubviews);
  v6 = (objc_class *)type metadata accessor for DOCNotifyingStackView();
  void *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(DOCNotifyingStackView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_100035EB4(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC17RecentsAppPopoverP33_5CFF0318ADA75E65E99FE854BF6EBBE021DOCNotifyingStackView_stackViewDidLayoutSubviews));
}

@end