@interface DOCCircularProgressView
- (_TtC17RecentsAppPopoverP33_C26B40F7D2A4595B8CD5EBA80C57ECC623DOCCircularProgressView)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopoverP33_C26B40F7D2A4595B8CD5EBA80C57ECC623DOCCircularProgressView)initWithFrame:(CGRect)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)tintColorDidChange;
@end

@implementation DOCCircularProgressView

- (_TtC17RecentsAppPopoverP33_C26B40F7D2A4595B8CD5EBA80C57ECC623DOCCircularProgressView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10028FBA4();
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCCircularProgressView();
  id v2 = v3.receiver;
  [(DOCCircularProgressView *)&v3 tintColorDidChange];
  sub_10028DE6C();
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10028DFAC(v4);
}

- (_TtC17RecentsAppPopoverP33_C26B40F7D2A4595B8CD5EBA80C57ECC623DOCCircularProgressView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopoverP33_C26B40F7D2A4595B8CD5EBA80C57ECC623DOCCircularProgressView_borderLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopoverP33_C26B40F7D2A4595B8CD5EBA80C57ECC623DOCCircularProgressView_progressLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopoverP33_C26B40F7D2A4595B8CD5EBA80C57ECC623DOCCircularProgressView_indeterminateLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopoverP33_C26B40F7D2A4595B8CD5EBA80C57ECC623DOCCircularProgressView_preferredIconColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopoverP33_C26B40F7D2A4595B8CD5EBA80C57ECC623DOCCircularProgressView_progressBorderColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopoverP33_C26B40F7D2A4595B8CD5EBA80C57ECC623DOCCircularProgressView_progressFillColor));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17RecentsAppPopoverP33_C26B40F7D2A4595B8CD5EBA80C57ECC623DOCCircularProgressView_progressBackgroundColor);
}

@end