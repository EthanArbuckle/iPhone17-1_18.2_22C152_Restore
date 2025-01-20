@interface RecordDataSourceCell
+ (NSString)reuseIdentifier;
- (_TtC15HealthRecordsUI20RecordDataSourceCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI20RecordDataSourceCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configCellWith:(id)a3 owner:(id)a4 dataProvider:(id)a5;
- (void)configCellWith:(id)a3 subject:(id)a4 dataProvider:(id)a5;
@end

@implementation RecordDataSourceCell

+ (NSString)reuseIdentifier
{
  v2 = (void *)sub_1C254F430();
  return (NSString *)v2;
}

- (_TtC15HealthRecordsUI20RecordDataSourceCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC15HealthRecordsUI20RecordDataSourceCell *)sub_1C2536A9C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))RecordDataSourceCell.init(style:reuseIdentifier:));
}

- (_TtC15HealthRecordsUI20RecordDataSourceCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC15HealthRecordsUI20RecordDataSourceCell_brandView;
  double v6 = *MEMORY[0x1E4F1DB20];
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  id v10 = objc_allocWithZone((Class)WDMedicalRecordBrandView);
  id v11 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v10, sel_initWithFrame_, v6, v7, v8, v9);

  result = (_TtC15HealthRecordsUI20RecordDataSourceCell *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void)configCellWith:(id)a3 owner:(id)a4 dataProvider:(id)a5
{
}

- (void)configCellWith:(id)a3 subject:(id)a4 dataProvider:(id)a5
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20RecordDataSourceCell_brandView));
}

@end