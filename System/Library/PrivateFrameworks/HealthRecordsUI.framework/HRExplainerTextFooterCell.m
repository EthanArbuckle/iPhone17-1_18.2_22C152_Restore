@interface HRExplainerTextFooterCell
+ (NSString)reuseIdentifier;
- (HRExplainerTextFooterCell)initWithCoder:(id)a3;
- (HRExplainerTextFooterCell)initWithReuseIdentifier:(id)a3;
- (HRExplainerTextFooterCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)content;
- (void)setContent:(id)a3;
@end

@implementation HRExplainerTextFooterCell

+ (NSString)reuseIdentifier
{
  v2 = (void *)sub_1C254F430();
  return (NSString *)v2;
}

- (NSString)content
{
  v2 = (char *)self + OBJC_IVAR___HRExplainerTextFooterCell_content;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1C254F430();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setContent:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1C254F470();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_1C23E8FD0(v4, v6);
}

- (HRExplainerTextFooterCell)initWithReuseIdentifier:(id)a3
{
  sub_1C254F470();
  uint64_t v4 = (void *)sub_1C254F430();
  swift_bridgeObjectRelease();
  uint64_t v5 = [(HRExplainerTextFooterCell *)self initWithStyle:0 reuseIdentifier:v4];

  uint64_t v6 = v5;
  sub_1C23E9308();

  return v6;
}

- (HRExplainerTextFooterCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (HRExplainerTextFooterCell *)ExplainerTextFooterCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (HRExplainerTextFooterCell)initWithCoder:(id)a3
{
  return (HRExplainerTextFooterCell *)ExplainerTextFooterCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end