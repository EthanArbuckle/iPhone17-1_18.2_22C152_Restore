@interface HRAccountHeaderCell
+ (NSString)reuseIdentifier;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HRAccountHeaderCell)initWithCoder:(id)a3;
- (HRAccountHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureWithAccount:(id)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation HRAccountHeaderCell

+ (NSString)reuseIdentifier
{
  v2 = (void *)sub_1C254F430();
  return (NSString *)v2;
}

- (HRAccountHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (HRAccountHeaderCell *)sub_1C2377110((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))AccountHeaderCell.init(style:reuseIdentifier:));
}

- (HRAccountHeaderCell)initWithCoder:(id)a3
{
  result = (HRAccountHeaderCell *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C2375B68(type metadata accessor for AccountHeaderCell, &OBJC_IVAR___HRAccountHeaderCell_paddedView);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = sub_1C2375D14(self, a3.width, a3.height, (uint64_t)a2, &OBJC_IVAR___HRAccountHeaderCell_paddedView);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutMarginsDidChange
{
}

- (void)prepareForReuse
{
  sub_1C2378474(0, &qword_1EA2DF190, (void (*)(uint64_t))type metadata accessor for AccountViewData);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v9 - v4;
  v6 = (objc_class *)type metadata accessor for AccountHeaderCell();
  v9.receiver = self;
  v9.super_class = v6;
  v7 = self;
  [(HRAccountHeaderCell *)&v9 prepareForReuse];
  uint64_t v8 = type metadata accessor for AccountViewData(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_1C22550DC((uint64_t)v5);
  sub_1C23784C8((uint64_t)v5, &qword_1EA2DF190, (void (*)(uint64_t))type metadata accessor for AccountViewData);
}

- (void)configureWithAccount:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1C2375318(a3);
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___HRAccountHeaderCell_paddedView);
}

@end