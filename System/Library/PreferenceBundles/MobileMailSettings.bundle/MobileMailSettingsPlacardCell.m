@interface MobileMailSettingsPlacardCell
- (_TtC18MobileMailSettings29MobileMailSettingsPlacardCell)initWithCoder:(id)a3;
- (_TtC18MobileMailSettings29MobileMailSettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC18MobileMailSettings29MobileMailSettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation MobileMailSettingsPlacardCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  MobileMailSettingsPlacardCell.refreshCellContents(with:)((uint64_t)a3);
}

- (_TtC18MobileMailSettings29MobileMailSettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v5 = a4;
  id v6 = a5;
  if (a4)
  {
    uint64_t v9 = sub_24910();
    uint64_t v10 = v7;

    uint64_t v11 = v9;
    uint64_t v12 = v10;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  return (_TtC18MobileMailSettings29MobileMailSettingsPlacardCell *)MobileMailSettingsPlacardCell.init(style:reuseIdentifier:specifier:)(a3, v11, v12, a5);
}

- (_TtC18MobileMailSettings29MobileMailSettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v4 = a4;
  if (a4)
  {
    uint64_t v7 = sub_24910();
    uint64_t v8 = v5;

    uint64_t v9 = v7;
    uint64_t v10 = v8;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  return (_TtC18MobileMailSettings29MobileMailSettingsPlacardCell *)MobileMailSettingsPlacardCell.init(style:reuseIdentifier:)(a3, v9, v10);
}

- (_TtC18MobileMailSettings29MobileMailSettingsPlacardCell)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC18MobileMailSettings29MobileMailSettingsPlacardCell *)MobileMailSettingsPlacardCell.init(coder:)(a3);
}

@end