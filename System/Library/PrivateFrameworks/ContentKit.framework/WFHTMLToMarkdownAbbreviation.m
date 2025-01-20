@interface WFHTMLToMarkdownAbbreviation
- (BOOL)isEqual:(id)a3;
- (NSString)abbreviation;
- (NSString)title;
- (unint64_t)hash;
- (void)setAbbreviation:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation WFHTMLToMarkdownAbbreviation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abbreviation, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setAbbreviation:(id)a3
{
}

- (NSString)abbreviation
{
  return self->_abbreviation;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFHTMLToMarkdownAbbreviation *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFHTMLToMarkdownAbbreviation *)self abbreviation];
      v6 = [(WFHTMLToMarkdownAbbreviation *)v4 abbreviation];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(WFHTMLToMarkdownAbbreviation *)self abbreviation];
  unint64_t v3 = [v2 hash];

  return v3;
}

@end