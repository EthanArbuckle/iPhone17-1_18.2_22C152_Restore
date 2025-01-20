@interface _CNContactVCardNameSummzarizationScope
- (CNContact)contact;
- (NSString)fullName;
- (_CNContactVCardNameSummzarizationScope)initWithContact:(id)a3 fullName:(id)a4;
@end

@implementation _CNContactVCardNameSummzarizationScope

- (_CNContactVCardNameSummzarizationScope)initWithContact:(id)a3 fullName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_CNContactVCardNameSummzarizationScope;
  v9 = [(_CNContactVCardNameSummzarizationScope *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    uint64_t v11 = [v8 copy];
    fullName = v10->_fullName;
    v10->_fullName = (NSString *)v11;

    v13 = v10;
  }

  return v10;
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullName, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end