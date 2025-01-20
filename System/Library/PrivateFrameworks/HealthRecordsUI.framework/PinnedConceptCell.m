@interface PinnedConceptCell
- (_TtC15HealthRecordsUI17PinnedConceptCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI17PinnedConceptCell)initWithFrame:(CGRect)a3;
@end

@implementation PinnedConceptCell

- (_TtC15HealthRecordsUI17PinnedConceptCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI17PinnedConceptCell____lazy_storage___accessoryImageView) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PinnedConceptCell();
  return -[ListCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15HealthRecordsUI17PinnedConceptCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI17PinnedConceptCell____lazy_storage___accessoryImageView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PinnedConceptCell();
  return [(ListCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI17PinnedConceptCell____lazy_storage___accessoryImageView));
}

@end