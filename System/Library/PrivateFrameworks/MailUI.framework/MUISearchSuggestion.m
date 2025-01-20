@interface MUISearchSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)exactMatch;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLegacy;
- (BOOL)supportsRanking;
- (CSSuggestion)spotlightSuggestion;
- (MUISearchSuggestion)initWithCoder:(id)a3;
- (MUISearchSuggestionCategory)category;
- (MUISearchSuggestionDelegate)delegate;
- (NSPredicate)predicate;
- (NSString)description;
- (double)ranking;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MUISearchSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MUISearchSuggestion)initWithCoder:(id)a3
{
  id v5 = a3;
  [(MUISearchSuggestion *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MUISearchSuggestion initWithCoder:]", "MUISearchSuggestion.m", 25, "0");
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [(MUISearchSuggestion *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MUISearchSuggestion encodeWithCoder:]", "MUISearchSuggestion.m", 29, "0");
}

- (MUISearchSuggestionCategory)category
{
}

- (NSPredicate)predicate
{
  return 0;
}

- (BOOL)supportsRanking
{
  return 0;
}

- (BOOL)exactMatch
{
  return 0;
}

- (double)ranking
{
  return 2.22507386e-308;
}

- (NSString)description
{
  v3 = [(MUISearchSuggestion *)self category];
  v4 = [v3 displayName];

  id v5 = [NSString stringWithFormat:@"<%@: %p> %@", objc_opt_class(), self, v4];

  return (NSString *)v5;
}

- (BOOL)isLegacy
{
  v2 = [(MUISearchSuggestion *)self category];
  char v3 = [v2 isLegacy];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [(MUISearchSuggestion *)self spotlightSuggestion];
    v7 = [v5 spotlightSuggestion];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(MUISearchSuggestion *)self spotlightSuggestion];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (CSSuggestion)spotlightSuggestion
{
  return self->_spotlightSuggestion;
}

- (MUISearchSuggestionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUISearchSuggestionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spotlightSuggestion, 0);
}

@end