@interface CNContactMultiValueDiffUpdate
- (BOOL)applyToABPerson:(void *)a3 withPropertiesContext:(id)a4 logger:(id)a5 error:(id *)a6;
- (CNContactMultiValueDiffUpdate)initWithProperty:(id)a3 diff:(id)a4;
- (CNMultiValueDiff)diff;
- (CNMultiValuePropertyDescription)property;
- (id)description;
- (void)applyToMutableContact:(id)a3 withIdentifierMap:(id)a4;
@end

@implementation CNContactMultiValueDiffUpdate

- (BOOL)applyToABPerson:(void *)a3 withPropertiesContext:(id)a4 logger:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  v12 = [(CNContactMultiValueDiffUpdate *)self diff];
  v13 = [(CNContactMultiValueDiffUpdate *)self property];
  uint64_t v14 = [v11 isUnifiedContact];

  LOBYTE(a6) = [v12 applyToABPerson:a3 propertyDescription:v13 isUnified:v14 logger:v10 error:a6];
  return (char)a6;
}

- (CNContactMultiValueDiffUpdate)initWithProperty:(id)a3 diff:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactMultiValueDiffUpdate;
  v9 = [(CNContactMultiValueDiffUpdate *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_property, a3);
    objc_storeStrong((id *)&v10->_diff, a4);
    id v11 = v10;
  }

  return v10;
}

- (void)applyToMutableContact:(id)a3 withIdentifierMap:(id)a4
{
  property = self->_property;
  id v7 = a4;
  id v8 = a3;
  v9 = [(CNPropertyDescription *)property key];
  id v12 = [v8 valueForKey:v9];

  id v10 = [(CNMultiValueDiff *)self->_diff multiValueByApplyToMultiValue:v12 withIdentifierMap:v7];

  id v11 = [(CNPropertyDescription *)self->_property key];
  [v8 setValue:v10 forKey:v11];
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E4F5A3A8], "descriptionForObject:withNamesAndObjects:", self->_property, @"diff", self->_diff, 0);
}

- (CNMultiValuePropertyDescription)property
{
  return (CNMultiValuePropertyDescription *)objc_getProperty(self, a2, 8, 1);
}

- (CNMultiValueDiff)diff
{
  return (CNMultiValueDiff *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diff, 0);

  objc_storeStrong((id *)&self->_property, 0);
}

@end