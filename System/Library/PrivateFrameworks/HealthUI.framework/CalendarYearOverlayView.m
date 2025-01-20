@interface CalendarYearOverlayView
- (_TtC8HealthUI23CalendarYearOverlayView)initWithCoder:(id)a3;
- (_TtC8HealthUI23CalendarYearOverlayView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
@end

@implementation CalendarYearOverlayView

- (_TtC8HealthUI23CalendarYearOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8HealthUI23CalendarYearOverlayView *)CalendarYearOverlayView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8HealthUI23CalendarYearOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s8HealthUI23CalendarYearOverlayViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)applyLayoutAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CalendarYearOverlayView();
  id v4 = a3;
  id v5 = v7.receiver;
  [(CalendarYearOverlayView *)&v7 applyLayoutAttributes:v4];
  id v6 = objc_msgSend(v5, sel_layer, v7.receiver, v7.super_class);
  objc_msgSend(v6, sel_setZPosition_, (double)(uint64_t)objc_msgSend(v4, sel_zIndex));

  objc_msgSend(v5, sel_frame);
  objc_msgSend(v5, sel_setFrame_);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8HealthUI23CalendarYearOverlayView_background));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8HealthUI23CalendarYearOverlayView_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8HealthUI23CalendarYearOverlayView_gradient));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8HealthUI23CalendarYearOverlayView_animator));
  id v3 = (char *)self + OBJC_IVAR____TtC8HealthUI23CalendarYearOverlayView_displayDate;
  sub_1E0DF0AA0((uint64_t)v3);
}

@end