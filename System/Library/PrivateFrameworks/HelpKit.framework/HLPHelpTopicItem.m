@interface HLPHelpTopicItem
- (BOOL)categoryContainKey:(id)a3;
- (BOOL)isCopyright;
- (BOOL)isGlossary;
- (BOOL)isPassionPoints;
- (HLPHelpTopicItem)initWithDictionary:(id)a3 helpBookURL:(id)a4 serverType:(int64_t)a5;
- (NSArray)categories;
- (NSString)anchor;
- (NSString)glossaryIdentifierString;
- (NSString)hrefID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)setAnchor:(id)a3;
- (void)setCategories:(id)a3;
- (void)setGlossaryIdentifierString:(id)a3;
- (void)setHrefID:(id)a3;
@end

@implementation HLPHelpTopicItem

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HLPHelpTopicItem;
  id v4 = [(HLPHelpItem *)&v10 copyWithZone:a3];
  v5 = [(HLPHelpTopicItem *)self hrefID];
  [v4 setHrefID:v5];

  v6 = [(HLPHelpTopicItem *)self categories];
  [v4 setCategories:v6];

  v7 = [(HLPHelpTopicItem *)self anchor];
  [v4 setAnchor:v7];

  v8 = [(HLPHelpTopicItem *)self glossaryIdentifierString];
  [v4 setGlossaryIdentifierString:v8];

  return v4;
}

- (HLPHelpTopicItem)initWithDictionary:(id)a3 helpBookURL:(id)a4 serverType:(int64_t)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HLPHelpTopicItem;
  v9 = [(HLPHelpItem *)&v16 initWithDictionary:v8 helpBookURL:a4 serverType:a5];
  if (v9)
  {
    objc_super v10 = [v8 objectForKeyedSubscript:@"href"];
    v11 = [v10 componentsSeparatedByString:@"#"];
    v12 = [v11 firstObject];
    [(HLPHelpTopicItem *)v9 setHrefID:v12];

    if ([v11 count] == 2)
    {
      v13 = [v11 lastObject];
      [(HLPHelpTopicItem *)v9 setAnchor:v13];
    }
    else
    {
      [(HLPHelpTopicItem *)v9 setAnchor:0];
    }
    v14 = [v8 objectForKeyedSubscript:@"categories"];
    [(HLPHelpTopicItem *)v9 setCategories:v14];

    [(HLPHelpTopicItem *)v9 setGlossaryIdentifierString:@"aside"];
  }

  return v9;
}

- (BOOL)categoryContainKey:(id)a3
{
  id v4 = a3;
  v5 = [(HLPHelpTopicItem *)self categories];
  if ([v5 count])
  {
    v6 = [(HLPHelpTopicItem *)self categories];
    BOOL v7 = [v6 indexOfObject:v4] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isGlossary
{
  return [(HLPHelpTopicItem *)self categoryContainKey:self->_glossaryIdentifierString];
}

- (BOOL)isCopyright
{
  return [(HLPHelpTopicItem *)self categoryContainKey:@"copyright"];
}

- (BOOL)isPassionPoints
{
  return [(HLPHelpTopicItem *)self categoryContainKey:@"passionpoints"];
}

- (id)debugDescription
{
  v3 = (void *)MEMORY[0x263F089D8];
  v10.receiver = self;
  v10.super_class = (Class)HLPHelpTopicItem;
  id v4 = [(HLPHelpItem *)&v10 debugDescription];
  v5 = [v3 stringWithString:v4];

  v6 = [(HLPHelpTopicItem *)self hrefID];
  [v5 appendFormat:@"hrefID: %@\n", v6];

  BOOL v7 = [(HLPHelpTopicItem *)self anchor];
  [v5 appendFormat:@"anchor: %@\n", v7];

  id v8 = [(HLPHelpTopicItem *)self categories];
  [v5 appendFormat:@"categories: %@\n", v8];

  return v5;
}

- (NSString)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
}

- (NSString)hrefID
{
  return self->_hrefID;
}

- (void)setHrefID:(id)a3
{
}

- (NSString)glossaryIdentifierString
{
  return self->_glossaryIdentifierString;
}

- (void)setGlossaryIdentifierString:(id)a3
{
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_glossaryIdentifierString, 0);
  objc_storeStrong((id *)&self->_hrefID, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

@end