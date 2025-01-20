@interface _CNAutocompleteAggregateSourceInclusionPolicy
- (BOOL)includeCalendarServers;
- (BOOL)includeContacts;
- (BOOL)includeDirectoryServers;
- (BOOL)includeLocalExtensions;
- (BOOL)includePredictions;
- (BOOL)includeRecents;
- (BOOL)includeStewie;
- (BOOL)includeSuggestions;
- (BOOL)includeSupplementalResults;
- (NSArray)policies;
- (_CNAutocompleteAggregateSourceInclusionPolicy)initWithPolicies:(id)a3;
@end

@implementation _CNAutocompleteAggregateSourceInclusionPolicy

- (_CNAutocompleteAggregateSourceInclusionPolicy)initWithPolicies:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNAutocompleteAggregateSourceInclusionPolicy;
  v5 = [(_CNAutocompleteAggregateSourceInclusionPolicy *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    policies = v5->_policies;
    v5->_policies = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)includeContacts
{
  v2 = [(_CNAutocompleteAggregateSourceInclusionPolicy *)self policies];
  char v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_27);

  return v3;
}

- (BOOL)includeRecents
{
  v2 = [(_CNAutocompleteAggregateSourceInclusionPolicy *)self policies];
  char v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_135);

  return v3;
}

- (BOOL)includeStewie
{
  v2 = [(_CNAutocompleteAggregateSourceInclusionPolicy *)self policies];
  char v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_137);

  return v3;
}

- (BOOL)includeSuggestions
{
  v2 = [(_CNAutocompleteAggregateSourceInclusionPolicy *)self policies];
  char v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_139_0);

  return v3;
}

- (BOOL)includeLocalExtensions
{
  v2 = [(_CNAutocompleteAggregateSourceInclusionPolicy *)self policies];
  char v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_141);

  return v3;
}

- (BOOL)includePredictions
{
  v2 = [(_CNAutocompleteAggregateSourceInclusionPolicy *)self policies];
  char v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_143);

  return v3;
}

- (BOOL)includeDirectoryServers
{
  v2 = [(_CNAutocompleteAggregateSourceInclusionPolicy *)self policies];
  char v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_145);

  return v3;
}

- (BOOL)includeCalendarServers
{
  v2 = [(_CNAutocompleteAggregateSourceInclusionPolicy *)self policies];
  char v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_147);

  return v3;
}

- (BOOL)includeSupplementalResults
{
  v2 = [(_CNAutocompleteAggregateSourceInclusionPolicy *)self policies];
  char v3 = objc_msgSend(v2, "_cn_all:", &__block_literal_global_149);

  return v3;
}

- (NSArray)policies
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end