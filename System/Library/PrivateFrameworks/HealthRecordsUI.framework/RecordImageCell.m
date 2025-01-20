@interface RecordImageCell
+ (NSString)reuseIdentifier;
- (UIImageView)recordImageView;
- (_TtC15HealthRecordsUI15RecordImageCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI15RecordImageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation RecordImageCell

+ (NSString)reuseIdentifier
{
  v2 = (void *)sub_1C254F430();
  return (NSString *)v2;
}

- (UIImageView)recordImageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC15HealthRecordsUI15RecordImageCell_recordImageView));
}

- (_TtC15HealthRecordsUI15RecordImageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC15HealthRecordsUI15RecordImageCell *)sub_1C2536A9C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))RecordImageCell.init(style:reuseIdentifier:));
}

- (_TtC15HealthRecordsUI15RecordImageCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC15HealthRecordsUI15RecordImageCell_recordImageView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1838]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC15HealthRecordsUI15RecordImageCell *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI15RecordImageCell_recordImageView));
}

@end