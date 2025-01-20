@interface CNFullTextSearchContactPredicate
+ (BOOL)supportsSecureCoding;
- (CNFullTextSearchContactPredicate)initWithCoder:(id)a3;
- (CNFullTextSearchContactPredicate)initWithSearchString:(id)a3 containerIdentifiers:(id)a4 groupIdentifiers:(id)a5;
- (NSArray)containerIdentifiers;
- (NSArray)groupIdentifiers;
- (NSString)description;
- (NSString)searchString;
- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNFullTextSearchContactPredicate

- (CNFullTextSearchContactPredicate)initWithSearchString:(id)a3 containerIdentifiers:(id)a4 groupIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNFullTextSearchContactPredicate;
  v11 = [(CNPredicate *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    searchString = v11->_searchString;
    v11->_searchString = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    containerIdentifiers = v11->_containerIdentifiers;
    v11->_containerIdentifiers = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    groupIdentifiers = v11->_groupIdentifiers;
    v11->_groupIdentifiers = (NSArray *)v16;

    v18 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNFullTextSearchContactPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CNFullTextSearchContactPredicate;
  v5 = [(CNPredicate *)&v23 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_searchString"];
    uint64_t v7 = [v6 copy];
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v7;

    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"_containerIdentifiers"];
    uint64_t v13 = [v12 copy];
    containerIdentifiers = v5->_containerIdentifiers;
    v5->_containerIdentifiers = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v18 = [v4 decodeObjectOfClasses:v17 forKey:@"_groupIdentifiers"];
    uint64_t v19 = [v18 copy];
    groupIdentifiers = v5->_groupIdentifiers;
    v5->_groupIdentifiers = (NSArray *)v19;

    v21 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNFullTextSearchContactPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchString, @"_searchString", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_containerIdentifiers forKey:@"_containerIdentifiers"];
  [v4 encodeObject:self->_groupIdentifiers forKey:@"_groupIdentifiers"];
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsMatchingFullTextSearch:containerIdentifiers:groupIdentifiers:]"];
  objc_super v5 = [(CNFullTextSearchContactPredicate *)self searchString];
  id v6 = (id)[v3 appendName:@"searchString" object:v5];

  uint64_t v7 = [(CNFullTextSearchContactPredicate *)self containerIdentifiers];
  id v8 = (id)[v3 appendName:@"containerIdentifiers" object:v7];

  id v9 = [(CNFullTextSearchContactPredicate *)self groupIdentifiers];
  id v10 = (id)[v3 appendName:@"groupIdentifiers" object:v9];

  v11 = [v3 build];

  return (NSString *)v11;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSArray)containerIdentifiers
{
  return self->_containerIdentifiers;
}

- (NSArray)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);
  objc_storeStrong((id *)&self->_containerIdentifiers, 0);

  objc_storeStrong((id *)&self->_searchString, 0);
}

- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6
{
  id v8 = a5;
  id v9 = [(CNFullTextSearchContactPredicate *)self searchString];
  id v10 = [v8 suggestContactMatchesWithFullTextSearch:v9 limitTo:0x7FFFFFFFFFFFFFFFLL error:a6];

  return v10;
}

@end