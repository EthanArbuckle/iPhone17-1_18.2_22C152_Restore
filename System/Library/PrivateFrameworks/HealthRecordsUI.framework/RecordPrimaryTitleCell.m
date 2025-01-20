@interface RecordPrimaryTitleCell
+ (NSString)reuseIdentifier;
- (UILabel)recordDateLabel;
- (UILabel)recordTitleLabel;
- (_TtC15HealthRecordsUI22RecordPrimaryTitleCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI22RecordPrimaryTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation RecordPrimaryTitleCell

+ (NSString)reuseIdentifier
{
  v2 = (void *)sub_1C254F430();
  return (NSString *)v2;
}

- (UILabel)recordTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC15HealthRecordsUI22RecordPrimaryTitleCell_recordTitleLabel));
}

- (UILabel)recordDateLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC15HealthRecordsUI22RecordPrimaryTitleCell_recordDateLabel));
}

- (_TtC15HealthRecordsUI22RecordPrimaryTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC15HealthRecordsUI22RecordPrimaryTitleCell *)sub_1C2536A9C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))RecordPrimaryTitleCell.init(style:reuseIdentifier:));
}

- (_TtC15HealthRecordsUI22RecordPrimaryTitleCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C25374C8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI22RecordPrimaryTitleCell_recordTitleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI22RecordPrimaryTitleCell_recordDateLabel);
}

@end