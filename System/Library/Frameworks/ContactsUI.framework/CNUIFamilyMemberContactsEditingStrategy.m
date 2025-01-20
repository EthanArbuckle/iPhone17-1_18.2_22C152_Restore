@interface CNUIFamilyMemberContactsEditingStrategy
+ (CNUIFamilyMemberContactsEditingStrategy)managedContactsStrategy;
+ (CNUIFamilyMemberContactsEditingStrategy)whitelistedContactsStrategy;
- (CNUIFamilyMemberContactsEditingStrategy)initWithProhibitedPropertyKeys:(id)a3 sensitiveDataContactFilter:(id)a4;
- (NSArray)prohibitedPropertyKeys;
- (id)sensitiveDataContactFilter;
@end

@implementation CNUIFamilyMemberContactsEditingStrategy

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sensitiveDataContactFilter, 0);

  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
}

- (id)sensitiveDataContactFilter
{
  return self->_sensitiveDataContactFilter;
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (CNUIFamilyMemberContactsEditingStrategy)initWithProhibitedPropertyKeys:(id)a3 sensitiveDataContactFilter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNUIFamilyMemberContactsEditingStrategy;
  v9 = [(CNUIFamilyMemberContactsEditingStrategy *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_prohibitedPropertyKeys, a3);
    v11 = _Block_copy(v8);
    id sensitiveDataContactFilter = v10->_sensitiveDataContactFilter;
    v10->_id sensitiveDataContactFilter = v11;

    v13 = v10;
  }

  return v10;
}

+ (CNUIFamilyMemberContactsEditingStrategy)whitelistedContactsStrategy
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x1E4F5A668] propertyKeysContainingSenstiveData];
  v4 = (void *)[v2 initWithProhibitedPropertyKeys:v3 sensitiveDataContactFilter:&__block_literal_global_27];

  return (CNUIFamilyMemberContactsEditingStrategy *)v4;
}

+ (CNUIFamilyMemberContactsEditingStrategy)managedContactsStrategy
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x1E4F5A660] propertyKeysContainingSenstiveData];
  v4 = (void *)[v2 initWithProhibitedPropertyKeys:v3 sensitiveDataContactFilter:&__block_literal_global_252];

  return (CNUIFamilyMemberContactsEditingStrategy *)v4;
}

@end