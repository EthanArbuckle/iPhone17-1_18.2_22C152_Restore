@interface CycleHistoryFilterSectionHeaderReusableView
- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView)initWithFrame:(CGRect)a3;
@end

@implementation CycleHistoryFilterSectionHeaderReusableView

- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView_sectionHeaderLabel;
  id v9 = objc_allocWithZone(MEMORY[0x263F828E0]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  v11 = (Class *)((char *)&v10->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView_sectionHeaderLabelText);
  void *v11 = 0;
  v11[1] = 0;

  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for CycleHistoryFilterSectionHeaderReusableView();
  v12 = -[CycleHistoryFilterSectionHeaderReusableView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  sub_2415E62AC();

  return v12;
}

- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView_sectionHeaderLabel;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView_sectionHeaderLabelText);
  *uint64_t v8 = 0;
  v8[1] = 0;

  result = (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView *)sub_241633038();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView_sectionHeaderLabel));

  swift_bridgeObjectRelease();
}

@end