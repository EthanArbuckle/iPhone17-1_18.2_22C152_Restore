@interface CNContactCardFieldSection
- (CNContactCardFieldSection)initWithSectionType:(id)a3 items:(id)a4;
- (CNContactCardFieldSection)initWithSectionType:(id)a3 items:(id)a4 displayTitle:(id)a5;
- (NSArray)items;
- (NSString)displayTitle;
- (NSString)sectionType;
@end

@implementation CNContactCardFieldSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayTitle, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_sectionType, 0);
}

- (NSString)displayTitle
{
  return self->_displayTitle;
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)sectionType
{
  return self->_sectionType;
}

- (CNContactCardFieldSection)initWithSectionType:(id)a3 items:(id)a4 displayTitle:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNContactCardFieldSection;
  v12 = [(CNContactCardFieldSection *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sectionType, a3);
    objc_storeStrong((id *)&v13->_items, a4);
    objc_storeStrong((id *)&v13->_displayTitle, a5);
    v14 = v13;
  }

  return v13;
}

- (CNContactCardFieldSection)initWithSectionType:(id)a3 items:(id)a4
{
  return [(CNContactCardFieldSection *)self initWithSectionType:a3 items:a4 displayTitle:0];
}

@end