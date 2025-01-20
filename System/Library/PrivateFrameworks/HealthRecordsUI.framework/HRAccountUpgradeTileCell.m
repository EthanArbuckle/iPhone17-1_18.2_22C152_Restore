@interface HRAccountUpgradeTileCell
+ (NSString)reuseIdentifier;
- (BOOL)hasUpgradableAccounts;
- (HRAccountUpgradeTileCell)initWithCoder:(id)a3;
- (HRAccountUpgradeTileCell)initWithProfile:(id)a3 presentingViewController:(id)a4;
- (HRAccountUpgradeTileCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)reloadDataSource;
@end

@implementation HRAccountUpgradeTileCell

+ (NSString)reuseIdentifier
{
  v2 = (void *)sub_1C254F430();
  return (NSString *)v2;
}

- (HRAccountUpgradeTileCell)initWithProfile:(id)a3 presentingViewController:(id)a4
{
  return (HRAccountUpgradeTileCell *)AccountUpgradeTileCell.init(profile:presentingViewController:)(a3, a4);
}

- (HRAccountUpgradeTileCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___HRAccountUpgradeTileCell_accounts) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___HRAccountUpgradeTileCell_cancellable) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___HRAccountUpgradeTileCell_tileView) = 0;
  id v4 = a3;

  result = (HRAccountUpgradeTileCell *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (BOOL)hasUpgradableAccounts
{
  unint64_t v2 = *(unint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___HRAccountUpgradeTileCell_accounts);
  if (v2 >> 62)
  {
    v5 = self;
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1C2550620();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v3 != 0;
}

- (void)reloadDataSource
{
  sub_1C233843C(0, (unint64_t *)&qword_1EBB6F490, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - v4;
  uint64_t v6 = sub_1C254F840();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_1C254F820();
  v7 = self;
  uint64_t v8 = sub_1C254F810();
  v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x1E4FBCFD8];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  sub_1C24D0A0C((uint64_t)v5, (uint64_t)&unk_1EA2E12F8, (uint64_t)v9);
  swift_release();
}

- (HRAccountUpgradeTileCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  result = (HRAccountUpgradeTileCell *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___HRAccountUpgradeTileCell_tileView);
}

@end