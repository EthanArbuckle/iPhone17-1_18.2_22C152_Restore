@interface DDSearchResultSearchWebResult
- (DDSearchResultSearchWebResult)initWithQuery:(id)a3 queryId:(unint64_t)a4;
- (void)setMainIdentifier:(id)a3;
@end

@implementation DDSearchResultSearchWebResult

- (void)setMainIdentifier:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(DDSearchResultSearchWebResult *)v5 setIdentifier:location[0]];
  [(DDSearchResultSearchWebResult *)v5 setSectionBundleIdentifier:@"com.apple.lookup.search-through"];
  v3 = +[NSString stringWithFormat:@"com.apple.other:%@", location[0]];
  -[DDSearchResultSearchWebResult setResultBundleId:](v5, "setResultBundleId:");

  objc_storeStrong(location, 0);
}

- (DDSearchResultSearchWebResult)initWithQuery:(id)a3 queryId:(unint64_t)a4
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v17 = a4;
  v4 = v19;
  v19 = 0;
  v16.receiver = v4;
  v16.super_class = (Class)DDSearchResultSearchWebResult;
  v19 = [(DDSearchResultSearchWebResult *)&v16 init];
  objc_storeStrong((id *)&v19, v19);
  if (v19)
  {
    [(DDSearchResultSearchWebResult *)v19 setType:2];
    [(DDSearchResultSearchWebResult *)v19 setMainIdentifier:@"search_web"];
    [(DDSearchResultSearchWebResult *)v19 setQueryId:v17];
    id v15 = (id)objc_opt_new();
    [v15 setShouldUseCompactDisplay:1];
    id v14 = (id)objc_opt_new();
    [v14 setIconType:1];
    [v15 setThumbnail:v14];
    id v8 = (id)DDLocalizedString();
    v7 = +[SFRichText textWithString:](SFRichText, "textWithString:");
    [v15 setTitle:];

    id v13 = (id)objc_opt_new();
    [v13 setSearchString:location[0]];
    [v15 setCommand:v13];
    id v9 = (id)objc_opt_new();
    -[DDSearchResultSearchWebResult setInlineCard:](v19, "setInlineCard:");

    id v20 = v15;
    v11 = +[NSArray arrayWithObjects:&v20 count:1];
    id v10 = [(DDSearchResultSearchWebResult *)v19 inlineCard];
    [v10 setCardSections:v11];

    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  v6 = v19;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v19, 0);
  return v6;
}

@end