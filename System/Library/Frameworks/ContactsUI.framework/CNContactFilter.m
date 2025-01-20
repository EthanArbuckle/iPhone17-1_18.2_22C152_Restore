@interface CNContactFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)rankSortedResults;
- (BOOL)supportsSections;
- (CNContactFilter)initWithDictionaryRepresentation:(id)a3;
- (NSPredicate)predicate;
- (NSString)fullTextString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (void)setFullTextString:(id)a3;
- (void)setRankSortedResults:(BOOL)a3;
@end

@implementation CNContactFilter

- (NSString)fullTextString
{
  v3 = [(NSString *)self->_fullTextString length];
  if (v3) {
    v3 = self->_fullTextString;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [(CNContactFilter *)self fullTextString];
    if (v7 || ([v6 fullTextString], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = [(CNContactFilter *)self fullTextString];
      v9 = [v6 fullTextString];
      char v10 = [v8 isEqual:v9];

      if (v7)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      char v10 = 1;
    }

    goto LABEL_9;
  }
  char v10 = 0;
LABEL_10:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = [(CNContactFilter *)self fullTextString];
  [v4 setFullTextString:v5];

  return v4;
}

- (void)setFullTextString:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setRankSortedResults:(BOOL)a3
{
  self->_rankSortedResults = a3;
}

- (BOOL)rankSortedResults
{
  return self->_rankSortedResults;
}

- (NSPredicate)predicate
{
  v2 = [(CNContactFilter *)self fullTextString];
  if ([v2 length])
  {
    v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K BEGINSWITH[cd] %@) OR (%K BEGINSWITH[cd] %@) OR (%K BEGINSWITH[cd] %@)", *MEMORY[0x1E4F1ADF0], v2, *MEMORY[0x1E4F1ADE0], v2, *MEMORY[0x1E4F1AED8], v2];
  }
  else
  {
    v3 = 0;
  }

  return (NSPredicate *)v3;
}

- (BOOL)supportsSections
{
  v2 = [(CNContactFilter *)self fullTextString];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p> fullTextString: %@", objc_opt_class(), self, self->_fullTextString];
}

- (id)dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(CNContactFilter *)self fullTextString];
  BOOL v3 = (void *)v2;
  if (v2)
  {
    id v6 = @"CNContactFilterDictionaryKeyFullTextString";
    v7[0] = v2;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

- (CNContactFilter)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactFilter *)self init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"CNContactFilterDictionaryKeyFullTextString"];
    uint64_t v7 = [v6 copy];
    fullTextString = v5->_fullTextString;
    v5->_fullTextString = (NSString *)v7;
  }
  return v5;
}

@end