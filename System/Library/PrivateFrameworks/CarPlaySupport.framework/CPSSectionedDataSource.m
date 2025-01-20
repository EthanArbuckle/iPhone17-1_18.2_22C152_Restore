@interface CPSSectionedDataSource
- (BOOL)isLimitingLists;
- (BOOL)showingAssistantInLastPosition;
- (CPSSectionedDataSource)initWithSections:(id)a3 templateEnvironment:(id)a4;
- (CPSTemplateEnvironment)templateEnvironment;
- (CPSessionConfiguration)sessionConfiguration;
- (NSIndexPath)assistantCellIndexPath;
- (NSMutableArray)sections;
- (NSString)assistantCellTitle;
- (id)_sanitizedSectionIndexTitleForTitle:(id)a3;
- (id)firstItemIndexPath;
- (id)indexPathForItemWithIdentifier:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)sectionAtIndex:(int64_t)a3;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)sectionWithIdentifier:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_filteredNumberOfItemsGivenSection:(int64_t)a3 numberOfItems:(int64_t)a4;
- (int64_t)assistantCellPosition;
- (int64_t)assistantCellVisibility;
- (int64_t)numberOfEnhancedSections;
- (int64_t)numberOfItems;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (void)reloadItems:(id)a3;
- (void)sessionConfiguration:(id)a3 limitedUserInterfacesChanged:(unint64_t)a4;
- (void)setAssistantCellPosition:(int64_t)a3;
- (void)setAssistantCellTitle:(id)a3;
- (void)setAssistantCellVisibility:(int64_t)a3;
- (void)setSections:(id)a3;
- (void)setSessionConfiguration:(id)a3;
- (void)updateIndexPathForAssistantItem;
- (void)updateSections:(id)a3;
@end

@implementation CPSSectionedDataSource

- (CPSSectionedDataSource)initWithSections:(id)a3 templateEnvironment:(id)a4
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  v4 = v17;
  v17 = 0;
  v14.receiver = v4;
  v14.super_class = (Class)CPSSectionedDataSource;
  v13 = [(CPSDataSource *)&v14 init];
  v17 = v13;
  objc_storeStrong((id *)&v17, v13);
  if (v13)
  {
    v5 = (NSMutableArray *)(id)[MEMORY[0x263EFF980] arrayWithArray:location[0]];
    sections = v17->_sections;
    v17->_sections = v5;

    id v7 = objc_alloc(MEMORY[0x263EFCAA8]);
    uint64_t v8 = [v7 initWithDelegate:v17 templateEnvironment:v15];
    sessionConfiguration = v17->_sessionConfiguration;
    v17->_sessionConfiguration = (CPSessionConfiguration *)v8;

    objc_storeStrong((id *)&v17->_templateEnvironment, v15);
  }
  v11 = v17;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v11;
}

- (id)sectionAtIndex:(int64_t)a3
{
  if (self->_assistantCellIndexPath && ![(NSIndexPath *)self->_assistantCellIndexPath section]) {
    --a3;
  }
  v4 = [(CPSSectionedDataSource *)self sections];
  id v5 = (id)[(NSMutableArray *)v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (id)sectionWithIdentifier:(id)a3
{
  objc_super v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v9 = i;
    if (v9 >= [(CPSSectionedDataSource *)v14 numberOfSections]) {
      break;
    }
    id v5 = objc_opt_class();
    id v6 = (id)[(NSMutableArray *)v14->_sections objectAtIndexedSubscript:i];
    id v11 = CPSSafeCast_20(v5, v6);

    id v7 = (id)[v11 identifier];
    char v8 = [v7 isEqual:location[0]];

    if (v8)
    {
      id v15 = v11;
      int v10 = 1;
    }
    else
    {
      int v10 = 0;
    }
    objc_storeStrong(&v11, 0);
    if (v10) {
      goto LABEL_9;
    }
  }
  id v15 = 0;
LABEL_9:
  objc_storeStrong(location, 0);
  v3 = v15;

  return v3;
}

- (BOOL)showingAssistantInLastPosition
{
  BOOL v3 = 0;
  if (self->_assistantCellIndexPath) {
    return [(NSIndexPath *)self->_assistantCellIndexPath section] != 0;
  }
  return v3;
}

- (int64_t)numberOfEnhancedSections
{
  int v10 = self;
  SEL v9 = a2;
  int64_t v8 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v5 = i;
    if (v5 >= [(CPSSectionedDataSource *)v10 numberOfSections]) {
      break;
    }
    BOOL v3 = objc_opt_class();
    id v4 = (id)[(NSMutableArray *)v10->_sections objectAtIndexedSubscript:i];
    id location = CPSSafeCast_20(v3, v4);

    if ([location sectionHeaderStyle] == 2) {
      ++v8;
    }
    objc_storeStrong(&location, 0);
  }
  return v8;
}

- (int64_t)_filteredNumberOfItemsGivenSection:(int64_t)a3 numberOfItems:(int64_t)a4
{
  if (self->_assistantCellIndexPath && [(NSIndexPath *)self->_assistantCellIndexPath section] == a3) {
    return 1;
  }
  if (self->_limitingWithSections)
  {
    if (a3 >= self->_maxVisibleSection)
    {
      if (a3 == self->_maxVisibleSection) {
        return self->_numberOfVisibleItemsInLastSection;
      }
      else {
        return 0;
      }
    }
    else
    {
      return a4;
    }
  }
  else
  {
    if ([(CPSSectionedDataSource *)self isLimitingLists]) {
      int64_t v6 = 12;
    }
    else {
      int64_t v6 = a4;
    }
    if (a4 >= v6) {
      return v6;
    }
    else {
      return a4;
    }
  }
}

- (int64_t)numberOfSections
{
  unint64_t v5 = [(CPSSectionedDataSource *)self sections];
  uint64_t v6 = [(NSMutableArray *)v5 count];

  int64_t v13 = v6;
  self->_limitingWithSections = 0;
  if (self->_assistantCellIndexPath) {
    int64_t v13 = v6 + 1;
  }
  if (![(CPSSectionedDataSource *)self isLimitingLists]) {
    return v13;
  }
  if (v13 <= 1) {
    return v13;
  }
  self->_limitingWithSections = 1;
  self->_maxVisibleSection = 0;
  uint64_t v12 = 0;
  for (int64_t i = 0; ; ++i)
  {
    if (i >= v13)
    {
      self->_maxVisibleSection = 0x7FFFFFFFFFFFFFFFLL;
      return v13;
    }
    char v9 = 0;
    char v7 = 0;
    if (self->_assistantCellIndexPath && [(NSIndexPath *)self->_assistantCellIndexPath section] == i)
    {
      uint64_t v4 = 1;
    }
    else
    {
      id v10 = [(CPSSectionedDataSource *)self sectionAtIndex:i];
      char v9 = 1;
      id v8 = (id)[v10 items];
      char v7 = 1;
      uint64_t v4 = [v8 count];
    }
    if (v7) {

    }
    if (v9) {
    if (v12 + v4 == 12)
    }
    {
      self->_maxVisibleSection = i;
      if ([(CPSSectionedDataSource *)self showingAssistantInLastPosition]) {
        int64_t v3 = 11 - v12;
      }
      else {
        int64_t v3 = v4;
      }
      self->_numberOfVisibleItemsInLastSection = v3;
      if ([(CPSSectionedDataSource *)self showingAssistantInLastPosition]) {
        return i + 2;
      }
      else {
        return i + 1;
      }
    }
    if ((unint64_t)(v12 + v4) > 0xC) {
      break;
    }
    v12 += v4;
  }
  self->_maxVisibleSection = i;
  self->_numberOfVisibleItemsInLastSection = 12 - v12;
  if ([(CPSSectionedDataSource *)self showingAssistantInLastPosition]) {
    --self->_numberOfVisibleItemsInLastSection;
  }
  if ([(CPSSectionedDataSource *)self showingAssistantInLastPosition]) {
    return i + 2;
  }
  else {
    return i + 1;
  }
}

- (int64_t)numberOfItems
{
  unint64_t v5 = [(CPSSectionedDataSource *)self numberOfSections];
  int64_t v4 = 0;
  for (unint64_t i = 0; i < v5; ++i)
    v4 += [(CPSSectionedDataSource *)self numberOfItemsInSection:i];
  return v4;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  char v9 = self;
  SEL v8 = a2;
  int64_t v7 = a3;
  if (self->_assistantCellIndexPath && [(NSIndexPath *)v9->_assistantCellIndexPath section] == v7) {
    return 1;
  }
  id v6 = [(CPSSectionedDataSource *)v9 sectionAtIndex:v7];
  id v4 = (id)[v6 items];
  uint64_t v5 = [v4 count];

  int64_t v10 = [(CPSSectionedDataSource *)v9 _filteredNumberOfItemsGivenSection:v7 numberOfItems:v5];
  objc_storeStrong(&v6, 0);
  return v10;
}

- (id)firstItemIndexPath
{
  for (unint64_t i = 0; i < [(CPSSectionedDataSource *)self numberOfSections]; ++i)
  {
    if ([(CPSSectionedDataSource *)self numberOfItemsInSection:i] > 0)
    {
      id v5 = (id)[MEMORY[0x263F088C8] indexPathForRow:0 inSection:i];
      goto LABEL_7;
    }
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (id)itemAtIndexPath:(id)a3
{
  int64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v10->_assistantCellIndexPath
    && ([(NSIndexPath *)v10->_assistantCellIndexPath isEqual:location[0]] & 1) != 0)
  {
    id v11 = 0;
    int v8 = 1;
  }
  else
  {
    id v7 = -[CPSSectionedDataSource sectionAtIndex:](v10, "sectionAtIndex:", [location[0] section]);
    uint64_t v6 = [location[0] section];
    if (v6 >= [(CPSSectionedDataSource *)v10 numberOfSections]
      || (uint64_t v5 = [location[0] row],
          v5 >= -[CPSSectionedDataSource numberOfItemsInSection:](v10, "numberOfItemsInSection:", [location[0] section])))
    {
      id v11 = 0;
      int v8 = 1;
    }
    else
    {
      id v11 = (id)objc_msgSend(v7, "itemAtIndex:", objc_msgSend(location[0], "row"));
      int v8 = 1;
    }
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(location, 0);
  int64_t v3 = v11;

  return v3;
}

- (id)indexPathForItemWithIdentifier:(id)a3
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v10 = i;
    if (v10 >= [(CPSSectionedDataSource *)v16 numberOfSections]) {
      break;
    }
    if (v16->_assistantCellIndexPath)
    {
      uint64_t v3 = [(NSIndexPath *)v16->_assistantCellIndexPath section];
      if (v3 == i)
      {
        id v17 = 0;
        int v13 = 1;
        goto LABEL_15;
      }
    }
    id v12 = [(CPSSectionedDataSource *)v16 sectionAtIndex:i];
    for (unint64_t j = 0; j < [(CPSSectionedDataSource *)v16 numberOfItemsInSection:i]; ++j)
    {
      id v8 = (id)[v12 items];
      id v7 = (id)[v8 objectAtIndexedSubscript:j];
      id v6 = CPListItemIdentifier_0(v7);
      char v9 = [v6 isEqual:location[0]];

      if (v9)
      {
        id v17 = (id)[MEMORY[0x263F088C8] indexPathForRow:j inSection:i];
        int v13 = 1;
        goto LABEL_12;
      }
    }
    int v13 = 0;
LABEL_12:
    objc_storeStrong(&v12, 0);
    if (v13) {
      goto LABEL_15;
    }
  }
  id v17 = 0;
  int v13 = 1;
LABEL_15:
  objc_storeStrong(location, 0);
  id v4 = v17;

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  int v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  if ([v11 isEqual:v13->_assistantCellIndexPath])
  {
    id v6 = [(CPSDataSource *)v13 tableView];
    id v10 = +[_CPUIBaseTableCell cellForTableView:](CPSAssistantCell, "cellForTableView:");

    [v10 configureWithText:v13->_assistantCellTitle];
    id v14 = v10;
    int v9 = 1;
    objc_storeStrong(&v10, 0);
  }
  else
  {
    v8.receiver = v13;
    v8.super_class = (Class)CPSSectionedDataSource;
    id v14 = [(CPSDataSource *)&v8 tableView:location[0] cellForRowAtIndexPath:v11];
    int v9 = 1;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  id v4 = v14;

  return v4;
}

- (id)_sanitizedSectionIndexTitleForTitle:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] length])
  {
    uint64_t v3 = [location[0] rangeOfComposedCharacterSequenceAtIndex:0];
    id v8 = (id)objc_msgSend(location[0], "substringWithRange:", v3, v4);
  }
  else
  {
    id v8 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v5 = v8;

  return v5;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = (id)[MEMORY[0x263EFF980] array];
  unint64_t v11 = [(CPSSectionedDataSource *)v14 numberOfSections];
  for (unint64_t i = 0; i < v11; ++i)
  {
    if (v14->_assistantCellIndexPath)
    {
      uint64_t v3 = [(NSIndexPath *)v14->_assistantCellIndexPath section];
      if (v3 == i) {
        continue;
      }
    }
    id v9 = [(CPSSectionedDataSource *)v14 sectionAtIndex:i];
    id v6 = v14;
    id v7 = (id)[v9 sectionIndexTitle];
    id v8 = -[CPSSectionedDataSource _sanitizedSectionIndexTitleForTitle:](v6, "_sanitizedSectionIndexTitleForTitle:");

    if (v8) {
      [v12 addObject:v8];
    }
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  id v5 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  int64_t v19 = a5;
  v18 = [(CPSSectionedDataSource *)v22 numberOfSections];
  int64_t v17 = 0;
  id v9 = [(CPSSectionedDataSource *)v22 sections];
  uint64_t v11 = MEMORY[0x263EF8330];
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = __72__CPSSectionedDataSource_tableView_sectionForSectionIndexTitle_atIndex___block_invoke;
  id v15 = &unk_2648A5740;
  v16[1] = v18;
  v16[0] = v20;
  uint64_t v10 = [(NSMutableArray *)v9 indexOfObjectPassingTest:&v11];

  int64_t v17 = v10;
  if (v22->_assistantCellIndexPath && ![(NSIndexPath *)v22->_assistantCellIndexPath section]) {
    ++v17;
  }
  int64_t v6 = v17;
  objc_storeStrong(v16, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v6;
}

uint64_t __72__CPSSectionedDataSource_tableView_sectionForSectionIndexTitle_atIndex___block_invoke(void *a1, void *a2, unint64_t a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v7 = 0;
  char v6 = 0;
  if (a3 < a1[5])
  {
    id v8 = (id)[location[0] sectionIndexTitle];
    char v7 = 1;
    char v6 = [v8 isEqualToString:a1[4]];
  }
  char v10 = v6 & 1;
  if (v7) {

  }
  objc_storeStrong(location, 0);
  return v10 & 1;
}

- (void)updateSections:(id)a3
{
  char v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = (NSMutableArray *)(id)[MEMORY[0x263EFF980] arrayWithArray:location[0]];
  sections = v6->_sections;
  v6->_sections = v3;

  [(CPSDataSource *)v6 reloadData];
  objc_storeStrong(location, 0);
}

- (void)reloadItems:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = (id)[MEMORY[0x263EFF980] array];
  uint64_t v11 = 0;
  int v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 1;
  id v3 = location[0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  char v7 = __38__CPSSectionedDataSource_reloadItems___block_invoke;
  id v8 = &unk_2648A5768;
  id v9 = v18;
  v10[0] = v16;
  v10[1] = &v11;
  [v3 enumerateObjectsUsingBlock:&v4];
  if ((v12[3] & 1) != 0 && [v16 count]) {
    [(CPSDataSource *)v18 reloadItemsAtIndexPaths:v16];
  }
  else {
    [(CPSDataSource *)v18 reloadData];
  }
  objc_storeStrong(v10, 0);
  objc_storeStrong((id *)&v9, 0);
  _Block_object_dispose(&v11, 8);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void __38__CPSSectionedDataSource_reloadItems___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12[3] = a3;
  v12[2] = a4;
  v12[1] = (id)a1;
  v12[0] = CPListItemIdentifier_0(location[0]);
  id v11 = (id)[*(id *)(a1 + 32) indexPathForItemWithIdentifier:v12[0]];
  if (v11)
  {
    id v10 = (id)objc_msgSend(*(id *)(a1 + 32), "sectionAtIndex:", objc_msgSend(v11, "section"));
    id v5 = v10;
    uint64_t v4 = [v11 row];
    [v5 replaceItemAtIndex:v4 withItem:location[0]];
    [*(id *)(a1 + 40) addObject:v11];
    objc_storeStrong(&v10, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v14, (uint64_t)location[0]);
      _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "Unable to match an index path for %@", v14, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isLimitingLists
{
  id v3 = [(CPSSectionedDataSource *)self sessionConfiguration];
  BOOL v4 = ([(CPSessionConfiguration *)v3 limitedUserInterfaces] & 2) == 2;

  return v4;
}

- (void)sessionConfiguration:(id)a3 limitedUserInterfacesChanged:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v7 = a4;
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (id)[NSNumber numberWithUnsignedInteger:v7];
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)v4);
    _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "Limited user interface changed to %@", v10, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(CPSSectionedDataSource *)v9 updateIndexPathForAssistantItem];
  [(CPSDataSource *)v9 reloadData];
  objc_storeStrong(location, 0);
}

- (void)setAssistantCellPosition:(int64_t)a3
{
  if (self->_assistantCellPosition != a3)
  {
    self->_assistantCellPosition = a3;
    [(CPSSectionedDataSource *)self updateIndexPathForAssistantItem];
  }
}

- (void)setAssistantCellVisibility:(int64_t)a3
{
  if (self->_assistantCellVisibility != a3)
  {
    self->_assistantCellVisibility = a3;
    [(CPSSectionedDataSource *)self updateIndexPathForAssistantItem];
  }
}

- (void)setAssistantCellTitle:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (![(NSString *)v4->_assistantCellTitle isEqualToString:location[0]]) {
    objc_storeStrong((id *)&v4->_assistantCellTitle, location[0]);
  }
  objc_storeStrong(location, 0);
}

- (void)updateIndexPathForAssistantItem
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = (id)[(NSIndexPath *)self->_assistantCellIndexPath copy];
  if (([(CPSTemplateEnvironment *)v5->_templateEnvironment hasAudioEntitlement]
     || [(CPSTemplateEnvironment *)v5->_templateEnvironment hasCommunicationEntitlement])
    && (v5->_assistantCellVisibility == 2
     || v5->_assistantCellVisibility == 1 && [(CPSSectionedDataSource *)v5 isLimitingLists]))
  {
    if (v5->_assistantCellPosition)
    {
      objc_storeStrong((id *)&v5->_assistantCellIndexPath, 0);
      v2 = (NSIndexPath *)(id)objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", 0, -[CPSSectionedDataSource numberOfSections](v5, "numberOfSections"));
    }
    else
    {
      v2 = (NSIndexPath *)(id)objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", 0);
    }
    assistantCellIndexPath = v5->_assistantCellIndexPath;
    v5->_assistantCellIndexPath = v2;
  }
  else
  {
    objc_storeStrong((id *)&v5->_assistantCellIndexPath, 0);
  }
  if (([(NSIndexPath *)v5->_assistantCellIndexPath isEqual:location[0]] & 1) == 0) {
    [(CPSDataSource *)v5 reloadData];
  }
  objc_storeStrong(location, 0);
}

- (NSIndexPath)assistantCellIndexPath
{
  return self->_assistantCellIndexPath;
}

- (CPSTemplateEnvironment)templateEnvironment
{
  return self->_templateEnvironment;
}

- (int64_t)assistantCellVisibility
{
  return self->_assistantCellVisibility;
}

- (int64_t)assistantCellPosition
{
  return self->_assistantCellPosition;
}

- (NSString)assistantCellTitle
{
  return self->_assistantCellTitle;
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (CPSessionConfiguration)sessionConfiguration
{
  return self->_sessionConfiguration;
}

- (void)setSessionConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end