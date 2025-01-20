@interface DDSearchResultManageDictionariesResult
- (DDSearchResultManageDictionariesResult)initWithQuery:(id)a3 queryId:(unint64_t)a4;
@end

@implementation DDSearchResultManageDictionariesResult

- (DDSearchResultManageDictionariesResult)initWithQuery:(id)a3 queryId:(unint64_t)a4
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v19 = a4;
  v4 = v21;
  v21 = 0;
  v18.receiver = v4;
  v18.super_class = (Class)DDSearchResultManageDictionariesResult;
  v21 = [(DDSearchResultSearchWebResult *)&v18 initWithQuery:location[0] queryId:a4];
  objc_storeStrong((id *)&v21, v21);
  if (v21)
  {
    [(DDSearchResultSearchWebResult *)v21 setMainIdentifier:@"manage_dictionaries"];
    id v17 = (id)objc_opt_new();
    [v17 setShouldUseCompactDisplay:1];
    id v16 = (id)objc_opt_new();
    [v16 setBundleIdentifier:@"com.apple.Preferences"];
    [v17 setThumbnail:v16];
    id v8 = (id)DDLocalizedString();
    v7 = +[SFRichText textWithString:](SFRichText, "textWithString:");
    [v17 setTitle:];

    id v15 = (id)objc_opt_new();
    v10 = +[NSURL URLWithString:@"prefs:root=General&path=DICTIONARY"];
    v9 = +[SFPunchout punchoutWithURL:"punchoutWithURL:"];
    [v15 setPunchout:];

    [v17 setCommand:v15];
    id v11 = (id)objc_opt_new();
    -[DDSearchResultManageDictionariesResult setInlineCard:](v21, "setInlineCard:");

    id v22 = v17;
    v13 = +[NSArray arrayWithObjects:&v22 count:1];
    id v12 = [(DDSearchResultManageDictionariesResult *)v21 inlineCard];
    [v12 setCardSections:v13];

    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
  v6 = v21;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v21, 0);
  return v6;
}

@end