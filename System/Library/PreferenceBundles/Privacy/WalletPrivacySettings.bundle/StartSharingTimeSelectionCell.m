@interface StartSharingTimeSelectionCell
- (_TtC21WalletPrivacySettings29StartSharingTimeSelectionCell)initWithCoder:(id)a3;
- (_TtC21WalletPrivacySettings29StartSharingTimeSelectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC21WalletPrivacySettings29StartSharingTimeSelectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation StartSharingTimeSelectionCell

- (_TtC21WalletPrivacySettings29StartSharingTimeSelectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  uint64_t v7 = sub_270C8();
  uint64_t v9 = v8;
  id v10 = a5;
  sub_D4B4(a3, v7, v9, v10);
  v12 = v11;

  return v12;
}

- (_TtC21WalletPrivacySettings29StartSharingTimeSelectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_270C8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC21WalletPrivacySettings29StartSharingTimeSelectionCell *)sub_5C60(a3, (uint64_t)a4, v6);
}

- (_TtC21WalletPrivacySettings29StartSharingTimeSelectionCell)initWithCoder:(id)a3
{
  *(void *)&self->PSTableCell_opaque[OBJC_IVAR____TtC21WalletPrivacySettings29StartSharingTimeSelectionCell_menuButtonRow] = 0;

  result = (_TtC21WalletPrivacySettings29StartSharingTimeSelectionCell *)sub_27378();
  __break(1u);
  return result;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_D5D0();
}

- (void).cxx_destruct
{
}

@end