@interface RadioCategoryFilterTableCell
- (_TtC5Media28RadioCategoryFilterTableCell)initWithCoder:(id)a3;
- (_TtC5Media28RadioCategoryFilterTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)controlChangedWithSender:(id)a3;
@end

@implementation RadioCategoryFilterTableCell

- (void)controlChangedWithSender:(id)a3
{
  v3 = *(void (**)(id))((char *)&self->super.super.super.super.isa
                                 + OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_handler);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    sub_10003A42C((uint64_t)v3);
    v3([v5 selectedSegmentIndex]);
    sub_10000F940((uint64_t)v3);
  }
}

- (_TtC5Media28RadioCategoryFilterTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_segmentedControl) = 0;
    v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_handler);
    void *v6 = 0;
    v6[1] = 0;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_segmentedControl) = 0;
    v8 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_handler);
    void *v8 = 0;
    v8[1] = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for RadioCategoryFilterTableCell();
  v9 = [(RadioCategoryFilterTableCell *)&v11 initWithStyle:a3 reuseIdentifier:v7];

  return v9;
}

- (_TtC5Media28RadioCategoryFilterTableCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_segmentedControl) = 0;
  id v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_handler);
  v6 = (objc_class *)type metadata accessor for RadioCategoryFilterTableCell();
  *id v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(RadioCategoryFilterTableCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_segmentedControl));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_handler);

  sub_10000F940(v3);
}

@end