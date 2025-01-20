@interface CACCommandSearchResult
+ (id)searchResultWithGroup:(id)a3;
- (CACCommandSearchResult)initWithGroup:(id)a3;
- (CACSpokenCommandGroup)commandGroup;
- (NSArray)commandItems;
- (void)setCommandGroup:(id)a3;
- (void)setCommandItems:(id)a3;
@end

@implementation CACCommandSearchResult

- (CACCommandSearchResult)initWithGroup:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CACCommandSearchResult;
  v6 = [(CACCommandSearchResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_commandGroup, a3);
  }

  return v7;
}

+ (id)searchResultWithGroup:(id)a3
{
  id v3 = a3;
  v4 = [[CACCommandSearchResult alloc] initWithGroup:v3];

  return v4;
}

- (CACSpokenCommandGroup)commandGroup
{
  return self->_commandGroup;
}

- (void)setCommandGroup:(id)a3
{
}

- (NSArray)commandItems
{
  return self->_commandItems;
}

- (void)setCommandItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandItems, 0);

  objc_storeStrong((id *)&self->_commandGroup, 0);
}

@end