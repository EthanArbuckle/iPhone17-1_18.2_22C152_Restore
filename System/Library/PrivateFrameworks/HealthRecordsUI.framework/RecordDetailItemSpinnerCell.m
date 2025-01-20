@interface RecordDetailItemSpinnerCell
+ (NSString)reuseIdentifier;
- (UIActivityIndicatorView)spinner;
- (UILabel)bodyLabel;
- (UILabel)titleLabel;
- (_TtC15HealthRecordsUI27RecordDetailItemSpinnerCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI27RecordDetailItemSpinnerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation RecordDetailItemSpinnerCell

+ (NSString)reuseIdentifier
{
  v2 = (void *)sub_1C254F430();
  return (NSString *)v2;
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC15HealthRecordsUI27RecordDetailItemSpinnerCell_titleLabel));
}

- (UILabel)bodyLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC15HealthRecordsUI27RecordDetailItemSpinnerCell_bodyLabel));
}

- (UIActivityIndicatorView)spinner
{
  return (UIActivityIndicatorView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                            + OBJC_IVAR____TtC15HealthRecordsUI27RecordDetailItemSpinnerCell_spinner));
}

- (_TtC15HealthRecordsUI27RecordDetailItemSpinnerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC15HealthRecordsUI27RecordDetailItemSpinnerCell *)sub_1C2536A9C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))RecordDetailItemSpinnerCell.init(style:reuseIdentifier:));
}

- (_TtC15HealthRecordsUI27RecordDetailItemSpinnerCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C25377C0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI27RecordDetailItemSpinnerCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI27RecordDetailItemSpinnerCell_bodyLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI27RecordDetailItemSpinnerCell_spinner);
}

@end