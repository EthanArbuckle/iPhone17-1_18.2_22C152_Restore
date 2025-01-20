@interface SAGKSnippet
- (BOOL)_isWikiSnippet;
- (BOOL)_sr_objects:(id)a3 matchClassOrder:(id)a4;
- (id)sr_sirilandShim;
@end

@implementation SAGKSnippet

- (BOOL)_sr_objects:(id)a3 matchClassOrder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 count];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007739C;
  v10[3] = &unk_100144598;
  id v8 = v6;
  id v11 = v8;
  v12 = v19;
  v13 = &v15;
  id v14 = v7;
  [v5 enumerateObjectsUsingBlock:v10];
  LOBYTE(v7) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);

  return (char)v7;
}

- (BOOL)_isWikiSnippet
{
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v3 = +[NSArray arrayWithObjects:v6 count:4];
  v4 = [(SAGKSnippet *)self pods];
  LOBYTE(self) = sub_100060738(v4, v3);

  return (char)self;
}

- (id)sr_sirilandShim
{
  if ([(SAGKSnippet *)self _isWikiSnippet])
  {
    id v3 = objc_alloc_init((Class)SFCard);
    v4 = [(SAGKSnippet *)self title];
    [v3 setTitle:v4];

    [v3 setType:1];
    id v5 = [(SAGKSnippet *)self aceId];
    [v3 setCardId:v5];

    [v3 setSource:2];
    id v6 = objc_alloc_init((Class)NSMutableArray);
    id v7 = [(SAGKSnippet *)self title];

    if (v7)
    {
      id v8 = objc_alloc_init((Class)SFRichTitleCardSection);
      v9 = [(SAGKSnippet *)self title];
      [v8 setTitle:v9];

      v10 = [(SAGKSnippet *)self subtitle];
      [v8 setSubtitle:v10];

      [v8 setIsCentered:1];
      [v8 setSeparatorStyle:5];
      [v6 addObject:v8];
    }
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    v45[3] = 0;
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    id v11 = [(SAGKSnippet *)self pods];
    v34 = _NSConcreteStackBlock;
    uint64_t v35 = 3221225472;
    v36 = sub_100077A70;
    v37 = &unk_100144A38;
    id v12 = v6;
    id v38 = v12;
    v39 = v45;
    v40 = &v41;
    [v11 enumerateObjectsUsingBlock:&v34];

    v13 = [(SAGKSnippet *)self appPunchOut];
    if (v13 && !*((unsigned char *)v42 + 24))
    {
      id v14 = objc_alloc_init((Class)SFRowCardSection);
      id v15 = objc_alloc((Class)SFURLImage);
      v16 = [v13 appIcon];
      uint64_t v17 = [v16 resourceUrl];
      id v18 = [v15 initWithURL:v17];

      [v14 setImage:v18];
      [v18 setIsTemplate:1];
      id v19 = objc_alloc_init((Class)SFRichText);
      v20 = [v13 punchOutName];
      [v19 setText:v20];

      [v14 setLeadingText:v19];
      [v14 setImageIsRightAligned:1];
      uint64_t v21 = [v13 _convertedPunchout];
      v22 = (void *)v21;
      if (v21)
      {
        uint64_t v46 = v21;
        v23 = +[NSArray arrayWithObjects:&v46 count:1];
        [v14 setPunchoutOptions:v23];
      }
      [v12 addObject:v14];
    }
    id v24 = [v12 copy];
    [v3 setCardSections:v24];

    v25 = (SAGKSnippet *)objc_alloc_init((Class)SACardSnippet);
    id v26 = [objc_alloc((Class)_SFPBCard) initWithFacade:v3];
    v27 = [v26 data];
    [(SAGKSnippet *)v25 setCardData:v27];

    id v28 = objc_alloc_init((Class)SAUISash);
    [v28 setApplicationBundleIdentifier:@"com.apple.siri"];
    if (AFIsInternalInstall())
    {
      v29 = +[AFPreferences sharedPreferences];
      unsigned int v30 = [v29 debugButtonIsEnabled];

      if (v30)
      {
        v31 = sub_1000606C4(@"KNOWLEDGE");
        v32 = +[NSString stringWithFormat:@"%@ (INTERNAL ONLY: LEGACY FLOW)", v31, v34, v35, v36, v37];
        [v28 setTitle:v32];
      }
    }
    [(SAGKSnippet *)v25 setSash:v28];
    [(SAGKSnippet *)v25 sr_applySnippetProperties:self];
    [(SAGKSnippet *)v25 setTitle:0];

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(v45, 8);
  }
  else
  {
    v25 = self;
  }

  return v25;
}

@end