@interface CNiOSABGroupsWithMembersPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)includeAllParentGroups;
- (CNiOSABGroupsWithMembersPredicate)initWithCoder:(id)a3;
- (CNiOSABGroupsWithMembersPredicate)initWithContact:(id)a3 includeAllParentGroups:(BOOL)a4;
- (CNiOSABGroupsWithMembersPredicate)initWithGroup:(id)a3 includeAllParentGroups:(BOOL)a4;
- (NSArray)recordIdentifiers;
- (__CFArray)cn_copyGroupsInAddressBook:(void *)a3 error:(__CFError *)a4;
- (unsigned)recordType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABGroupsWithMembersPredicate

- (CNiOSABGroupsWithMembersPredicate)initWithGroup:(id)a3 includeAllParentGroups:(BOOL)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6
    && (v13.receiver = self,
        v13.super_class = (Class)CNiOSABGroupsWithMembersPredicate,
        v7 = [(CNPredicate *)&v13 initWithPredicate:0],
        (self = v7) != 0))
  {
    v7->_recordType = 1;
    v8 = [v6 identifier];
    v14[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    recordIdentifiers = self->_recordIdentifiers;
    self->_recordIdentifiers = v9;

    self->_includeAllParentGroups = a4;
    self = self;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (CNiOSABGroupsWithMembersPredicate)initWithContact:(id)a3 includeAllParentGroups:(BOOL)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6
    && (v12.receiver = self,
        v12.super_class = (Class)CNiOSABGroupsWithMembersPredicate,
        (self = [(CNPredicate *)&v12 initWithPredicate:0]) != 0))
  {
    if ([v6 isUnified])
    {
      [v6 linkedContacts];
    }
    else
    {
      v13[0] = v6;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v8 = };
    objc_msgSend(v8, "_cn_map:", &__block_literal_global_35);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    self->_recordType = 0;
    recordIdentifiers = self->_recordIdentifiers;
    self->_recordIdentifiers = v9;

    self->_includeAllParentGroups = a4;
    self = self;

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __76__CNiOSABGroupsWithMembersPredicate_initWithContact_includeAllParentGroups___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABGroupsWithMembersPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNiOSABGroupsWithMembersPredicate;
  v5 = [(CNPredicate *)&v15 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_recordIdentifiers"];
    uint64_t v10 = [v9 copy];
    recordIdentifiers = v5->_recordIdentifiers;
    v5->_recordIdentifiers = (NSArray *)v10;

    unsigned int v12 = [v4 decodeIntegerForKey:@"_recordType"];
    objc_super v13 = 0;
    v5->_recordType = v12;
    if (v12 <= 1)
    {
      v5->_includeAllParentGroups = [v4 decodeBoolForKey:@"_includeAllParentGroups"];
      objc_super v13 = v5;
    }
  }
  else
  {
    objc_super v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABGroupsWithMembersPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_recordIdentifiers, @"_recordIdentifiers", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_includeAllParentGroups forKey:@"_includeAllParentGroups"];
  [v4 encodeInteger:self->_recordType forKey:@"_recordType"];
}

- (__CFArray)cn_copyGroupsInAddressBook:(void *)a3 error:(__CFError *)a4
{
  [(CNiOSABGroupsWithMembersPredicate *)self recordType];
  [(CNiOSABGroupsWithMembersPredicate *)self includeAllParentGroups];
  objc_super v5 = [(CNiOSABGroupsWithMembersPredicate *)self recordIdentifiers];
  id v6 = (__CFArray *)ABGroupCopyArrayOfAllGroupsWithMembersOfTypeWithUUIDs();

  return v6;
}

- (NSArray)recordIdentifiers
{
  return self->_recordIdentifiers;
}

- (unsigned)recordType
{
  return self->_recordType;
}

- (BOOL)includeAllParentGroups
{
  return self->_includeAllParentGroups;
}

- (void).cxx_destruct
{
}

@end