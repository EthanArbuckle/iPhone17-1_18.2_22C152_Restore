@interface LoadingTableViewCell
- (_TtC15HealthRecordsUI20LoadingTableViewCell)init;
- (_TtC15HealthRecordsUI20LoadingTableViewCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI20LoadingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation LoadingTableViewCell

- (_TtC15HealthRecordsUI20LoadingTableViewCell)init
{
  v3 = (void *)sub_1C254F430();
  v4 = [(LoadingTableViewCell *)self initWithStyle:0 reuseIdentifier:v3];

  return v4;
}

- (_TtC15HealthRecordsUI20LoadingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC15HealthRecordsUI20LoadingTableViewCell *)LoadingTableViewCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC15HealthRecordsUI20LoadingTableViewCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI20LoadingTableViewCell *)LoadingTableViewCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20LoadingTableViewCell_containerView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI20LoadingTableViewCell_spinner);
}

@end