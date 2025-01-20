@interface MUIContactSuggestion
+ (id)suggestionWithTitle:(id)a3 contactEmailAddresses:(id)a4 contactIdentifier:(id)a5 spotlightSuggestion:(id)a6;
- (MUIContactSuggestion)initWithTitle:(id)a3 contactEmailAddresses:(id)a4 contactIdentifier:(id)a5 spotlightSuggestion:(id)a6;
- (NSArray)attributeValues;
- (NSArray)contactEmailAddresses;
- (NSString)contactIdentifier;
- (id)category;
- (id)spotlightSuggestion;
- (id)subtitle;
- (id)title;
@end

@implementation MUIContactSuggestion

+ (id)suggestionWithTitle:(id)a3 contactEmailAddresses:(id)a4 contactIdentifier:(id)a5 spotlightSuggestion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithTitle:v13 contactEmailAddresses:v12 contactIdentifier:v11 spotlightSuggestion:v10];

  return v14;
}

- (MUIContactSuggestion)initWithTitle:(id)a3 contactEmailAddresses:(id)a4 contactIdentifier:(id)a5 spotlightSuggestion:(id)a6
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)MUIContactSuggestion;
  v14 = [(MUIContactSuggestion *)&v25 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    title = v14->_title;
    v14->_title = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    contactEmailAddresses = v14->_contactEmailAddresses;
    v14->_contactEmailAddresses = (NSArray *)v17;

    uint64_t v19 = [v12 copy];
    contactIdentifier = v14->_contactIdentifier;
    v14->_contactIdentifier = (NSString *)v19;

    v21 = (void *)[v10 copy];
    v26[0] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    attributeValues = v14->_attributeValues;
    v14->_attributeValues = (NSArray *)v22;

    objc_storeStrong((id *)&v14->_spotlightSuggestion, a6);
  }

  return v14;
}

- (id)category
{
  return +[MUISearchSuggestionCategory contactCategory];
}

- (id)title
{
  return self->_title;
}

- (NSArray)contactEmailAddresses
{
  return self->_contactEmailAddresses;
}

- (id)spotlightSuggestion
{
  return self->_spotlightSuggestion;
}

- (id)subtitle
{
  return 0;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSArray)attributeValues
{
  return self->_attributeValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeValues, 0);
  objc_storeStrong((id *)&self->_spotlightSuggestion, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_contactEmailAddresses, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end