@interface CNContactCardFieldItem
+ (id)photoItem;
- (CNContactCardFieldItem)initWithDisplayLabel:(id)a3;
- (CNContactCardFieldItem)initWithGroupItem:(id)a3;
- (CNPropertyGroupItem)groupItem;
- (NSString)displayLabel;
- (NSString)displayValue;
@end

@implementation CNContactCardFieldItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayValue, 0);
  objc_storeStrong((id *)&self->_displayLabel, 0);

  objc_storeStrong((id *)&self->_groupItem, 0);
}

- (NSString)displayValue
{
  return self->_displayValue;
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (CNPropertyGroupItem)groupItem
{
  return self->_groupItem;
}

- (CNContactCardFieldItem)initWithDisplayLabel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactCardFieldItem;
  v6 = [(CNContactCardFieldItem *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayLabel, a3);
    v8 = v7;
  }

  return v7;
}

- (CNContactCardFieldItem)initWithGroupItem:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNContactCardFieldItem;
  v6 = [(CNContactCardFieldItem *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_groupItem, a3);
    uint64_t v8 = [v5 displayLabel];
    displayLabel = v7->_displayLabel;
    v7->_displayLabel = (NSString *)v8;

    uint64_t v10 = [v5 displayValue];
    displayValue = v7->_displayValue;
    v7->_displayValue = (NSString *)v10;

    v12 = v7;
  }

  return v7;
}

+ (id)photoItem
{
  v2 = [CNContactCardFieldItem alloc];
  v3 = CNContactsUIBundle();
  v4 = [v3 localizedStringForKey:@"PHOTO_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  id v5 = [(CNContactCardFieldItem *)v2 initWithDisplayLabel:v4];

  return v5;
}

@end