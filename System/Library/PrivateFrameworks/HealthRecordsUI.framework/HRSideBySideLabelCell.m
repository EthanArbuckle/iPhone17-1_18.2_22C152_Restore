@interface HRSideBySideLabelCell
- (HRSideBySideLabelCell)initWithCoder:(id)a3;
- (HRSideBySideLabelCell)initWithReuseIdentifier:(id)a3;
- (HRSideBySideLabelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)detail;
- (NSString)title;
- (void)setDetail:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation HRSideBySideLabelCell

- (NSString)title
{
  return (NSString *)sub_1C2376514((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRSideBySideLabelCell_title);
}

- (void)setTitle:(id)a3
{
}

- (NSString)detail
{
  return (NSString *)sub_1C2376514((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRSideBySideLabelCell_detail);
}

- (void)setDetail:(id)a3
{
}

- (HRSideBySideLabelCell)initWithReuseIdentifier:(id)a3
{
  sub_1C254F470();
  v4 = (void *)sub_1C254F430();
  swift_bridgeObjectRelease();
  v5 = [(HRSideBySideLabelCell *)self initWithStyle:0 reuseIdentifier:v4];

  v6 = v5;
  sub_1C240DF9C();

  return v6;
}

- (HRSideBySideLabelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (HRSideBySideLabelCell *)SideBySideLabelCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (HRSideBySideLabelCell)initWithCoder:(id)a3
{
  return (HRSideBySideLabelCell *)SideBySideLabelCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end