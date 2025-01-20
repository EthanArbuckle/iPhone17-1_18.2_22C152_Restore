@interface AttachmentSearchCell
- (_TtC15HealthRecordsUI20AttachmentSearchCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI20AttachmentSearchCell)initWithFrame:(CGRect)a3;
@end

@implementation AttachmentSearchCell

- (_TtC15HealthRecordsUI20AttachmentSearchCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI20AttachmentSearchCell *)AttachmentSearchCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI20AttachmentSearchCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C24EEB8C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20AttachmentSearchCell____lazy_storage___titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20AttachmentSearchCell____lazy_storage___previewLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20AttachmentSearchCell____lazy_storage___titleLabelBottomConstraint));
  swift_bridgeObjectRelease();
  sub_1C24EEC98((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI20AttachmentSearchCell_item, (uint64_t)&qword_1EA2E5330, (uint64_t)&qword_1EA2DED90, MEMORY[0x1E4F66028], (uint64_t (*)(void))sub_1C225EBC8);
}

@end