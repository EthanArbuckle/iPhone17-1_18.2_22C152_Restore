@interface ActionButtonCell
+ (NSString)defaultReuseIdentifier;
- (BOOL)actionEnabled;
- (UIImage)icon;
- (UILabel)titleLabel;
- (_TtC15HealthRecordsUI16ActionButtonCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI16ActionButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setActionEnabled:(BOOL)a3;
- (void)setBusy:(BOOL)a3;
- (void)setIcon:(id)a3;
@end

@implementation ActionButtonCell

+ (NSString)defaultReuseIdentifier
{
  v2 = (void *)sub_1C254F430();
  return (NSString *)v2;
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_titleLabel));
}

- (UIImage)icon
{
  v2 = (id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_icon);
  swift_beginAccess();
  return (UIImage *)*v2;
}

- (void)setIcon:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1C2333D04(a3);
}

- (BOOL)actionEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_actionEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setActionEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_actionEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (_TtC15HealthRecordsUI16ActionButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1C254F470();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC15HealthRecordsUI16ActionButtonCell *)ActionButtonCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC15HealthRecordsUI16ActionButtonCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C23340AC();
}

- (void)setBusy:(BOOL)a3
{
  v4 = self;
  sub_1C23339CC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_titleLabelLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_nonBusyTitleLabelColor));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_icon);
}

@end