@interface CNPropertyGroupNoteItem
- (BOOL)canRemove;
- (BOOL)isEquivalentToItem:(id)a3 whenEditing:(BOOL)a4;
- (id)displayLabel;
@end

@implementation CNPropertyGroupNoteItem

- (BOOL)canRemove
{
  return 0;
}

- (id)displayLabel
{
  v3 = CNContactsUIBundle();
  v4 = (void *)MEMORY[0x1E4F1B8F8];
  v5 = [(CNPropertyGroupItem *)self property];
  v6 = [v4 localizedStringForKey:v5];
  v7 = [v3 localizedStringForKey:@"NOTES_LABEL" value:v6 table:@"Localized"];

  return v7;
}

- (BOOL)isEquivalentToItem:(id)a3 whenEditing:(BOOL)a4
{
  id v5 = a3;
  v6 = [(CNPropertyGroupItem *)self labeledValue];
  v7 = [v6 value];

  v8 = [v5 labeledValue];

  v9 = [v8 value];

  if ([v7 length] && objc_msgSend(v9, "length")) {
    char v10 = [v7 isEqualToString:v9];
  }
  else {
    char v10 = 1;
  }

  return v10;
}

@end