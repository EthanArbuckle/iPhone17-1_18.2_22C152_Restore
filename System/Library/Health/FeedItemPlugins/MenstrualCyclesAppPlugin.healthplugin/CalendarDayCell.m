@interface CalendarDayCell
- (BOOL)axDayShowsDayIndicator;
- (NSString)axDayLocalizedText;
- (_TtC24MenstrualCyclesAppPlugin15CalendarDayCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin15CalendarDayCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
@end

@implementation CalendarDayCell

- (_TtC24MenstrualCyclesAppPlugin15CalendarDayCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin15CalendarDayCell *)sub_2415CD364(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2415CD698(v4);
}

- (_TtC24MenstrualCyclesAppPlugin15CalendarDayCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2415CE104();
}

- (BOOL)axDayShowsDayIndicator
{
  return (*(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.__layeringSceneIdentity
                                    + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CalendarDayCell_day) != 0) & *((unsigned char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CalendarDayCell_day);
}

- (NSString)axDayLocalizedText
{
  if (*(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CalendarDayCell_day))
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  v2 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void).cxx_destruct
{
  sub_2415CE0C0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CalendarDayCell_day), *(void *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CalendarDayCell_day), *(uint64_t *)((char *)&self->super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CalendarDayCell_day));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CalendarDayCell_dayLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CalendarDayCell_menstruationIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CalendarDayCell_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CalendarDayCell_dayLabelHeight));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CalendarDayCell_dayLabelWidth));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15CalendarDayCell_dayLabelBaseline);
}

@end