@interface CKExpireDurationSelectionList
- (id)_groupSpecifier;
- (id)expireDescription;
- (id)specifiers;
- (void)_updateFooterText;
- (void)listItemSelected:(id)a3;
@end

@implementation CKExpireDurationSelectionList

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)MEMORY[0x263EFF980];
    v14.receiver = self;
    v14.super_class = (Class)CKExpireDurationSelectionList;
    v6 = [(PSListItemsController *)&v14 specifiers];
    v7 = [v5 arrayWithArray:v6];

    v8 = +[CKSettingsMessagesController currentKeepMessages];
    if ([v8 integerValue] == 30)
    {
      uint64_t v9 = 3;
      uint64_t v10 = 4;
    }
    else
    {
      if ([v8 integerValue] == 365) {
        uint64_t v10 = 4;
      }
      else {
        uint64_t v10 = 3;
      }
      uint64_t v9 = 2;
    }
    [v7 removeObjectAtIndex:v10];
    [v7 removeObjectAtIndex:v9];
    v11 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];
    v12 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v11;

    [(CKExpireDurationSelectionList *)self _updateFooterText];
    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_groupSpecifier
{
  return (id)[*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:0];
}

- (void)listItemSelected:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKExpireDurationSelectionList;
  [(PSListItemsController *)&v4 listItemSelected:a3];
  [(CKExpireDurationSelectionList *)self _updateFooterText];
}

- (void)_updateFooterText
{
  id v4 = [(CKExpireDurationSelectionList *)self expireDescription];
  uint64_t v3 = [(CKExpireDurationSelectionList *)self _groupSpecifier];
  [v3 setProperty:v4 forKey:*MEMORY[0x263F600F8]];
  [(CKExpireDurationSelectionList *)self reloadSpecifier:v3];
}

- (id)expireDescription
{
  return &stru_26D05D4F8;
}

@end