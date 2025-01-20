@interface RecordDetailItemCell
+ (NSString)reuseIdentifier;
- (UILabel)bodyLabel;
- (UILabel)titleLabel;
- (_TtC15HealthRecordsUI20RecordDetailItemCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI20RecordDetailItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation RecordDetailItemCell

+ (NSString)reuseIdentifier
{
  v2 = (void *)sub_1C254F430();
  return (NSString *)v2;
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC15HealthRecordsUI20RecordDetailItemCell_titleLabel));
}

- (UILabel)bodyLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC15HealthRecordsUI20RecordDetailItemCell_bodyLabel));
}

- (_TtC15HealthRecordsUI20RecordDetailItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC15HealthRecordsUI20RecordDetailItemCell *)sub_1C2536A9C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))RecordDetailItemCell.init(style:reuseIdentifier:));
}

- (_TtC15HealthRecordsUI20RecordDetailItemCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C2537644();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20RecordDetailItemCell_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI20RecordDetailItemCell_bodyLabel);
}

@end