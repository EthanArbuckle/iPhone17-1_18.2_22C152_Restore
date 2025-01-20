@interface HRSourceTableViewCell
+ (NSString)reuseIdentifier;
- (HRSourceTableViewCell)initWithCoder:(id)a3;
- (HRSourceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation HRSourceTableViewCell

+ (NSString)reuseIdentifier
{
  v2 = (void *)sub_1C254F430();
  return (NSString *)v2;
}

- (HRSourceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_1C254F470();
    *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HRSourceTableViewCell_sourceModel) = 0;
    v6 = (void *)sub_1C254F430();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
    *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HRSourceTableViewCell_sourceModel) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SourceTableViewCell();
  v7 = [(HRStandardTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (HRSourceTableViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HRSourceTableViewCell_sourceModel) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SourceTableViewCell();
  return [(HRStandardTableViewCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end