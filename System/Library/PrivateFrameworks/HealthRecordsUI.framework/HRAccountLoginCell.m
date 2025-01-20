@interface HRAccountLoginCell
+ (NSString)reuseIdentifier;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HRAccountLoginCell)initWithCoder:(id)a3;
- (HRAccountLoginCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureWithAccount:(id)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HRAccountLoginCell

+ (NSString)reuseIdentifier
{
  v2 = (void *)sub_1C254F430();
  return (NSString *)v2;
}

- (HRAccountLoginCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (HRAccountLoginCell *)sub_1C2377110((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))AccountLoginCell.init(style:reuseIdentifier:));
}

- (HRAccountLoginCell)initWithCoder:(id)a3
{
  return (HRAccountLoginCell *)sub_1C237581C(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C2375B68(type metadata accessor for AccountLoginCell, &OBJC_IVAR___HRAccountLoginCell_accountStatusView);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = sub_1C2375D14(self, a3.width, a3.height, (uint64_t)a2, &OBJC_IVAR___HRAccountLoginCell_accountStatusView);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1C2375DE4(a3);
}

- (void)layoutMarginsDidChange
{
}

- (void)prepareForReuse
{
  sub_1C2378474(0, &qword_1EA2E1CB0, (void (*)(uint64_t))type metadata accessor for AccountStatusSummaryTileFeedItemViewData);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = (char *)&v9 - v4;
  v6 = (objc_class *)type metadata accessor for AccountLoginCell();
  v9.receiver = self;
  v9.super_class = v6;
  v7 = self;
  [(HRAccountLoginCell *)&v9 prepareForReuse];
  uint64_t v8 = type metadata accessor for AccountStatusSummaryTileFeedItemViewData();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_1C24A73C0((uint64_t)v5);
  sub_1C23784C8((uint64_t)v5, &qword_1EA2E1CB0, (void (*)(uint64_t))type metadata accessor for AccountStatusSummaryTileFeedItemViewData);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  id v5 = self;
  sub_1C2378524(a3);
}

- (void).cxx_destruct
{
}

- (void)configureWithAccount:(id)a3
{
  sub_1C2378474(0, &qword_1EA2E1CB0, (void (*)(uint64_t))type metadata accessor for AccountStatusSummaryTileFeedItemViewData);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v10 - v6;
  if (a3)
  {
    id v8 = a3;
    objc_super v9 = self;
    AccountStatusSummaryTileFeedItemViewData.init(_:)(v8, (uint64_t)v7);
    sub_1C24A73C0((uint64_t)v7);
    sub_1C23784C8((uint64_t)v7, &qword_1EA2E1CB0, (void (*)(uint64_t))type metadata accessor for AccountStatusSummaryTileFeedItemViewData);
  }
}

@end