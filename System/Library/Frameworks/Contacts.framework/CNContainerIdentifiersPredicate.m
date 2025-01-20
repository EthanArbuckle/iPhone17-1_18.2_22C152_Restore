@interface CNContainerIdentifiersPredicate
- (CNContainerIdentifiersPredicate)initWithIdentifiers:(id)a3;
- (NSArray)identifiers;
- (id)cn_persistenceFilterRequest;
- (id)cn_topLevelFilter;
@end

@implementation CNContainerIdentifiersPredicate

- (CNContainerIdentifiersPredicate)initWithIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier IN %@", v4];
  v11.receiver = self;
  v11.super_class = (Class)CNContainerIdentifiersPredicate;
  v6 = [(CNPredicate *)&v11 initWithPredicate:v5];
  if (v6)
  {
    uint64_t v7 = [v4 copy];
    identifiers = v6->_identifiers;
    v6->_identifiers = (NSArray *)v7;

    v9 = v6;
  }

  return v6;
}

- (id)cn_topLevelFilter
{
  v3 = [(CNContainerIdentifiersPredicate *)self identifiers];

  id v4 = (void *)MEMORY[0x1E4F28F60];
  if (v3)
  {
    v5 = [(CNContainerIdentifiersPredicate *)self identifiers];
    v6 = [v4 predicateWithFormat:@"identifier IN %@", v5];
  }
  else
  {
    v6 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  }

  return v6;
}

- (id)cn_persistenceFilterRequest
{
  return 0;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
}

@end