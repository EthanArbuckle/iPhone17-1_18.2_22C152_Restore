@interface CNUIFamilyMemberDowntimeContactItem
- (BOOL)selected;
- (CNContact)contact;
- (CNUIFamilyMemberDowntimeContactItem)initWithContact:(id)a3 label:(id)a4;
- (NSString)label;
- (void)setSelected:(BOOL)a3;
@end

@implementation CNUIFamilyMemberDowntimeContactItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (NSString)label
{
  return self->_label;
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNUIFamilyMemberDowntimeContactItem)initWithContact:(id)a3 label:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNUIFamilyMemberDowntimeContactItem;
  v9 = [(CNUIFamilyMemberDowntimeContactItem *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    objc_storeStrong((id *)&v10->_label, a4);
    v11 = v10;
  }

  return v10;
}

@end