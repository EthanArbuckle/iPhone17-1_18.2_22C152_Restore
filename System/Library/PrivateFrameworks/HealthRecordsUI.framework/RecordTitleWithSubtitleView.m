@interface RecordTitleWithSubtitleView
- (_TtC15HealthRecordsUI27RecordTitleWithSubtitleView)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI27RecordTitleWithSubtitleView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RecordTitleWithSubtitleView

- (_TtC15HealthRecordsUI27RecordTitleWithSubtitleView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView_needsToLayoutFirstHeader) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView____lazy_storage___recordsHeadingLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView_customConstraints) = (Class)MEMORY[0x1E4FBC860];
  v8 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView_item;
  v9 = (objc_class *)type metadata accessor for RecordTitleWithSubtitleView();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[RecordTitleWithSubtitleView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1C247270C();

  return v10;
}

- (_TtC15HealthRecordsUI27RecordTitleWithSubtitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C247377C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1C2472864(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView____lazy_storage___recordsHeadingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView____lazy_storage___subtitleLabel));
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI27RecordTitleWithSubtitleView_item;
  sub_1C2227100((uint64_t)v3);
}

@end