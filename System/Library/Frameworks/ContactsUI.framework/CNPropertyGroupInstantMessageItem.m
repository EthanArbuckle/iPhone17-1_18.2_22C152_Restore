@interface CNPropertyGroupInstantMessageItem
+ (id)emptyValueForLabel:(id)a3;
- (BOOL)isEquivalentToItem:(id)a3;
- (CNInstantMessageAddress)imAddress;
- (id)defaultActionURL;
- (id)displayLabel;
- (id)displayStringForValue:(id)a3;
- (id)editingStringValue;
- (id)valueForDisplayString:(id)a3;
@end

@implementation CNPropertyGroupInstantMessageItem

- (BOOL)isEquivalentToItem:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CNPropertyGroupInstantMessageItem;
  if ([(CNPropertyGroupItem *)&v17 isEquivalentToItem:v4])
  {
    char v5 = 1;
  }
  else
  {
    v6 = [(CNPropertyGroupItem *)self contact];
    v7 = [v4 contact];

    if (v6 == v7)
    {
      char v5 = 0;
    }
    else
    {
      v8 = [(CNPropertyGroupInstantMessageItem *)self imAddress];
      v9 = [v8 service];

      v10 = [v4 imAddress];
      v11 = [v10 service];

      char v5 = 0;
      if (v9 && v11)
      {
        if ([v9 isEqualToString:v11])
        {
          v12 = [(CNPropertyGroupInstantMessageItem *)self imAddress];
          v13 = [v12 username];

          v14 = [v4 imAddress];
          v15 = [v14 username];

          char v5 = [v13 isEqualToString:v15];
        }
        else
        {
          char v5 = 0;
        }
      }
    }
  }

  return v5;
}

- (id)editingStringValue
{
  v2 = [(CNPropertyGroupInstantMessageItem *)self imAddress];
  v3 = [v2 username];

  return v3;
}

- (id)valueForDisplayString:(id)a3
{
  id v4 = a3;
  char v5 = [(CNPropertyGroupInstantMessageItem *)self imAddress];
  v6 = (void *)[v5 mutableCopy];

  [v6 setUsername:v4];

  return v6;
}

- (id)displayStringForValue:(id)a3
{
  return (id)[a3 username];
}

- (id)displayLabel
{
  uint64_t v3 = *MEMORY[0x1E4F5A298];
  id v4 = [(CNPropertyGroupInstantMessageItem *)self imAddress];
  char v5 = [v4 service];
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v5);

  if (v3)
  {
    v6 = (void *)MEMORY[0x1E4F1B8F8];
    v7 = [(CNPropertyGroupItem *)self property];
    v8 = [v6 localizedStringForKey:v7];
  }
  else
  {
    v9 = NSString;
    v10 = [(CNPropertyGroupInstantMessageItem *)self imAddress];
    v11 = [v10 service];
    v7 = [v9 stringWithFormat:@"%@ IM_SERVICE_NAME", v11];

    v12 = CNContactsUIBundle();
    v13 = [(CNPropertyGroupInstantMessageItem *)self imAddress];
    v14 = [v13 service];
    v8 = [v12 localizedStringForKey:v7 value:v14 table:@"Localized"];
  }

  return v8;
}

- (id)defaultActionURL
{
  uint64_t v3 = [(CNPropertyGroupInstantMessageItem *)self imAddress];
  id v4 = [v3 service];

  char v5 = [(CNPropertyGroupInstantMessageItem *)self imAddress];
  v6 = [v5 username];

  v7 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
  v8 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v7];

  if ([v4 compare:*MEMORY[0x1E4F1B010] options:1])
  {
    if ([v4 compare:*MEMORY[0x1E4F1B030] options:1])
    {
      v9 = 0;
LABEL_13:
      v10 = 0;
      goto LABEL_14;
    }
    unint64_t v11 = [v6 length];
    if (v11 <= [@"chat.facebook.com" length])
    {
      v13 = 0;
    }
    else
    {
      v12 = [v6 substringFromIndex:objc_msgSend(v6, "length") - objc_msgSend(@"chat.facebook.com", "length")];
      v13 = v12;
      if (v12 && [v12 isEqualToString:@"chat.facebook.com"])
      {
        uint64_t v14 = [v8 substringToIndex:objc_msgSend(@"chat.facebook.com", "length") - objc_msgSend(@"%40", "length")];

        v9 = [NSString stringWithFormat:@"https://m.facebook.com/compose_message?uid=%@", v14];
        v8 = (void *)v14;
        goto LABEL_12;
      }
    }
    v9 = 0;
LABEL_12:

    if (!v9) {
      goto LABEL_13;
    }
    goto LABEL_5;
  }
  v9 = [NSString stringWithFormat:@"https://m.facebook.com/compose_message?uid=%@", v8];
  if (!v9) {
    goto LABEL_13;
  }
LABEL_5:
  v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
LABEL_14:
  id v15 = v10;

  return v15;
}

- (CNInstantMessageAddress)imAddress
{
  v2 = [(CNPropertyGroupItem *)self labeledValue];
  uint64_t v3 = [v2 value];

  return (CNInstantMessageAddress *)v3;
}

+ (id)emptyValueForLabel:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1BA18];
  id v4 = a3;
  char v5 = (void *)[[v3 alloc] initWithUsername:&stru_1ED8AC728 service:v4];

  return v5;
}

@end