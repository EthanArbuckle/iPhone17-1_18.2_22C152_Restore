@interface CNUIFamilyMemberContactItem
+ (id)familyMemberContactItemFromCoreFamilyMemberContactItem:(id)a3;
+ (id)typeLabelStringFromContactType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnreachable;
- (CNUIFamilyMemberContactItem)init;
- (CNUIFamilyMemberContactItem)initWithContactIdentifier:(id)a3 label:(id)a4 detailLabel:(id)a5 unreachable:(BOOL)a6;
- (CNUIFamilyMemberContactItem)initWithLabel:(id)a3;
- (CNUIFamilyMemberContactItem)initWithLabel:(id)a3 detailLabel:(id)a4 unreachable:(BOOL)a5;
- (NSString)contactIdentifier;
- (NSString)detailLabel;
- (NSString)label;
- (unint64_t)hash;
@end

@implementation CNUIFamilyMemberContactItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (BOOL)isUnreachable
{
  return self->_unreachable;
}

- (NSString)detailLabel
{
  return self->_detailLabel;
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x1E4F5A418];
  v4 = [(CNUIFamilyMemberContactItem *)self contactIdentifier];
  uint64_t v5 = [v3 objectHash:v4];

  v6 = (void *)MEMORY[0x1E4F5A418];
  v7 = [(CNUIFamilyMemberContactItem *)self label];
  uint64_t v8 = [v6 objectHash:v7] - v5 + 32 * v5;

  v9 = (void *)MEMORY[0x1E4F5A418];
  v10 = [(CNUIFamilyMemberContactItem *)self detailLabel];
  uint64_t v11 = 31 * ([v9 objectHash:v10] - v8 + 32 * v8);

  return v11 + [(CNUIFamilyMemberContactItem *)self isUnreachable] + 15699857;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CNUIFamilyMemberContactItem *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((unint64_t v5 = (unint64_t)[(CNUIFamilyMemberContactItem *)self contactIdentifier],
           unint64_t v6 = (unint64_t)[(CNUIFamilyMemberContactItem *)v4 contactIdentifier],
           !(v5 | v6))
       || [(id)v5 isEqual:v6])
      && ((unint64_t v7 = (unint64_t)[(CNUIFamilyMemberContactItem *)self label],
           unint64_t v8 = (unint64_t)[(CNUIFamilyMemberContactItem *)v4 label],
           !(v7 | v8))
       || [(id)v7 isEqual:v8])
      && ((unint64_t v9 = (unint64_t)[(CNUIFamilyMemberContactItem *)self detailLabel],
           unint64_t v10 = (unint64_t)[(CNUIFamilyMemberContactItem *)v4 detailLabel],
           !(v9 | v10))
       || [(id)v9 isEqual:v10]))
    {
      BOOL v11 = [(CNUIFamilyMemberContactItem *)self isUnreachable];
      BOOL v12 = v11 ^ [(CNUIFamilyMemberContactItem *)v4 isUnreachable] ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

- (CNUIFamilyMemberContactItem)initWithContactIdentifier:(id)a3 label:(id)a4 detailLabel:(id)a5 unreachable:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNUIFamilyMemberContactItem;
  v14 = [(CNUIFamilyMemberContactItem *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_contactIdentifier, a3);
    objc_storeStrong((id *)&v15->_label, a4);
    objc_storeStrong((id *)&v15->_detailLabel, a5);
    v15->_unreachable = a6;
    v16 = v15;
  }

  return v15;
}

- (CNUIFamilyMemberContactItem)initWithLabel:(id)a3 detailLabel:(id)a4 unreachable:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 UUID];
  id v12 = [v11 UUIDString];
  id v13 = [(CNUIFamilyMemberContactItem *)self initWithContactIdentifier:v12 label:v10 detailLabel:v9 unreachable:v5];

  return v13;
}

- (CNUIFamilyMemberContactItem)initWithLabel:(id)a3
{
  return [(CNUIFamilyMemberContactItem *)self initWithLabel:a3 detailLabel:0 unreachable:0];
}

- (CNUIFamilyMemberContactItem)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)typeLabelStringFromContactType:(int64_t)a3
{
  if (a3 == 2)
  {
    id v3 = CNContactsUIBundle();
    v4 = v3;
    BOOL v5 = @"ME";
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    id v3 = CNContactsUIBundle();
    v4 = v3;
    BOOL v5 = @"PARENT_OR_GUARDIAN";
LABEL_5:
    unint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_1ED8AC728 table:@"Localized"];

    goto LABEL_7;
  }
  unint64_t v6 = 0;
LABEL_7:

  return v6;
}

+ (id)familyMemberContactItemFromCoreFamilyMemberContactItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_msgSend((id)objc_opt_class(), "typeLabelStringFromContactType:", objc_msgSend(v4, "contactType"));
  id v6 = objc_alloc((Class)a1);
  unint64_t v7 = [v4 contactIdentifier];
  unint64_t v8 = [v4 formattedName];
  uint64_t v9 = [v4 isUnreachable];

  id v10 = (void *)[v6 initWithContactIdentifier:v7 label:v8 detailLabel:v5 unreachable:v9];

  return v10;
}

@end