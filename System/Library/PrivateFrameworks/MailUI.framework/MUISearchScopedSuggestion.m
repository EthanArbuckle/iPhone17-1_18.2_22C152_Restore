@interface MUISearchScopedSuggestion
+ (BOOL)supportsSecureCoding;
+ (id)scopedSuggestion:(id)a3;
+ (id)scopedSuggestion:(id)a3 selectedScopeIndex:(unint64_t)a4;
- (MUISearchAtomSuggestion)suggestion;
- (MUISearchScopedSuggestion)initWithCoder:(id)a3;
- (MUISearchScopedSuggestion)initWithSuggestion:(id)a3;
- (MUISearchScopedSuggestion)initWithSuggestion:(id)a3 selectedScopeIndex:(unint64_t)a4;
- (MUISearchSuggestionCategoryScope)selectedScope;
- (NSPredicate)predicate;
- (id)atomImage;
- (id)atomTitle;
- (id)category;
- (id)contactIdentifier;
- (id)description;
- (id)image;
- (id)predicateWithSelectedScope:(id)a3;
- (id)subtitle;
- (id)title;
- (unint64_t)selectedScopeIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setSelectedScopeIndex:(unint64_t)a3;
@end

@implementation MUISearchScopedSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)scopedSuggestion:(id)a3
{
  id v3 = a3;
  v4 = [[MUISearchScopedSuggestion alloc] initWithSuggestion:v3];

  return v4;
}

+ (id)scopedSuggestion:(id)a3 selectedScopeIndex:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[MUISearchScopedSuggestion alloc] initWithSuggestion:v5 selectedScopeIndex:a4];

  return v6;
}

- (MUISearchScopedSuggestion)initWithSuggestion:(id)a3
{
  return [(MUISearchScopedSuggestion *)self initWithSuggestion:a3 selectedScopeIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (MUISearchScopedSuggestion)initWithSuggestion:(id)a3 selectedScopeIndex:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUISearchScopedSuggestion;
  v8 = [(MUISearchScopedSuggestion *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_suggestion, a3);
    v9->_selectedScopeIndex = a4;
  }

  return v9;
}

- (MUISearchScopedSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestion"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedScopeIdentifier"];

  if (v6)
  {
    id v7 = [v5 category];
    uint64_t v8 = [v7 indexOfScopeWithIdentifier:v6];
  }
  else
  {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v9 = [(MUISearchScopedSuggestion *)self initWithSuggestion:v5 selectedScopeIndex:v8];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  suggestion = self->_suggestion;
  id v5 = a3;
  [v5 encodeObject:suggestion forKey:@"suggestion"];
  id v7 = [(MUISearchScopedSuggestion *)self selectedScope];
  v6 = [v7 identifier];
  [v5 encodeObject:v6 forKey:@"selectedScopeIdentifier"];
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  suggestion = self->_suggestion;
  v6 = [(MUISearchScopedSuggestion *)self selectedScope];
  id v7 = [v3 stringWithFormat:@"<%@: %p> %@ scope:%@", v4, self, suggestion, v6];

  return v7;
}

- (id)category
{
  v2 = [(MUISearchScopedSuggestion *)self suggestion];
  id v3 = [v2 category];

  return v3;
}

- (id)title
{
  v2 = [(MUISearchScopedSuggestion *)self suggestion];
  id v3 = [v2 title];

  return v3;
}

- (id)subtitle
{
  v2 = [(MUISearchScopedSuggestion *)self suggestion];
  id v3 = [v2 subtitle];

  return v3;
}

- (id)contactIdentifier
{
  v2 = [(MUISearchScopedSuggestion *)self suggestion];
  id v3 = [v2 contactIdentifier];

  return v3;
}

- (id)image
{
  v2 = [(MUISearchScopedSuggestion *)self suggestion];
  id v3 = [v2 image];

  return v3;
}

- (id)atomTitle
{
  v2 = [(MUISearchScopedSuggestion *)self suggestion];
  id v3 = [v2 atomTitle];

  return v3;
}

- (id)atomImage
{
  v2 = [(MUISearchScopedSuggestion *)self suggestion];
  id v3 = [v2 atomImage];

  return v3;
}

- (id)predicateWithSelectedScope:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MUISearchScopedSuggestion.m", 96, @"Invalid parameter not satisfying: %@", @"scope" object file lineNumber description];
  }
  v6 = [v5 predicateForSuggestion:self];

  return v6;
}

- (NSPredicate)predicate
{
  id v3 = [(MUISearchSuggestion *)self->_suggestion category];
  uint64_t v4 = [v3 scopes];

  if (v4 && self->_selectedScopeIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = objc_msgSend(v4, "objectAtIndexedSubscript:");
    id v5 = [(MUISearchAtomSuggestion *)self->_suggestion predicateWithSelectedScope:v6];
  }
  else
  {
    id v5 = [(MUISearchSuggestion *)self->_suggestion predicate];
  }

  return (NSPredicate *)v5;
}

- (MUISearchSuggestionCategoryScope)selectedScope
{
  id v3 = [(MUISearchSuggestion *)self->_suggestion category];
  uint64_t v4 = [v3 scopes];

  if ([v4 count] && self->_selectedScopeIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = objc_msgSend(v4, "objectAtIndexedSubscript:");
  }
  else
  {
    id v5 = 0;
  }

  return (MUISearchSuggestionCategoryScope *)v5;
}

- (MUISearchAtomSuggestion)suggestion
{
  return self->_suggestion;
}

- (unint64_t)selectedScopeIndex
{
  return self->_selectedScopeIndex;
}

- (void)setSelectedScopeIndex:(unint64_t)a3
{
  self->_selectedScopeIndex = a3;
}

- (void).cxx_destruct
{
}

@end