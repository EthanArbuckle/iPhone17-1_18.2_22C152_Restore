@interface FontAssetFontFamily
- (BOOL)isDeletable;
- (BOOL)isDownloadable;
- (id)init:(id)a3 withPostScriptNames:(id)a4 andFontFiles:(id)a5;
- (id)localizedFamilyName;
- (id)synthesizeFonts;
@end

@implementation FontAssetFontFamily

- (id)init:(id)a3 withPostScriptNames:(id)a4 andFontFiles:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 count] && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v8;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "FontAssetFontFamily init - No postscript names for %@", buf, 0xCu);
  }
  v13.receiver = self;
  v13.super_class = (Class)FontAssetFontFamily;
  id v11 = [(UserInstalledFontFamily *)&v13 init:v8 withPostScriptNames:v9 andFontFiles:v10];

  return v11;
}

- (BOOL)isDeletable
{
  return 1;
}

- (BOOL)isDownloadable
{
  return 0;
}

- (id)synthesizeFonts
{
  v3 = [(FontFamily *)self postScriptFontNames];
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(FontFamily *)self postScriptFontNames];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v11 = +[UIFont fontWithName:v10 size:12.0];
        if (v11) {
          [v4 addObject:v11];
        }
        else {
          NSLog(@"FontSettings: couldn't create a font \"%@\"", v10);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)localizedFamilyName
{
  v9.receiver = self;
  v9.super_class = (Class)FontAssetFontFamily;
  v3 = [(FontFamily *)&v9 localizedFamilyName];
  if (v3
    || ([(FontFamily *)self fonts],
        v4 = objc_claimAutoreleasedReturnValue(),
        id v5 = [v4 count],
        v4,
        v5))
  {
    id v6 = v3;
  }
  else
  {
    id v6 = [(FontFamily *)self familyName];
  }
  id v7 = v6;

  return v7;
}

@end