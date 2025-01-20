@interface MUIMailboxFiltersFormatter
- (id)_stringForFilters:(id)a3;
- (id)stringForObjectValue:(id)a3;
@end

@implementation MUIMailboxFiltersFormatter

- (id)_stringForFilters:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    v4 = objc_msgSend(v3, "ef_map:", &__block_literal_global_24);
    v5 = _EFLocalizedString();
    v6 = [v4 componentsJoinedByString:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __48__MUIMailboxFiltersFormatter__stringForFilters___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "ef_all:", &__block_literal_global_4_1))
  {
    v5 = [(MUIMailboxFiltersFormatter *)self _stringForFilters:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __51__MUIMailboxFiltersFormatter_stringForObjectValue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end