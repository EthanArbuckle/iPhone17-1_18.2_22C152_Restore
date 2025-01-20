@interface ATXHomeScreenPage
+ (BOOL)supportsSecureCoding;
- (ATXHomeScreenPage)init;
- (ATXHomeScreenPage)initWithCoder:(id)a3;
- (BOOL)_containsWidgetWithExtensionBundleId:(id)a3;
- (BOOL)containsAppPredictionPanel;
- (BOOL)containsSuggestionsWidget;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (NSArray)candidateApps;
- (NSArray)leafAppIcons;
- (NSArray)leafIcons;
- (NSArray)panels;
- (NSArray)stacks;
- (NSDictionary)appLocations;
- (NSDictionary)webClipLocations;
- (NSSet)associatedModeUUIDs;
- (NSString)uniqueIdentifier;
- (id)_leafIconsFromExistingData;
- (id)description;
- (id)dictionaryRepresentationForIntrospection;
- (id)initFromDictionaryRepresentation:(id)a3;
- (id)nonFolderAppsOnPage;
- (int64_t)suggestedPageType;
- (unint64_t)maxPortraitColumns;
- (unint64_t)maxPortraitRows;
- (unint64_t)numberOfLeafIconSpots;
- (unint64_t)pageIndex;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateApps:(id)a3;
- (void)enumerateAppsConsideringFolders:(BOOL)a3 block:(id)a4;
- (void)setAppLocations:(id)a3;
- (void)setAssociatedModeUUIDs:(id)a3;
- (void)setCandidateApps:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setLeafIcons:(id)a3;
- (void)setMaxPortraitColumns:(unint64_t)a3;
- (void)setMaxPortraitRows:(unint64_t)a3;
- (void)setPageIndex:(unint64_t)a3;
- (void)setPanels:(id)a3;
- (void)setStacks:(id)a3;
- (void)setSuggestedPageType:(int64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setWebClipLocations:(id)a3;
@end

@implementation ATXHomeScreenPage

- (unint64_t)numberOfLeafIconSpots
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(ATXHomeScreenPage *)self maxPortraitRows];
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 6;
  }
  unint64_t v5 = [(ATXHomeScreenPage *)self maxPortraitColumns];
  uint64_t v6 = 4;
  if (v5) {
    uint64_t v6 = v5;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v7 = v6 * v4;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = [(ATXHomeScreenPage *)self stacks];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v7 -= [*(id *)(*((void *)&v14 + 1) + 8 * i) numberOfLeafIconSpots];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHomeScreenPage)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXHomeScreenPage;
  v2 = [(ATXHomeScreenPage *)&v8 init];
  unint64_t v3 = v2;
  if (v2)
  {
    appLocations = v2->_appLocations;
    unint64_t v5 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    v2->_appLocations = (NSDictionary *)MEMORY[0x1E4F1CC08];

    webClipLocations = v3->_webClipLocations;
    v3->_webClipLocations = v5;
  }
  return v3;
}

- (ATXHomeScreenPage)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)ATXHomeScreenPage;
  unint64_t v5 = [(ATXHomeScreenPage *)&v38 init];
  if (v5)
  {
    -[ATXHomeScreenPage setSuggestedPageType:](v5, "setSuggestedPageType:", [v4 decodeIntegerForKey:@"suggestedPageType"]);
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
    [(ATXHomeScreenPage *)v5 setUniqueIdentifier:v6];

    -[ATXHomeScreenPage setPageIndex:](v5, "setPageIndex:", [v4 decodeIntegerForKey:@"pageIndex"]);
    -[ATXHomeScreenPage setHidden:](v5, "setHidden:", [v4 decodeBoolForKey:@"hidden"]);
    -[ATXHomeScreenPage setMaxPortraitRows:](v5, "setMaxPortraitRows:", [v4 decodeIntegerForKey:@"portraitRows"]);
    -[ATXHomeScreenPage setMaxPortraitColumns:](v5, "setMaxPortraitColumns:", [v4 decodeIntegerForKey:@"portraitColumns"]);
    unint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"stacks"];
    [(ATXHomeScreenPage *)v5 setStacks:v10];

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    long long v14 = [v4 decodeObjectOfClasses:v13 forKey:@"panels"];
    [(ATXHomeScreenPage *)v5 setPanels:v14];

    long long v15 = allowedLeafIconClasses();
    long long v16 = [v4 decodeObjectOfClasses:v15 forKey:@"leafIcons"];
    [(ATXHomeScreenPage *)v5 setLeafIcons:v16];

    long long v17 = (void *)MEMORY[0x1AD0D3C30]();
    id v18 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "initWithObjects:", v19, objc_opt_class(), 0);
    v21 = [v4 decodeObjectOfClasses:v20 forKey:@"associatedModeUUIDs"];
    [(ATXHomeScreenPage *)v5 setAssociatedModeUUIDs:v21];

    v22 = (void *)MEMORY[0x1AD0D3C30]();
    id v23 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v23, "initWithObjects:", v24, objc_opt_class(), 0);
    v26 = [v4 decodeObjectOfClasses:v25 forKey:@"candidateApps"];
    [(ATXHomeScreenPage *)v5 setCandidateApps:v26];

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
    v31 = [v4 decodeObjectOfClasses:v30 forKey:@"appLocations"];
    [(ATXHomeScreenPage *)v5 setAppLocations:v31];

    v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    v35 = objc_msgSend(v32, "setWithObjects:", v33, v34, objc_opt_class(), 0);
    v36 = [v4 decodeObjectOfClasses:v35 forKey:@"webClipLocations"];
    [(ATXHomeScreenPage *)v5 setWebClipLocations:v36];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[ATXHomeScreenPage pageIndex](self, "pageIndex"), @"pageIndex");
  objc_msgSend(v8, "encodeBool:forKey:", -[ATXHomeScreenPage isHidden](self, "isHidden"), @"hidden");
  objc_msgSend(v8, "encodeInteger:forKey:", -[ATXHomeScreenPage maxPortraitRows](self, "maxPortraitRows"), @"portraitRows");
  objc_msgSend(v8, "encodeInteger:forKey:", -[ATXHomeScreenPage maxPortraitColumns](self, "maxPortraitColumns"), @"portraitColumns");
  id v4 = [(ATXHomeScreenPage *)self stacks];
  [v8 encodeObject:v4 forKey:@"stacks"];

  unint64_t v5 = [(ATXHomeScreenPage *)self panels];
  [v8 encodeObject:v5 forKey:@"panels"];

  [v8 encodeObject:self->_leafIcons forKey:@"leafIcons"];
  uint64_t v6 = [(ATXHomeScreenPage *)self appLocations];
  [v8 encodeObject:v6 forKey:@"appLocations"];

  unint64_t v7 = [(ATXHomeScreenPage *)self webClipLocations];
  [v8 encodeObject:v7 forKey:@"webClipLocations"];

  [v8 encodeInteger:self->_suggestedPageType forKey:@"suggestedPageType"];
  [v8 encodeObject:self->_uniqueIdentifier forKey:@"uniqueIdentifier"];
  [v8 encodeObject:self->_associatedModeUUIDs forKey:@"associatedModeUUIDs"];
  [v8 encodeObject:self->_candidateApps forKey:@"candidateApps"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXHomeScreenPage *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      if ([(ATXHomeScreenPage *)v5 pageIndex] != self->_pageIndex
        || self->_hidden != [(ATXHomeScreenPage *)v5 isHidden])
      {
        goto LABEL_25;
      }
      stacks = self->_stacks;
      unint64_t v7 = v5->_stacks;
      if (stacks == v7)
      {
      }
      else
      {
        id v8 = v7;
        uint64_t v9 = stacks;
        char v10 = [(NSArray *)v9 isEqual:v8];

        if ((v10 & 1) == 0) {
          goto LABEL_25;
        }
      }
      panels = self->_panels;
      v13 = v5->_panels;
      if (panels == v13)
      {
      }
      else
      {
        long long v14 = v13;
        long long v15 = panels;
        char v16 = [(NSArray *)v15 isEqual:v14];

        if ((v16 & 1) == 0) {
          goto LABEL_25;
        }
      }
      appLocations = self->_appLocations;
      id v18 = v5->_appLocations;
      if (appLocations == v18)
      {
      }
      else
      {
        uint64_t v19 = v18;
        v20 = appLocations;
        char v21 = [(NSDictionary *)v20 isEqual:v19];

        if ((v21 & 1) == 0) {
          goto LABEL_25;
        }
      }
      webClipLocations = self->_webClipLocations;
      id v23 = v5->_webClipLocations;
      if (webClipLocations == v23)
      {
      }
      else
      {
        uint64_t v24 = v23;
        v25 = webClipLocations;
        char v26 = [(NSDictionary *)v25 isEqual:v24];

        if ((v26 & 1) == 0) {
          goto LABEL_25;
        }
      }
      leafIcons = self->_leafIcons;
      uint64_t v28 = v5->_leafIcons;
      if (leafIcons == v28)
      {
      }
      else
      {
        uint64_t v29 = v28;
        v30 = leafIcons;
        char v31 = [(NSArray *)v30 isEqual:v29];

        if ((v31 & 1) == 0)
        {
LABEL_25:
          char v11 = 0;
LABEL_26:

          goto LABEL_27;
        }
      }
      uint64_t v33 = self->_associatedModeUUIDs;
      uint64_t v34 = v33;
      if (v33 == v5->_associatedModeUUIDs) {
        char v11 = 1;
      }
      else {
        char v11 = -[NSSet isEqual:](v33, "isEqual:");
      }

      goto LABEL_26;
    }
    char v11 = 0;
  }
LABEL_27:

  return v11;
}

- (void)setPanels:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_panels != a3)
  {
    id v4 = (NSArray *)[a3 copy];
    panels = self->_panels;
    self->_panels = v4;

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_panels;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setPage:", self, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)setStacks:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_stacks != a3)
  {
    id v4 = (NSArray *)[a3 copy];
    stacks = self->_stacks;
    self->_stacks = v4;

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_stacks;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setPage:", self, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (id)_leafIconsFromExistingData
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = objc_opt_new();
  id v4 = v3;
  unint64_t v5 = (NSDictionary *)MEMORY[0x1E4F1CC08];
  if (self->_webClipLocations) {
    webClipLocations = self->_webClipLocations;
  }
  else {
    webClipLocations = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  [v3 addEntriesFromDictionary:webClipLocations];
  if (self->_appLocations) {
    appLocations = self->_appLocations;
  }
  else {
    appLocations = v5;
  }
  [v4 addEntriesFromDictionary:appLocations];
  char v26 = v4;
  uint64_t v8 = [v4 keysSortedByValueUsingComparator:&__block_literal_global_294];
  id v29 = (id)objc_opt_new();
  v27 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * v12);
        long long v14 = [(NSDictionary *)self->_webClipLocations objectForKeyedSubscript:v13];
        long long v15 = [(NSDictionary *)self->_appLocations objectForKeyedSubscript:v13];
        if ([v14 length] == 1)
        {
          uint64_t v16 = [[ATXHomeScreenWebClip alloc] initWithUUID:v13 name:0 url:0];
          goto LABEL_14;
        }
        if ([v14 length] == 2)
        {
          long long v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "indexAtPosition:", 0));
          id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "indexAtPosition:", 1));
          uint64_t v19 = [v27 objectForKeyedSubscript:v17];
          if (!v19)
          {
            v20 = [ATXHomeScreenFolder alloc];
            uint64_t v19 = [(ATXHomeScreenFolder *)v20 initWithFolderPages:MEMORY[0x1E4F1CBF0] name:0];
            [v27 setObject:v19 forKeyedSubscript:v17];
            [v29 addObject:v19];
          }
          char v21 = [[ATXHomeScreenWebClip alloc] initWithUUID:v13 name:0 url:0];
          goto LABEL_19;
        }
        if ([v15 length] == 1)
        {
          uint64_t v16 = [[ATXHomeScreenApp alloc] initWithBundleId:v13];
LABEL_14:
          long long v17 = v16;
          [v29 addObject:v16];
LABEL_20:

          goto LABEL_21;
        }
        if ([v15 length] == 2)
        {
          long long v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "indexAtPosition:", 0));
          id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "indexAtPosition:", 1));
          uint64_t v19 = [v27 objectForKeyedSubscript:v17];
          if (!v19)
          {
            id v23 = [ATXHomeScreenFolder alloc];
            uint64_t v19 = [(ATXHomeScreenFolder *)v23 initWithFolderPages:MEMORY[0x1E4F1CBF0] name:0];
            [v27 setObject:v19 forKeyedSubscript:v17];
            [v29 addObject:v19];
          }
          char v21 = [[ATXHomeScreenApp alloc] initWithBundleId:v13];
LABEL_19:
          v22 = v21;
          -[ATXHomeScreenFolder addIcon:folderPageIndex:](v19, "addIcon:folderPageIndex:", v21, [v18 integerValue]);

          goto LABEL_20;
        }
LABEL_21:

        ++v12;
      }
      while (v10 != v12);
      uint64_t v24 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v10 = v24;
    }
    while (v24);
  }

  return v29;
}

uint64_t __47__ATXHomeScreenPage__leafIconsFromExistingData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 indexAtPosition:0];
  unint64_t v7 = [v5 indexAtPosition:0];
  if (v6 >= v7)
  {
    if (v7 >= v6)
    {
      if ((unint64_t)[v4 length] > 1 || (unint64_t)objc_msgSend(v5, "length") >= 2)
      {
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "indexAtPosition:", 1));
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "indexAtPosition:", 1));
        uint64_t v8 = [v9 compare:v10];
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = -1;
  }

  return v8;
}

- (NSArray)leafIcons
{
  leafIcons = self->_leafIcons;
  if (leafIcons)
  {
    unint64_t v3 = leafIcons;
  }
  else if ([(NSDictionary *)self->_webClipLocations count] {
         || (unint64_t v3 = [(NSDictionary *)self->_appLocations count]) != 0)
  }
  {
    unint64_t v3 = [(ATXHomeScreenPage *)self _leafIconsFromExistingData];
  }

  return v3;
}

- (NSArray)leafAppIcons
{
  unint64_t v3 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__ATXHomeScreenPage_leafAppIcons__block_invoke;
  v6[3] = &unk_1E5D0AA18;
  id v4 = v3;
  id v7 = v4;
  [(ATXHomeScreenPage *)self enumerateApps:v6];

  return (NSArray *)v4;
}

uint64_t __33__ATXHomeScreenPage_leafAppIcons__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)enumerateApps:(id)a3
{
}

- (void)enumerateAppsConsideringFolders:(BOOL)a3 block:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (void (**)(id, void *))a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(ATXHomeScreenPage *)self leafIcons];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v6[2](v6, v12);
        }
        else if (v4)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v12 enumerateApps:v6];
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (id)description
{
  unint64_t v3 = objc_opt_new();
  objc_msgSend(v3, "appendFormat:", @"Page index: %lu; ", self->_pageIndex);
  objc_msgSend(v3, "appendFormat:", @"Hidden: %d; ", self->_hidden);
  [v3 appendFormat:@"Unique identifier: %@; ", self->_uniqueIdentifier];
  objc_msgSend(v3, "appendFormat:", @"Number of app locations (legacy): %lu; ",
    [(NSDictionary *)self->_appLocations count]);
  objc_msgSend(v3, "appendFormat:", @"Number of web clip locations (legacy): %lu; ",
    [(NSDictionary *)self->_webClipLocations count]);
  objc_msgSend(v3, "appendFormat:", @"Number of leaf icons: %lu; ", -[NSArray count](self->_leafIcons, "count"));
  [v3 appendFormat:@"Stacks: %@; ", self->_stacks];
  [v3 appendFormat:@"Panels: %@; ", self->_panels];
  if ([(NSSet *)self->_associatedModeUUIDs count])
  {
    BOOL v4 = [(NSSet *)self->_associatedModeUUIDs allObjects];
    id v5 = [v4 componentsJoinedByString:@", "];
    [v3 appendFormat:@"Associated mode UUIDs: %@; ", v5];
  }
  if ([(NSArray *)self->_candidateApps count]) {
    objc_msgSend(v3, "appendFormat:", @"Candidate apps: %ld;", -[NSArray count](self->_candidateApps, "count"));
  }

  return v3;
}

- (id)dictionaryRepresentationForIntrospection
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = objc_opt_new();
  BOOL v4 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = self->_stacks;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v33 + 1) + 8 * i) dictionaryRepresentation];
        [v4 addObject:v10];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v7);
  }

  uint64_t v11 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v12 = self->_panels;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * j), "dictionaryRepresentation", (void)v29);
        [v11 addObject:v17];
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(NSSet *)self->_associatedModeUUIDs allObjects];
  [v3 setObject:v18 forKeyedSubscript:@"associatedModeUUIDs"];

  [v3 setObject:self->_uniqueIdentifier forKeyedSubscript:@"uniqueIdentifier"];
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:self->_pageIndex];
  [v3 setObject:v19 forKeyedSubscript:@"pageIndex"];

  v20 = [NSNumber numberWithBool:self->_hidden];
  [v3 setObject:v20 forKeyedSubscript:@"hidden"];

  char v21 = [NSNumber numberWithUnsignedInteger:self->_maxPortraitRows];
  [v3 setObject:v21 forKeyedSubscript:@"portraitRows"];

  v22 = [NSNumber numberWithUnsignedInteger:self->_maxPortraitColumns];
  [v3 setObject:v22 forKeyedSubscript:@"portraitColumns"];

  [v3 setObject:v4 forKeyedSubscript:@"stacks"];
  [v3 setObject:v11 forKeyedSubscript:@"panels"];
  id v23 = [(ATXHomeScreenPage *)self leafIcons];
  uint64_t v24 = objc_msgSend(v23, "_pas_mappedArrayWithTransform:", &__block_literal_global_333);
  [v3 setObject:v24 forKeyedSubscript:@"leafIcons"];

  v25 = [(ATXHomeScreenPage *)self candidateApps];
  char v26 = objc_msgSend(v25, "_pas_mappedArrayWithTransform:", &__block_literal_global_336);
  [v3 setObject:v26 forKeyedSubscript:@"candidateApps"];

  v27 = (void *)[v3 copy];

  return v27;
}

uint64_t __61__ATXHomeScreenPage_dictionaryRepresentationForIntrospection__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentationForIntrospection];
}

uint64_t __61__ATXHomeScreenPage_dictionaryRepresentationForIntrospection__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentationForIntrospection];
}

- (id)initFromDictionaryRepresentation:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)ATXHomeScreenPage;
  id v5 = [(ATXHomeScreenPage *)&v44 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"pageIndex"];
    v5->_pageIndex = [v6 unsignedIntegerValue];

    uint64_t v7 = [v4 objectForKeyedSubscript:@"hidden"];
    v5->_hidden = [v7 BOOLValue];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"portraitRows"];
    v5->_maxPortraitRows = [v8 unsignedIntegerValue];

    uint64_t v9 = [v4 objectForKeyedSubscript:@"portraitColumns"];
    v5->_maxPortraitColumns = [v9 unsignedIntegerValue];

    uint64_t v10 = [v4 objectForKeyedSubscript:@"uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"associatedModeUUIDs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v12];
      associatedModeUUIDs = v5->_associatedModeUUIDs;
      v5->_associatedModeUUIDs = (NSSet *)v13;
    }
    uint64_t v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"stacks", v12);
    long long v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v41;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = [[ATXHomeScreenStackConfig alloc] initFromDictionaryRepresentation:*(void *)(*((void *)&v40 + 1) + 8 * v21)];
          if (v22) {
            [v16 addObject:v22];
          }

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v19);
    }

    objc_storeStrong((id *)&v5->_stacks, v16);
    id v35 = v4;
    id v23 = [v4 objectForKeyedSubscript:@"panels"];
    uint64_t v24 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v23, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v25 = v23;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v37;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = [[ATXHomeScreenStackConfig alloc] initFromDictionaryRepresentation:*(void *)(*((void *)&v36 + 1) + 8 * v29)];
          if (v30) {
            [(NSArray *)v24 addObject:v30];
          }

          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v27);
    }

    panels = v5->_panels;
    v5->_panels = v24;

    long long v32 = v5;
    id v4 = v35;
  }

  return v5;
}

- (BOOL)_containsWidgetWithExtensionBundleId:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = [(ATXHomeScreenPage *)self stacks];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v11 = [v10 widgets];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(v11);
              }
              long long v16 = [*(id *)(*((void *)&v21 + 1) + 8 * j) extensionBundleId];
              char v17 = [v16 isEqualToString:v4];

              if (v17)
              {

                BOOL v18 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        uint64_t v8 = v20;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      BOOL v18 = 0;
    }
    while (v7);
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_19:

  return v18;
}

- (BOOL)containsSuggestionsWidget
{
  return [(ATXHomeScreenPage *)self _containsWidgetWithExtensionBundleId:*MEMORY[0x1E4F4B5F8]];
}

- (BOOL)containsAppPredictionPanel
{
  return [(ATXHomeScreenPage *)self _containsWidgetWithExtensionBundleId:@"com.apple.proactive.appprediction.panel"];
}

- (id)nonFolderAppsOnPage
{
  unint64_t v3 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__ATXHomeScreenPage_nonFolderAppsOnPage__block_invoke;
  v6[3] = &unk_1E5D0AA18;
  id v4 = v3;
  id v7 = v4;
  [(ATXHomeScreenPage *)self enumerateAppsConsideringFolders:0 block:v6];

  return v4;
}

void __40__ATXHomeScreenPage_nonFolderAppsOnPage__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 bundleId];
  [v2 addObject:v3];
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (void)setPageIndex:(unint64_t)a3
{
  self->_pageIndex = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (unint64_t)maxPortraitRows
{
  return self->_maxPortraitRows;
}

- (void)setMaxPortraitRows:(unint64_t)a3
{
  self->_maxPortraitRows = a3;
}

- (unint64_t)maxPortraitColumns
{
  return self->_maxPortraitColumns;
}

- (void)setMaxPortraitColumns:(unint64_t)a3
{
  self->_maxPortraitColumns = a3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSSet)associatedModeUUIDs
{
  return self->_associatedModeUUIDs;
}

- (void)setAssociatedModeUUIDs:(id)a3
{
}

- (NSArray)stacks
{
  return self->_stacks;
}

- (NSArray)panels
{
  return self->_panels;
}

- (NSDictionary)appLocations
{
  return self->_appLocations;
}

- (void)setAppLocations:(id)a3
{
}

- (NSDictionary)webClipLocations
{
  return self->_webClipLocations;
}

- (void)setWebClipLocations:(id)a3
{
}

- (void)setLeafIcons:(id)a3
{
}

- (NSArray)candidateApps
{
  return self->_candidateApps;
}

- (void)setCandidateApps:(id)a3
{
}

- (int64_t)suggestedPageType
{
  return self->_suggestedPageType;
}

- (void)setSuggestedPageType:(int64_t)a3
{
  self->_suggestedPageType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateApps, 0);
  objc_storeStrong((id *)&self->_leafIcons, 0);
  objc_storeStrong((id *)&self->_webClipLocations, 0);
  objc_storeStrong((id *)&self->_appLocations, 0);
  objc_storeStrong((id *)&self->_panels, 0);
  objc_storeStrong((id *)&self->_stacks, 0);
  objc_storeStrong((id *)&self->_associatedModeUUIDs, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end