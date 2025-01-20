@interface DDSearchResultDictionarySection
- (DDSearchResultDictionarySection)initWithSearchString:(id)a3 queryId:(unint64_t)a4;
@end

@implementation DDSearchResultDictionarySection

- (DDSearchResultDictionarySection)initWithSearchString:(id)a3 queryId:(unint64_t)a4
{
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v20 = a4;
  id v4 = v22;
  id v22 = 0;
  v19.receiver = v4;
  v19.super_class = (Class)DDSearchResultDictionarySection;
  v14 = [(DDSearchResultDictionarySection *)&v19 init];
  id v22 = v14;
  objc_storeStrong(&v22, v14);
  if (v14)
  {
    id v10 = (id)DDLocalizedString();
    [v22 setTitle:];

    [v22 setBundleIdentifier:@"com.apple.lookup.dictionary"];
    id v24 = (id)DCSSearchFoundationCopyResults();
    id v17 = v24;
    memset(__b, 0, sizeof(__b));
    id obj = v17;
    id v12 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
    if (v12)
    {
      uint64_t v7 = *(void *)__b[2];
      uint64_t v8 = 0;
      id v9 = v12;
      while (1)
      {
        uint64_t v6 = v8;
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(id *)(__b[1] + 8 * v8);
        [v16 setQueryId:v20];
        ++v8;
        if (v6 + 1 >= (unint64_t)v9)
        {
          uint64_t v8 = 0;
          id v9 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
          if (!v9) {
            break;
          }
        }
      }
    }

    [v22 setResults:v17];
    v23 = (DDSearchResultDictionarySection *)v22;
    int v18 = 1;
    objc_storeStrong(&v17, 0);
  }
  else
  {
    v23 = 0;
    int v18 = 1;
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v22, 0);
  return v23;
}

@end