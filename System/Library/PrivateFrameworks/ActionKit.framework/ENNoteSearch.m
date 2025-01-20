@interface ENNoteSearch
+ (id)noteSearchCreatedByThisApplication;
+ (id)noteSearchWithSearchString:(id)a3;
- (ENNoteSearch)init;
- (ENNoteSearch)initWithSearchString:(id)a3;
- (NSString)searchString;
- (void)setSearchString:(id)a3;
@end

@implementation ENNoteSearch

- (void).cxx_destruct
{
}

- (void)setSearchString:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (ENNoteSearch)initWithSearchString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)ENNoteSearch;
    v5 = [(ENNoteSearch *)&v9 init];
    if (v5)
    {
      v6 = (void *)[v4 copy];
      [(ENNoteSearch *)v5 setSearchString:v6];
    }
    self = v5;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (ENNoteSearch)init
{
  return [(ENNoteSearch *)self initWithSearchString:&stru_26F008428];
}

+ (id)noteSearchCreatedByThisApplication
{
  v2 = NSString;
  v3 = +[ENSession sharedSession];
  id v4 = [v3 sourceApplication];
  v5 = [v2 stringWithFormat:@"sourceApplication:%@", v4];

  v6 = [[ENNoteSearch alloc] initWithSearchString:v5];
  return v6;
}

+ (id)noteSearchWithSearchString:(id)a3
{
  id v3 = a3;
  id v4 = [[ENNoteSearch alloc] initWithSearchString:v3];

  return v4;
}

@end