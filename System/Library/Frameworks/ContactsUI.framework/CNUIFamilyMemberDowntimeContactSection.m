@interface CNUIFamilyMemberDowntimeContactSection
- (CNUIFamilyMemberDowntimeContactSection)initWithContactItems:(id)a3 title:(id)a4;
- (NSArray)contactItems;
- (NSString)title;
@end

@implementation CNUIFamilyMemberDowntimeContactSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_contactItems, 0);
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)contactItems
{
  return self->_contactItems;
}

- (CNUIFamilyMemberDowntimeContactSection)initWithContactItems:(id)a3 title:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNUIFamilyMemberDowntimeContactSection;
  v9 = [(CNUIFamilyMemberDowntimeContactSection *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactItems, a3);
    uint64_t v11 = [v8 copy];
    title = v10->_title;
    v10->_title = (NSString *)v11;

    v13 = v10;
  }

  return v10;
}

@end