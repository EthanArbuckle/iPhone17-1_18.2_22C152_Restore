@interface RecordCell
- (_TtC15HealthRecordsUI10RecordCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI10RecordCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
@end

@implementation RecordCell

- (_TtC15HealthRecordsUI10RecordCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI10RecordCell *)sub_1C23015F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI10RecordCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI10RecordCell *)sub_1C23017B0(a3);
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RecordCell();
  id v2 = v3.receiver;
  [(RecordCell *)&v3 awakeFromNib];
  sub_1C2301998();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10RecordCell_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10RecordCell_rangeValueView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10RecordCell_multiValueView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10RecordCell____lazy_storage___subtitleLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10RecordCell_subtitleToBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10RecordCell_rangeValueViewToBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10RecordCell_multiValueViewToBottomConstraint));
  sub_1C229B07C((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI10RecordCell_item, (unint64_t *)&qword_1EA2E5330, (unint64_t *)&qword_1EA2DED90);
}

@end