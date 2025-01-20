@interface DDSearchResultFooterSection
- (DDSearchResultFooterSection)initWithQuery:(id)a3 queryId:(unint64_t)a4;
- (id)results;
@end

@implementation DDSearchResultFooterSection

- (DDSearchResultFooterSection)initWithQuery:(id)a3 queryId:(unint64_t)a4
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v17 = a4;
  v4 = v19;
  v19 = 0;
  v16.receiver = v4;
  v16.super_class = (Class)DDSearchResultFooterSection;
  v19 = [(DDSearchResultFooterSection *)&v16 init];
  objc_storeStrong((id *)&v19, v19);
  if (v19)
  {
    [(DDSearchResultFooterSection *)v19 setTitle:@" "];
    [(DDSearchResultFooterSection *)v19 setBundleIdentifier:@"com.apple.lookup.search-through"];
    id v15 = +[NSMutableArray array];
    id v12 = +[MCProfileConnection sharedConnection];
    BOOL v13 = [v12 effectiveBoolValueForSetting:MCFeatureSafariAllowed] == 2;

    if (!v13)
    {
      v5 = [DDSearchResultSearchWebResult alloc];
      v11 = [(DDSearchResultSearchWebResult *)v5 initWithQuery:location[0] queryId:v17];
      [v15 addObject:];
    }
    id v9 = v15;
    v6 = [DDSearchResultManageDictionariesResult alloc];
    v10 = [(DDSearchResultManageDictionariesResult *)v6 initWithQuery:location[0] queryId:v17];
    [v9 addObject:];

    objc_storeStrong((id *)&v19->_results, v15);
    objc_storeStrong(&v15, 0);
  }
  v8 = v19;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v19, 0);
  return v8;
}

- (id)results
{
  return self->_results;
}

- (void).cxx_destruct
{
}

@end