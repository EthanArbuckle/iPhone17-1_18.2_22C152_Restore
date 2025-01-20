@interface DOCCircularProgressView
- (_TtC14RecentsAvocadoP33_ACAB79647BBA32B3F57A54972F7ABA8023DOCCircularProgressView)initWithCoder:(id)a3;
- (_TtC14RecentsAvocadoP33_ACAB79647BBA32B3F57A54972F7ABA8023DOCCircularProgressView)initWithFrame:(CGRect)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)tintColorDidChange;
@end

@implementation DOCCircularProgressView

- (_TtC14RecentsAvocadoP33_ACAB79647BBA32B3F57A54972F7ABA8023DOCCircularProgressView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001197E0();
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCCircularProgressView();
  id v2 = v3.receiver;
  [(DOCCircularProgressView *)&v3 tintColorDidChange];
  sub_100117AA8();
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100117BE8(v4);
}

- (_TtC14RecentsAvocadoP33_ACAB79647BBA32B3F57A54972F7ABA8023DOCCircularProgressView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocadoP33_ACAB79647BBA32B3F57A54972F7ABA8023DOCCircularProgressView_borderLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocadoP33_ACAB79647BBA32B3F57A54972F7ABA8023DOCCircularProgressView_progressLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocadoP33_ACAB79647BBA32B3F57A54972F7ABA8023DOCCircularProgressView_indeterminateLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocadoP33_ACAB79647BBA32B3F57A54972F7ABA8023DOCCircularProgressView_preferredIconColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocadoP33_ACAB79647BBA32B3F57A54972F7ABA8023DOCCircularProgressView_progressBorderColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocadoP33_ACAB79647BBA32B3F57A54972F7ABA8023DOCCircularProgressView_progressFillColor));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocadoP33_ACAB79647BBA32B3F57A54972F7ABA8023DOCCircularProgressView_progressBackgroundColor);
}

@end