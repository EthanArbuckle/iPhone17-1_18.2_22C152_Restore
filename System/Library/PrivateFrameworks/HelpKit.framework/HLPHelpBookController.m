@interface HLPHelpBookController
- (BOOL)fullBookView;
- (BOOL)hasSectionIcon;
- (BOOL)isSemanticHTML;
- (BOOL)platformIndependent;
- (HLPHelpLocale)locale;
- (HLPHelpSectionItem)rootSectionItem;
- (HLPURLImageCacheController)imageCacheController;
- (NSArray)additionalSupportedLanguages;
- (NSMutableDictionary)helpItemMap;
- (NSString)bookId;
- (NSString)contentVersion;
- (NSString)copyrightText;
- (NSString)copyrightTopicIdentifier;
- (NSString)iconBasePath;
- (NSString)remoteCSSearchIndex;
- (NSString)remoteSearchPath;
- (NSString)topicPathFormat;
- (NSString)welcomeTopicIdentifier;
- (NSURL)helpBookURL;
- (id)copyrightTopicItem;
- (id)dynamicServerSectionsForIdentifiers:(id)a3 level:(int64_t)a4 parent:(id)a5 tocMap:(id)a6;
- (id)helpItemForID:(id)a3;
- (id)helpTopicItemForID:(id)a3;
- (id)helpTopicItemForName:(id)a3;
- (id)sectionsForChildrenIdentifiers:(id)a3 level:(int64_t)a4 parent:(id)a5 sectionsMap:(id)a6 topicsMap:(id)a7;
- (id)systemLanguages;
- (id)welcomeTopicItem;
- (int64_t)contentFormatVersion;
- (int64_t)serverType;
- (void)addAsideTopic:(id)a3;
- (void)dealloc;
- (void)fetchDataWithDataType:(int64_t)a3 identifier:(id)a4 completionHandler:(id)a5;
- (void)processData:(id)a3 formattedData:(id)a4;
- (void)processFileURLWithCompletionHandler:(id)a3;
- (void)setAdditionalSupportedLanguages:(id)a3;
- (void)setBookId:(id)a3;
- (void)setContentFormatVersion:(int64_t)a3;
- (void)setContentVersion:(id)a3;
- (void)setCopyrightText:(id)a3;
- (void)setCopyrightTopicIdentifier:(id)a3;
- (void)setFullBookView:(BOOL)a3;
- (void)setHasSectionIcon:(BOOL)a3;
- (void)setHelpBookURL:(id)a3;
- (void)setHelpItemMap:(id)a3;
- (void)setIconBasePath:(id)a3;
- (void)setImageCacheController:(id)a3;
- (void)setLocale:(id)a3;
- (void)setPlatformIndependent:(BOOL)a3;
- (void)setRemoteCSSearchIndex:(id)a3;
- (void)setRemoteSearchPath:(id)a3;
- (void)setRootSectionItem:(id)a3;
- (void)setServerType:(int64_t)a3;
- (void)setTopicPathFormat:(id)a3;
- (void)setWelcomeTopicIdentifier:(id)a3;
@end

@implementation HLPHelpBookController

- (void)dealloc
{
  if (self->_hasSectionIcon)
  {
    v3 = +[HLPImageCacheController sharedInstance];
    [v3 removeInMemoryCache];
  }
  v4.receiver = self;
  v4.super_class = (Class)HLPHelpBookController;
  [(HLPRemoteDataController *)&v4 dealloc];
}

- (BOOL)isSemanticHTML
{
  return self->_contentFormatVersion > 3;
}

- (void)fetchDataWithDataType:(int64_t)a3 identifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = +[HLPCommonDefines contentRequestHeaderFields];
  [(HLPRemoteDataController *)self setHeaderFields:v10];

  v11.receiver = self;
  v11.super_class = (Class)HLPHelpBookController;
  [(HLPRemoteDataController *)&v11 fetchDataWithDataType:a3 identifier:v9 completionHandler:v8];
}

- (void)processFileURLWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(HLPRemoteDataController *)self URL];
  int v6 = [v5 checkResourceIsReachableAndReturnError:0];

  if (v6)
  {
    v7 = (void *)MEMORY[0x263EFF8F8];
    id v8 = [(HLPRemoteDataController *)self URL];
    id v9 = [v7 dataWithContentsOfURL:v8];

    v10 = NSDictionary;
    objc_super v11 = [MEMORY[0x263F08900] JSONObjectWithData:v9 options:0 error:0];
    v12 = [v10 dictionaryWithDictionary:v11];

    if (v12)
    {
      [(HLPHelpBookController *)self processData:0 formattedData:v12];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __61__HLPHelpBookController_processFileURLWithCompletionHandler___block_invoke;
      v13[3] = &unk_264578C30;
      v13[4] = self;
      id v14 = v4;
      dispatch_async(MEMORY[0x263EF83A0], v13);
    }
  }
}

uint64_t __61__HLPHelpBookController_processFileURLWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setLoading:0];
  [*(id *)(a1 + 32) setHasLoaded:1];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)processData:(id)a3 formattedData:(id)a4
{
  v111[1] = *MEMORY[0x263EF8340];
  id v100 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_51;
  }
  v7 = (NSMutableDictionary *)[MEMORY[0x263EFFA78] mutableCopy];
  helpItemMap = self->_helpItemMap;
  self->_helpItemMap = v7;

  v102 = self;
  id v99 = v6;
  if (self->_serverType != 1)
  {
    self->_hasSectionIcon = 0;
    id v64 = v6;
    v65 = [v64 objectForKeyedSubscript:@"birdseed_version"];
    v102->_contentFormatVersion = [v65 integerValue];

    uint64_t v66 = [v64 objectForKeyedSubscript:@"version"];
    contentVersion = v102->_contentVersion;
    v102->_contentVersion = (NSString *)v66;

    uint64_t v68 = [v64 objectForKeyedSubscript:@"copyright_text"];
    copyrightText = v102->_copyrightText;
    v102->_copyrightText = (NSString *)v68;

    uint64_t v70 = [v64 objectForKeyedSubscript:@"landing"];
    welcomeTopicIdentifier = v102->_welcomeTopicIdentifier;
    v102->_welcomeTopicIdentifier = (NSString *)v70;

    uint64_t v72 = [v64 objectForKeyedSubscript:@"copyright"];
    copyrightTopicIdentifier = v102->_copyrightTopicIdentifier;
    v102->_copyrightTopicIdentifier = (NSString *)v72;

    v74 = [v64 objectForKeyedSubscript:@"sections"];
    v75 = (void *)MEMORY[0x263EFF9A0];
    v76 = [v64 objectForKeyedSubscript:@"topics"];
    v77 = [v75 dictionaryWithDictionary:v76];

    v78 = [v64 objectForKeyedSubscript:@"urls"];
    [v77 addEntriesFromDictionary:v78];

    v79 = [v64 objectForKeyedSubscript:@"toc"];

    v63 = [(HLPHelpBookController *)v102 sectionsForChildrenIdentifiers:v79 level:0 parent:0 sectionsMap:v74 topicsMap:v77];

    if (v102->_contentFormatVersion <= 4) {
      v80 = @"glossary";
    }
    else {
      v80 = @"aside";
    }
    v81 = v80;
    v103[0] = MEMORY[0x263EF8330];
    v103[1] = 3221225472;
    v103[2] = __51__HLPHelpBookController_processData_formattedData___block_invoke;
    v103[3] = &unk_264578CF8;
    v103[4] = v102;
    v104 = v81;
    v82 = v81;
    [v77 enumerateKeysAndObjectsUsingBlock:v103];

    goto LABEL_45;
  }
  v101 = [v6 objectForKeyedSubscript:@"bookResponse"];
  v95 = [v101 objectForKeyedSubscript:@"meta"];
  id v9 = [v101 objectForKeyedSubscript:@"bookId"];
  bookId = self->_bookId;
  self->_bookId = v9;

  self->_contentFormatVersion = 5;
  objc_super v11 = [v95 objectForKeyedSubscript:@"productVersion"];
  v12 = self->_contentVersion;
  self->_contentVersion = v11;

  v13 = [v101 objectForKeyedSubscript:@"copyrightId"];
  id v14 = [v13 uppercaseString];
  v15 = self->_copyrightTopicIdentifier;
  self->_copyrightTopicIdentifier = v14;

  v16 = [v101 objectForKeyedSubscript:@"copyrightText"];
  v17 = self->_copyrightText;
  self->_copyrightText = v16;

  v18 = [v101 objectForKeyedSubscript:@"tocId"];
  v19 = self->_welcomeTopicIdentifier;
  self->_welcomeTopicIdentifier = v18;

  v97 = [v101 objectForKeyedSubscript:@"locale"];
  if (v97)
  {
    v20 = objc_alloc_init(HLPHelpLocale);
    locale = self->_locale;
    self->_locale = v20;

    v22 = (void *)MEMORY[0x263F086E0];
    v23 = [(HLPHelpBookController *)self systemLanguages];
    v111[0] = v97;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v111 count:1];
    v25 = [v22 preferredLocalizationsFromArray:v23 forPreferences:v24];
    [(HLPHelpLocale *)v102->_locale setIsoCodes:v25];
  }
  v96 = [v101 objectForKeyedSubscript:@"miscAttributes"];
  if (v96)
  {
    v26 = [v96 dataUsingEncoding:4];
    v27 = NSDictionary;
    v28 = [MEMORY[0x263F08900] JSONObjectWithData:v26 options:0 error:0];
    v29 = [v27 dictionaryWithDictionary:v28];

    if (v29)
    {
      uint64_t v30 = [v29 objectForKeyedSubscript:@"remoteSearchTree"];
      remoteSearchPath = v102->_remoteSearchPath;
      v102->_remoteSearchPath = (NSString *)v30;

      v32 = [(NSString *)v102->_remoteSearchPath lastPathComponent];
      char v33 = [v32 isEqualToString:@"searchTree.json"];

      if ((v33 & 1) == 0)
      {
        v34 = v102->_remoteSearchPath;
        v102->_remoteSearchPath = 0;
      }
      v35 = [(NSString *)v102->_remoteCSSearchIndex lastPathComponent];
      char v36 = [v35 isEqualToString:@"search.cshelpindex"];

      if ((v36 & 1) == 0)
      {
        remoteCSSearchIndex = v102->_remoteCSSearchIndex;
        v102->_remoteCSSearchIndex = 0;
      }
      uint64_t v38 = [v29 objectForKeyedSubscript:@"iconBaseUrl"];
      iconBasePath = v102->_iconBasePath;
      v102->_iconBasePath = (NSString *)v38;
    }
  }
  v98 = [v101 objectForKeyedSubscript:@"toc"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v40 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v98, "count"));
    v102->_hasSectionIcon = 0;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v41 = v98;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v105 objects:v110 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v106;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v106 != v43) {
            objc_enumerationMutation(v41);
          }
          v45 = *(void **)(*((void *)&v105 + 1) + 8 * i);
          v46 = [v45 objectForKeyedSubscript:@"tocId"];
          if ([v46 length])
          {
            [v40 setObject:v45 forKeyedSubscript:v46];
            v47 = [(NSMutableDictionary *)v102->_helpItemMap objectForKeyedSubscript:v46];
            BOOL v48 = v47 == 0;

            if (v48)
            {
              v49 = [v45 objectForKeyedSubscript:@"target"];
              if ([v49 length])
              {
                v50 = objc_alloc_init(HLPHelpTopicItem);
                [(HLPHelpItem *)v50 setServerType:1];
                v51 = [v45 objectForKeyedSubscript:@"title"];
                [(HLPHelpItem *)v50 setName:v51];

                [(HLPHelpTopicItem *)v50 setGlossaryIdentifierString:@"aside"];
                [(HLPHelpItem *)v50 setIdentifier:v46];
                [(NSMutableDictionary *)v102->_helpItemMap setObject:v50 forKeyedSubscript:v46];
              }
            }
          }
        }
        uint64_t v42 = [v41 countByEnumeratingWithState:&v105 objects:v110 count:16];
      }
      while (v42);
    }

    if ([(NSString *)v102->_copyrightTopicIdentifier length])
    {
      if (!v102->_copyrightText) {
        goto LABEL_32;
      }
      v52 = [(HLPHelpBookController *)v102 helpItemForID:v102->_copyrightTopicIdentifier];
      if (!v52)
      {
        v52 = objc_alloc_init(HLPHelpTopicItem);
        [(HLPHelpItem *)v52 setServerType:1];
        [(NSMutableDictionary *)v102->_helpItemMap setObject:v52 forKeyedSubscript:v102->_copyrightTopicIdentifier];
      }
      [(HLPHelpItem *)v52 setName:v102->_copyrightText];
      [(HLPHelpItem *)v52 setIdentifier:v102->_copyrightTopicIdentifier];
      [(HLPHelpTopicItem *)v52 setHrefID:v102->_copyrightTopicIdentifier];
    }
    v53 = v102;
    if (v102->_copyrightText)
    {
LABEL_35:
      v61 = [v40 objectForKeyedSubscript:v53->_welcomeTopicIdentifier];
      v62 = [v61 objectForKeyedSubscript:@"children"];
      if ([v62 count])
      {
        v63 = [(HLPHelpBookController *)v102 dynamicServerSectionsForIdentifiers:v62 level:0 parent:0 tocMap:v40];
      }
      else
      {
        v63 = 0;
      }

      goto LABEL_44;
    }
LABEL_32:
    v54 = [MEMORY[0x263F086E0] HLPBundle];
    v55 = [v54 localizedStringForKey:@"Copyright © %ld Apple Inc. All rights reserved." value:&stru_26D29FC58 table:0];

    v56 = [MEMORY[0x263EFF8F0] currentCalendar];
    v57 = [MEMORY[0x263EFF910] date];
    v58 = [v56 components:4 fromDate:v57];

    if ([v58 year] >= 1)
    {
      uint64_t v59 = objc_msgSend(NSString, "stringWithFormat:", v55, objc_msgSend(v58, "year"));
      v60 = v102->_copyrightText;
      v102->_copyrightText = (NSString *)v59;
    }
    v53 = v102;
    goto LABEL_35;
  }
  v63 = 0;
LABEL_44:

LABEL_45:
  if (v102->_hasSectionIcon)
  {
    v83 = [MEMORY[0x263EFF960] preferredLanguages];
    v84 = [v83 firstObject];

    v85 = (void *)MEMORY[0x263F086E0];
    v86 = [(HLPHelpBookController *)v102 systemLanguages];
    v109 = v84;
    v87 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v109 count:1];
    v88 = [v85 preferredLocalizationsFromArray:v86 forPreferences:v87];

    uint64_t v89 = [v88 firstObject];
    v90 = (void *)v89;
    if (v89) {
      v91 = (void *)v89;
    }
    else {
      v91 = v84;
    }
    v92 = +[HLPImageCacheController sharedInstance];
    [v92 setLanguageCode:v91];
  }
  v93 = objc_alloc_init(HLPHelpSectionItem);
  rootSectionItem = v102->_rootSectionItem;
  v102->_rootSectionItem = v93;

  [(HLPHelpSectionItem *)v102->_rootSectionItem setOpen:1];
  [(HLPHelpSectionItem *)v102->_rootSectionItem setChildren:v63];

  id v6 = v99;
LABEL_51:
}

void __51__HLPHelpBookController_processData_formattedData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) helpItemMap];
  v7 = [v6 objectForKeyedSubscript:v12];

  if (!v7)
  {
    id v8 = [HLPHelpTopicItem alloc];
    id v9 = [*(id *)(a1 + 32) helpBookURL];
    v10 = -[HLPHelpTopicItem initWithDictionary:helpBookURL:serverType:](v8, "initWithDictionary:helpBookURL:serverType:", v5, v9, [*(id *)(a1 + 32) serverType]);

    [(HLPHelpTopicItem *)v10 setGlossaryIdentifierString:*(void *)(a1 + 40)];
    [(HLPHelpItem *)v10 setIdentifier:v12];
    objc_super v11 = [*(id *)(a1 + 32) helpItemMap];
    [v11 setObject:v10 forKeyedSubscript:v12];
  }
}

- (id)systemLanguages
{
  v3 = [MEMORY[0x263EFF960] systemLanguages];
  id v4 = [(HLPHelpBookController *)self additionalSupportedLanguages];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(HLPHelpBookController *)self additionalSupportedLanguages];
    uint64_t v7 = [v3 arrayByAddingObjectsFromArray:v6];

    v3 = (void *)v7;
  }
  return v3;
}

- (id)dynamicServerSectionsForIdentifiers:(id)a3 level:(int64_t)a4 parent:(id)a5 tocMap:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  char v36 = [MEMORY[0x263EFF980] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    unint64_t v15 = 0x267F2A000uLL;
    uint64_t v16 = *(void *)v41;
    v39 = self;
    id v34 = v12;
    uint64_t v37 = *(void *)v41;
    do
    {
      uint64_t v17 = 0;
      uint64_t v35 = v14;
      do
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v40 + 1) + 8 * v17);
        if (([v18 isEqualToString:*(Class *)((char *)&self->super.super.isa + *(int *)(v15 + 856))] & 1) == 0)
        {
          v19 = [v11 objectForKeyedSubscript:v18];
          v20 = v19;
          if (v19)
          {
            id v21 = [v19 objectForKeyedSubscript:@"children"];
            uint64_t v22 = [v21 count];
            uint64_t v23 = [(NSMutableDictionary *)self->_helpItemMap objectForKeyedSubscript:v18];
            v24 = (HLPHelpSectionItem *)v23;
            if (v21 != v12 && v22 != 0)
            {
              if (!v23)
              {
                v24 = [(HLPHelpItem *)[HLPHelpSectionItem alloc] initWithDictionary:v20 helpBookURL:v39->_helpBookURL serverType:v39->_serverType];
                [(HLPHelpItem *)v24 setIdentifier:v18];
              }
              v26 = [(HLPHelpBookController *)v39 dynamicServerSectionsForIdentifiers:v21 level:a4 + 1 parent:v24 tocMap:v11];
              [(HLPHelpSectionItem *)v24 setChildren:v26];
            }
            v27 = [v20 objectForKeyedSubscript:@"icon"];
            if ([v27 length] && -[NSString length](v39->_iconBasePath, "length"))
            {
              v28 = [(NSString *)v39->_iconBasePath stringByAppendingPathComponent:v27];
              [NSURL URLWithString:v28];
              id v29 = v11;
              v31 = id v30 = v10;
              [(HLPHelpItem *)v24 setIconURL:v31];

              id v10 = v30;
              id v11 = v29;
              v39->_hasSectionIcon = 1;
              id v12 = v34;
              uint64_t v14 = v35;
            }
            [(HLPHelpItem *)v24 setParent:v10];
            [(HLPHelpItem *)v24 setLevel:a4];
            if (v24) {
              [v36 addObject:v24];
            }

            self = v39;
            unint64_t v15 = 0x267F2A000;
            uint64_t v16 = v37;
          }
        }
        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v14);
  }

  if ([v36 count])
  {
    v32 = [MEMORY[0x263EFF8C0] arrayWithArray:v36];
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (id)sectionsForChildrenIdentifiers:(id)a3 level:(int64_t)a4 parent:(id)a5 sectionsMap:(id)a6 topicsMap:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (self->_contentFormatVersion <= 4) {
    unint64_t v15 = @"glossary";
  }
  else {
    unint64_t v15 = @"aside";
  }
  uint64_t v16 = v15;
  uint64_t v17 = (void *)MEMORY[0x263EFF980];
  id v18 = a3;
  v19 = [v17 array];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __91__HLPHelpBookController_sectionsForChildrenIdentifiers_level_parent_sectionsMap_topicsMap___block_invoke;
  v27[3] = &unk_264578D20;
  id v20 = v13;
  id v28 = v20;
  id v29 = self;
  int64_t v34 = a4;
  id v21 = v14;
  id v30 = v21;
  uint64_t v22 = v16;
  v31 = v22;
  id v23 = v12;
  id v32 = v23;
  id v24 = v19;
  id v33 = v24;
  [v18 enumerateObjectsUsingBlock:v27];

  if ([v24 count])
  {
    v25 = [MEMORY[0x263EFF8C0] arrayWithArray:v24];
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

void __91__HLPHelpBookController_sectionsForChildrenIdentifiers_level_parent_sectionsMap_topicsMap___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) helpItemMap];
    uint64_t v5 = [v4 objectForKeyedSubscript:v18];

    if (!v5)
    {
      id v6 = [HLPHelpSectionItem alloc];
      uint64_t v7 = [*(id *)(a1 + 40) helpBookURL];
      uint64_t v5 = -[HLPHelpItem initWithDictionary:helpBookURL:serverType:](v6, "initWithDictionary:helpBookURL:serverType:", v3, v7, [*(id *)(a1 + 40) serverType]);
    }
    id v8 = v5;
    id v9 = [v3 objectForKeyedSubscript:@"children"];
    id v10 = [(HLPHelpSectionItem *)v8 children];

    if (!v10)
    {
      id v11 = [*(id *)(a1 + 40) sectionsForChildrenIdentifiers:v9 level:*(void *)(a1 + 80) + 1 parent:v8 sectionsMap:*(void *)(a1 + 32) topicsMap:*(void *)(a1 + 48)];
      [(HLPHelpSectionItem *)v8 setChildren:v11];
    }
    if (v8)
    {
      id v12 = [*(id *)(a1 + 40) helpItemMap];
      [v12 setObject:v8 forKeyedSubscript:v18];
    }
    id v13 = [(HLPHelpItem *)v8 iconURL];

    if (v13) {
      [*(id *)(a1 + 40) setHasSectionIcon:1];
    }
    id v14 = (HLPHelpTopicItem *)v8;
  }
  else
  {
    id v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:v18];
    if (v9)
    {
      unint64_t v15 = [HLPHelpTopicItem alloc];
      uint64_t v16 = [*(id *)(a1 + 40) helpBookURL];
      id v14 = -[HLPHelpTopicItem initWithDictionary:helpBookURL:serverType:](v15, "initWithDictionary:helpBookURL:serverType:", v9, v16, [*(id *)(a1 + 40) serverType]);

      [(HLPHelpTopicItem *)v14 setGlossaryIdentifierString:*(void *)(a1 + 56)];
      uint64_t v17 = [*(id *)(a1 + 40) helpItemMap];
      [v17 setObject:v14 forKeyedSubscript:v18];

      id v8 = 0;
    }
    else
    {
      id v8 = 0;
      id v14 = 0;
    }
  }

  [(HLPHelpItem *)v14 setIdentifier:v18];
  [(HLPHelpItem *)v14 setParent:*(void *)(a1 + 64)];
  [(HLPHelpItem *)v14 setLevel:*(void *)(a1 + 80)];
  if (v14) {
    [*(id *)(a1 + 72) addObject:v14];
  }
}

- (id)helpTopicItemForID:(id)a3
{
  v3 = [(HLPHelpBookController *)self helpItemForID:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)helpTopicItemForName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  if ([v4 length])
  {
    id v5 = [v4 lowercaseString];
    id v6 = [(NSMutableDictionary *)self->_helpItemMap allValues];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __46__HLPHelpBookController_helpTopicItemForName___block_invoke;
    v10[3] = &unk_264578AC0;
    id v7 = v5;
    id v11 = v7;
    id v12 = &v13;
    [v6 enumerateObjectsUsingBlock:v10];
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __46__HLPHelpBookController_helpTopicItemForName___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = [v7 name];
    id v9 = [v8 lowercaseString];
    int v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

    if (v10)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }
  return MEMORY[0x270F9A758]();
}

- (void)addAsideTopic:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 identifier];
  if (v4)
  {
    id v5 = (void *)v4;
    helpItemMap = self->_helpItemMap;
    id v7 = [v11 identifier];
    id v8 = [(NSMutableDictionary *)helpItemMap objectForKeyedSubscript:v7];

    if (!v8)
    {
      id v9 = self->_helpItemMap;
      int v10 = [v11 identifier];
      [(NSMutableDictionary *)v9 setObject:v11 forKeyedSubscript:v10];
    }
  }
}

- (id)helpItemForID:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_helpItemMap objectForKeyedSubscript:v4];
  if (!v5)
  {
    if (self->_serverType == 1)
    {
      helpItemMap = self->_helpItemMap;
      id v7 = [v4 uppercaseString];
      id v5 = [(NSMutableDictionary *)helpItemMap objectForKeyedSubscript:v7];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)copyrightTopicItem
{
  return [(HLPHelpBookController *)self helpTopicItemForID:self->_copyrightTopicIdentifier];
}

- (id)welcomeTopicItem
{
  return [(HLPHelpBookController *)self helpTopicItemForID:self->_welcomeTopicIdentifier];
}

- (int64_t)contentFormatVersion
{
  return self->_contentFormatVersion;
}

- (void)setContentFormatVersion:(int64_t)a3
{
  self->_contentFormatVersion = a3;
}

- (int64_t)serverType
{
  return self->_serverType;
}

- (void)setServerType:(int64_t)a3
{
  self->_serverType = a3;
}

- (BOOL)hasSectionIcon
{
  return self->_hasSectionIcon;
}

- (void)setHasSectionIcon:(BOOL)a3
{
  self->_hasSectionIcon = a3;
}

- (BOOL)fullBookView
{
  return self->_fullBookView;
}

- (void)setFullBookView:(BOOL)a3
{
  self->_fullBookView = a3;
}

- (BOOL)platformIndependent
{
  return self->_platformIndependent;
}

- (void)setPlatformIndependent:(BOOL)a3
{
  self->_platformIndependent = a3;
}

- (NSArray)additionalSupportedLanguages
{
  return self->_additionalSupportedLanguages;
}

- (void)setAdditionalSupportedLanguages:(id)a3
{
}

- (NSMutableDictionary)helpItemMap
{
  return self->_helpItemMap;
}

- (void)setHelpItemMap:(id)a3
{
}

- (NSString)contentVersion
{
  return self->_contentVersion;
}

- (void)setContentVersion:(id)a3
{
}

- (NSString)copyrightText
{
  return self->_copyrightText;
}

- (void)setCopyrightText:(id)a3
{
}

- (NSString)copyrightTopicIdentifier
{
  return self->_copyrightTopicIdentifier;
}

- (void)setCopyrightTopicIdentifier:(id)a3
{
}

- (NSString)bookId
{
  return self->_bookId;
}

- (void)setBookId:(id)a3
{
}

- (NSString)topicPathFormat
{
  return self->_topicPathFormat;
}

- (void)setTopicPathFormat:(id)a3
{
}

- (NSString)remoteSearchPath
{
  return self->_remoteSearchPath;
}

- (void)setRemoteSearchPath:(id)a3
{
}

- (NSString)remoteCSSearchIndex
{
  return self->_remoteCSSearchIndex;
}

- (void)setRemoteCSSearchIndex:(id)a3
{
}

- (NSString)iconBasePath
{
  return self->_iconBasePath;
}

- (void)setIconBasePath:(id)a3
{
}

- (HLPHelpLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSString)welcomeTopicIdentifier
{
  return self->_welcomeTopicIdentifier;
}

- (void)setWelcomeTopicIdentifier:(id)a3
{
}

- (NSURL)helpBookURL
{
  return self->_helpBookURL;
}

- (void)setHelpBookURL:(id)a3
{
}

- (HLPHelpSectionItem)rootSectionItem
{
  return self->_rootSectionItem;
}

- (void)setRootSectionItem:(id)a3
{
}

- (HLPURLImageCacheController)imageCacheController
{
  return self->_imageCacheController;
}

- (void)setImageCacheController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCacheController, 0);
  objc_storeStrong((id *)&self->_rootSectionItem, 0);
  objc_storeStrong((id *)&self->_helpBookURL, 0);
  objc_storeStrong((id *)&self->_welcomeTopicIdentifier, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_iconBasePath, 0);
  objc_storeStrong((id *)&self->_remoteCSSearchIndex, 0);
  objc_storeStrong((id *)&self->_remoteSearchPath, 0);
  objc_storeStrong((id *)&self->_topicPathFormat, 0);
  objc_storeStrong((id *)&self->_bookId, 0);
  objc_storeStrong((id *)&self->_copyrightTopicIdentifier, 0);
  objc_storeStrong((id *)&self->_copyrightText, 0);
  objc_storeStrong((id *)&self->_contentVersion, 0);
  objc_storeStrong((id *)&self->_helpItemMap, 0);
  objc_storeStrong((id *)&self->_additionalSupportedLanguages, 0);
}

@end