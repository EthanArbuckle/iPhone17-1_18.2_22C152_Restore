@interface STStorageFPFSController
- (BOOL)areCollectionsLoaded;
- (BOOL)confirmDelete;
- (BOOL)hideEdit;
- (BOOL)isCloud;
- (BOOL)pinnedOnly;
- (BOOL)shouldShowItem:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (FPItemCollection)collection;
- (NSArray)fpItems;
- (NSMutableDictionary)specsByItemID;
- (id)createCollection;
- (id)itemSpecifiers;
- (id)specifierAtIndexPath:(id)a3;
- (id)specifiers;
- (id)storageApp;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)dataForCollectionShouldBeReloaded:(id)a3;
- (void)emptyTrash;
- (void)reloadSpecs;
- (void)setAreCollectionsLoaded:(BOOL)a3;
- (void)setCollection:(id)a3;
- (void)setConfirmDelete:(BOOL)a3;
- (void)setFpItems:(id)a3;
- (void)setHideEdit:(BOOL)a3;
- (void)setIsCloud:(BOOL)a3;
- (void)setPinnedOnly:(BOOL)a3;
- (void)setSpecsByItemID:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)toggleEditing:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation STStorageFPFSController

- (id)storageApp
{
  v4.receiver = self;
  v4.super_class = (Class)STStorageFPFSController;
  v2 = [(STStorageDetailViewController *)&v4 storageApp];

  return v2;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)STStorageFPFSController;
  [(STStorageFPFSController *)&v4 viewDidLoad];
  v3 = [(STStorageFPFSController *)self table];
  [v3 setAllowsMultipleSelectionDuringEditing:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STStorageFPFSController;
  [(STStorageFPFSController *)&v6 viewWillAppear:a3];
  [*(id *)(&self->_hideEdit + 2) startObserving];
  objc_super v4 = [(STStorageFPFSController *)self editButtonItem];
  [v4 setTarget:self];

  v5 = [(STStorageFPFSController *)self editButtonItem];
  [v5 setAction:"toggleEditing:"];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [*(id *)(&self->_hideEdit + 2) stopObserving];
  v5.receiver = self;
  v5.super_class = (Class)STStorageFPFSController;
  [(STStorageFPFSController *)&v5 viewWillDisappear:v3];
}

- (void)toggleEditing:(id)a3
{
  uint64_t v4 = [(STStorageFPFSController *)self isEditing] ^ 1;
  [(STStorageFPFSController *)self setEditing:v4];
  id v5 = [(STStorageFPFSController *)self table];
  [v5 setEditing:v4];
}

- (id)itemSpecifiers
{
  return +[NSMutableArray array];
}

- (id)createCollection
{
  return 0;
}

- (id)specifiers
{
  if (!*(void *)(&self->_hideEdit + 2))
  {
    BOOL v3 = [*(id *)&self->super.PSEditableListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:STStorageFPItemKey];
    uint64_t v4 = v3;
    if (v3)
    {
      id v5 = [v3 childItemCount];
      if (![v5 longValue] || (objc_msgSend(v4, "capabilities") & 1) == 0)
      {

LABEL_8:
LABEL_18:
        id v16 = &__NSArray0__struct;
        goto LABEL_49;
      }
      v8 = +[FPItemManager defaultManager];
      uint64_t v9 = [v8 collectionForFolderItem:v4];
      v10 = *(void **)(&self->_hideEdit + 2);
      *(void *)(&self->_hideEdit + 2) = v9;
    }
    else
    {
      uint64_t v6 = [(STStorageFPFSController *)self createCollection];
      v7 = *(void **)(&self->_hideEdit + 2);
      *(void *)(&self->_hideEdit + 2) = v6;

      if (!*(void *)(&self->_hideEdit + 2))
      {
        NSLog(@"No item collection was provided by FPFSController");
        goto LABEL_8;
      }
    }
    if (qword_A4C20 != -1) {
      dispatch_once(&qword_A4C20, &stru_96780);
    }
    [*(id *)(&self->_hideEdit + 2) reorderItemsWithSortDescriptors:qword_A4C28];
    [*(id *)(&self->_hideEdit + 2) setDelegate:self];
    [*(id *)(&self->_hideEdit + 2) startObserving];
  }
  uint64_t v11 = OBJC_IVAR___PSListController__specifiers;
  v12 = *(void **)&self->super.PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v12)
  {
    v13 = [*(id *)&self->super.PSEditableListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:STStorageFPItemKey];
    v14 = v13;
    if (v13)
    {
      v15 = [v13 childItemCount];
      if (![v15 longValue] || (objc_msgSend(v14, "capabilities") & 1) == 0)
      {

        goto LABEL_18;
      }
    }
    v46 = v14;
    uint64_t v47 = v11;
    id v17 = *(id *)((char *)&self->_collection + 6);
    v18 = (char *)[v17 count];
    id v48 = *(id *)((char *)&self->_fpItems + 6);
    v45 = +[NSMutableArray arrayWithCapacity:v18 + 1];
    v49 = +[NSMutableArray arrayWithCapacity:v18];
    v19 = +[NSMutableArray arrayWithCapacity:v18];
    v20 = +[NSMutableDictionary dictionaryWithCapacity:v18];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v21 = v17;
    id v22 = [v21 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v51;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v51 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if ([(STStorageFPFSController *)self shouldShowItem:v26])
          {
            v27 = [v26 itemID];
            v28 = [v48 objectForKey:v27];

            if (!v28)
            {
              v28 = +[STStorageFPItemCell specifierForFPItem:v26 recurseIntoFolders:!self->_pinnedOnly];
              [v28 setDetailControllerClass:objc_opt_class()];
            }
            if ([v26 isTrashed]) {
              v29 = v19;
            }
            else {
              v29 = v49;
            }
            [v29 addObject:v28];
            v30 = [v26 itemID];
            [(NSArray *)v20 setObject:v28 forKey:v30];
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v50 objects:v54 count:16];
      }
      while (v23);
    }

    [v45 addObjectsFromArray:v49];
    if ([v19 count])
    {
      v31 = STLocalizedString(@"Trash");
      v32 = +[PSSpecifier preferenceSpecifierNamed:v31 target:0 set:0 get:0 detail:0 cell:0 edit:0];

      [v32 setProperty:@"STStorageButtonHeader" forKey:PSHeaderCellClassGroupKey];
      v33 = STLocalizedString(@"Empty Trash");
      [v32 setProperty:v33 forKey:@"stButtonTitle"];

      [v32 setTarget:self];
      [v32 setButtonAction:"emptyTrash"];
      [v45 addObject:v32];
      [v45 addObjectsFromArray:v19];
    }
    self->_hideEdit = [v45 count] == 0;
    -[STStorageFPFSController setEditingButtonHidden:animated:](self, "setEditingButtonHidden:animated:");
    id v34 = [v45 count];
    v35 = [(STStorageFPFSController *)self parentViewController];
    v36 = [v35 navigationItem];
    v37 = v36;
    if (v34)
    {
      v38 = [(STStorageFPFSController *)self editButtonItem];
      [v37 setRightBarButtonItem:v38];
    }
    else
    {
      [v36 setRightBarButtonItem:0];

      if (self->_areCollectionsLoaded)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v39 = @"No items";
        }
        else if ([(STStorageFPFSController *)self pinnedOnly])
        {
          v39 = @"No items are pinned";
        }
        else
        {
          v39 = @"No items are waiting for upload";
        }
        v40 = STLocalizedString(v39);
        v35 = +[STStorageMessageItemCell specifierWithTitle:v40];
        [v35 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
      }
      else
      {
        v35 = +[PSSpecifier preferenceSpecifierNamed:&stru_98A78 target:0 set:0 get:0 detail:0 cell:15 edit:0];
      }
      [v45 addObject:v35];
    }

    v41 = *(NSArray **)((char *)&self->_fpItems + 6);
    *(NSArray **)((char *)&self->_fpItems + 6) = v20;
    v42 = v20;

    v43 = *(void **)&self->super.PSEditableListController_opaque[v47];
    *(void *)&self->super.PSEditableListController_opaque[v47] = v45;

    v12 = *(void **)&self->super.PSEditableListController_opaque[v47];
  }
  id v16 = v12;
LABEL_49:

  return v16;
}

- (id)specifierAtIndexPath:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStorageFPFSController;
  BOOL v3 = [(STStorageFPFSController *)&v5 specifierAtIndexPath:a3];

  return v3;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  uint64_t v4 = [(STStorageFPFSController *)self specifierAtIndexPath:a4];

  return v4 != 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  if ([(STStorageFPFSController *)self pinnedOnly]) {
    uint64_t v4 = @"Unpin";
  }
  else {
    uint64_t v4 = @"Delete";
  }
  objc_super v5 = STLocalizedString(v4);

  return v5;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return !self->_hideEdit;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    uint64_t v6 = [(STStorageFPFSController *)self specifierAtIndexPath:a5];
    uint64_t v7 = [v6 propertyForKey:STStorageFPItemKey];
    v8 = (void *)v7;
    if (v7)
    {
      uint64_t v10 = v7;
      uint64_t v9 = +[NSArray arrayWithObjects:&v10 count:1];
      [(STStorageFPFSController *)self deleteItems:v9];
    }
  }
}

- (void)emptyTrash
{
  BOOL v3 = [*(id *)(&self->_hideEdit + 2) items];
  uint64_t v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v5 = objc_msgSend(*(id *)(&self->_hideEdit + 2), "items", 0);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([(STStorageFPFSController *)self shouldShowItem:v10]
          && [v10 isTrashed])
        {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(STStorageFPFSController *)self deleteItems:v4];
}

- (BOOL)shouldShowItem:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 capabilities];
  unsigned __int8 v5 = [v3 capabilities];
  unsigned __int8 v6 = [v3 capabilities];
  id v7 = [v3 childItemCount];

  if (v7)
  {
    if (![v7 intValue] || (v5 & 0x40) == 0 && (v6 & 0x10) == 0 && (v4 & 1) == 0) {
      goto LABEL_6;
    }
LABEL_8:
    BOOL v8 = 1;
    goto LABEL_9;
  }
  if (v5 & 0x40 | (unint64_t)(v6 & 0x10)) {
    goto LABEL_8;
  }
LABEL_6:
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

- (void)reloadSpecs
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12510;
  block[3] = &unk_962A8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  unsigned __int8 v4 = [a3 items];
  unsigned __int8 v5 = +[NSArray arrayWithArray:v4];
  [(STStorageFPFSController *)self setFpItems:v5];

  self->_areCollectionsLoaded = 1;

  [(STStorageFPFSController *)self reloadSpecs];
}

- (FPItemCollection)collection
{
  return (FPItemCollection *)objc_getProperty(self, a2, 206, 1);
}

- (void)setCollection:(id)a3
{
}

- (BOOL)confirmDelete
{
  return self->_confirmDelete;
}

- (void)setConfirmDelete:(BOOL)a3
{
  self->_confirmDelete = a3;
}

- (NSArray)fpItems
{
  return (NSArray *)objc_getProperty(self, a2, 214, 1);
}

- (void)setFpItems:(id)a3
{
}

- (NSMutableDictionary)specsByItemID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 222, 1);
}

- (void)setSpecsByItemID:(id)a3
{
}

- (BOOL)areCollectionsLoaded
{
  return self->_areCollectionsLoaded;
}

- (void)setAreCollectionsLoaded:(BOOL)a3
{
  self->_areCollectionsLoaded = a3;
}

- (BOOL)isCloud
{
  return self->_isCloud;
}

- (void)setIsCloud:(BOOL)a3
{
  self->_isCloud = a3;
}

- (BOOL)pinnedOnly
{
  return self->_pinnedOnly;
}

- (void)setPinnedOnly:(BOOL)a3
{
  self->_pinnedOnly = a3;
}

- (BOOL)hideEdit
{
  return self->_hideEdit;
}

- (void)setHideEdit:(BOOL)a3
{
  self->_hideEdit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_fpItems + 6), 0);
  objc_storeStrong((id *)((char *)&self->_collection + 6), 0);

  objc_storeStrong((id *)(&self->_hideEdit + 2), 0);
}

@end