@interface AddAccountTableViewCell
+ (NSString)reuseIdentifier;
- (_TtC15HealthRecordsUI23AddAccountTableViewCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI23AddAccountTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)tintColorDidChange;
@end

@implementation AddAccountTableViewCell

+ (NSString)reuseIdentifier
{
  v2 = (void *)sub_1C254F430();
  return (NSString *)v2;
}

- (_TtC15HealthRecordsUI23AddAccountTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_1C254F470();
    *((unsigned char *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC15HealthRecordsUI23AddAccountTableViewCell_alignWithAccountTitle) = 0;
    v6 = (void *)sub_1C254F430();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
    *((unsigned char *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC15HealthRecordsUI23AddAccountTableViewCell_alignWithAccountTitle) = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for AddAccountTableViewCell();
  v7 = [(HRStandardTableViewCell *)&v10 initWithStyle:a3 reuseIdentifier:v6];

  v8 = v7;
  sub_1C22F5FBC();

  return v8;
}

- (_TtC15HealthRecordsUI23AddAccountTableViewCell)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI23AddAccountTableViewCell_alignWithAccountTitle) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AddAccountTableViewCell();
  id v4 = a3;
  v5 = [(HRStandardTableViewCell *)&v9 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_1C22F5FBC();
  }
  return v6;
}

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AddAccountTableViewCell();
  id v2 = v6.receiver;
  [(AddAccountTableViewCell *)&v6 tintColorDidChange];
  id v3 = objc_msgSend(v2, sel_textLabel, v6.receiver, v6.super_class);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(v2, sel_tintColor);
    objc_msgSend(v4, sel_setTextColor_, v5);

    id v2 = v4;
  }
}

@end