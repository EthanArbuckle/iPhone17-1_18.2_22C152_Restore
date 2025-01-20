@interface STStorageFPFSController
- (BOOL)areCollectionsLoaded;
- (BOOL)confirmDelete;
- (BOOL)hideEdit;
- (BOOL)isCloud;
- (BOOL)pinnedOnly;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (FPItemCollection)collection;
- (NSArray)fpItems;
- (NSMutableDictionary)specsByItemID;
- (id)createCollection;
- (id)itemSpecifiers;
- (id)specifierAtIndexPath:(id)a3;
- (id)specifiers;
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
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation STStorageFPFSController

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
  v4.receiver = self;
  v4.super_class = (Class)STStorageFPFSController;
  [(STStorageFPFSController *)&v4 viewWillAppear:a3];
  [(FPItemCollection *)self->_collection startObserving];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(FPItemCollection *)self->_collection stopObserving];
  v5.receiver = self;
  v5.super_class = (Class)STStorageFPFSController;
  [(STStorageFPFSController *)&v5 viewWillDisappear:v3];
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
  if (!self->_collection)
  {
    BOOL v3 = [*(id *)&self->PSEditableListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:STStorageFPItemKey];
    objc_super v4 = v3;
    if (v3)
    {
      objc_super v5 = [v3 childItemCount];
      if (![v5 longValue] || (objc_msgSend(v4, "capabilities") & 1) == 0)
      {

LABEL_8:
LABEL_18:
        id v16 = &__NSArray0__struct;
        goto LABEL_52;
      }
      v8 = +[FPItemManager defaultManager];
      v9 = [v8 collectionForFolderItem:v4];
      collection = self->_collection;
      self->_collection = v9;
    }
    else
    {
      v6 = [(STStorageFPFSController *)self createCollection];
      v7 = self->_collection;
      self->_collection = v6;

      if (!self->_collection)
      {
        NSLog(@"No item collection was provided by FPFSController");
        goto LABEL_8;
      }
    }
    if (qword_3A4F8 != -1) {
      dispatch_once(&qword_3A4F8, &stru_2CA68);
    }
    [(FPItemCollection *)self->_collection reorderItemsWithSortDescriptors:qword_3A500];
    [(FPItemCollection *)self->_collection setDelegate:self];
    [(FPItemCollection *)self->_collection startObserving];
  }
  uint64_t v11 = OBJC_IVAR___PSListController__specifiers;
  v12 = *(void **)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v12) {
    goto LABEL_51;
  }
  v13 = [*(id *)&self->PSEditableListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:STStorageFPItemKey];
  v14 = v13;
  if (v13)
  {
    v15 = [v13 childItemCount];
    if (![v15 longValue] || (objc_msgSend(v14, "capabilities") & 1) == 0)
    {

      goto LABEL_18;
    }
  }
  v51 = v14;
  uint64_t v52 = v11;
  v17 = self->_fpItems;
  v18 = [(NSArray *)v17 count];
  v53 = self;
  v55 = self->_specsByItemID;
  v50 = +[NSMutableArray arrayWithCapacity:v18 + 1];
  v56 = +[NSMutableArray arrayWithCapacity:v18];
  v19 = +[NSMutableArray arrayWithCapacity:v18];
  v54 = +[NSMutableDictionary dictionaryWithCapacity:v18];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v20 = v17;
  id v21 = [(NSArray *)v20 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (!v21) {
    goto LABEL_38;
  }
  id v22 = v21;
  uint64_t v23 = *(void *)v58;
  do
  {
    for (i = 0; i != v22; i = (char *)i + 1)
    {
      if (*(void *)v58 != v23) {
        objc_enumerationMutation(v20);
      }
      v25 = *(void **)(*((void *)&v57 + 1) + 8 * i);
      unsigned __int8 v26 = [v25 capabilities];
      unsigned __int8 v27 = [v25 capabilities];
      unsigned __int8 v28 = [v25 capabilities];
      v29 = [v25 childItemCount];
      v30 = v29;
      uint64_t v31 = v28 & 0x10;
      uint64_t v32 = v27 & 0x40;
      if (v29)
      {
        uint64_t v33 = v32 | v31;
        if (![v29 intValue] || !(v33 & 0xFFFFFFFFFFFFFFFELL | v26 & 1)) {
          goto LABEL_36;
        }
      }
      else if (!(v32 | v31))
      {
        goto LABEL_36;
      }
      v34 = [v25 itemID];
      v35 = [(NSMutableDictionary *)v55 objectForKey:v34];

      if (!v35)
      {
        v35 = +[STStorageFPItemCell specifierForFPItem:v25 recurseIntoFolders:!v53->_pinnedOnly];
        [v35 setDetailControllerClass:objc_opt_class()];
      }
      if ([v25 isTrashed]) {
        v36 = v19;
      }
      else {
        v36 = v56;
      }
      [v36 addObject:v35];
      v37 = [v25 itemID];
      [(NSMutableDictionary *)v54 setObject:v35 forKey:v37];

LABEL_36:
    }
    id v22 = [(NSArray *)v20 countByEnumeratingWithState:&v57 objects:v61 count:16];
  }
  while (v22);
LABEL_38:

  [v50 addObjectsFromArray:v56];
  if ([v19 count])
  {
    v38 = STStorageLocStr(@"TRASH");
    v39 = +[PSSpecifier preferenceSpecifierNamed:v38 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v39 setProperty:@"STStorageButtonHeader" forKey:PSHeaderCellClassGroupKey];
    v40 = STStorageLocStr(@"EMPTY_TRASH");
    [v39 setProperty:v40 forKey:@"stButtonTitle"];

    [v39 setTarget:v53];
    [v39 setButtonAction:"emptyTrash"];
    [v50 addObject:v39];
    [v50 addObjectsFromArray:v19];
  }
  v53->_hideEdit = [v50 count] == 0;
  -[STStorageFPFSController setEditingButtonHidden:animated:](v53, "setEditingButtonHidden:animated:");
  if (![v50 count])
  {
    if (v53->_areCollectionsLoaded)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v41 = @"NO_LOCAL_ITEMS";
      }
      else
      {
        unsigned int v43 = [(STStorageFPFSController *)v53 pinnedOnly];
        v44 = @"NO_UNSYNC_ITEMS";
        if (v43) {
          v44 = @"NO_PINNED_ITEMS";
        }
        v41 = v44;
      }
      v45 = STStorageLocStr(v41);
      v42 = +[STStorageMessageItemCell specifierWithTitle:v45];

      [v42 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    }
    else
    {
      v42 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D2C0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
    }
    [v50 addObject:v42];
  }
  specsByItemID = v53->_specsByItemID;
  v53->_specsByItemID = v54;
  v47 = v54;

  v48 = *(void **)&v53->PSEditableListController_opaque[v52];
  *(void *)&v53->PSEditableListController_opaque[v52] = v50;

  v12 = *(void **)&v53->PSEditableListController_opaque[v52];
LABEL_51:
  id v16 = v12;
LABEL_52:

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
  objc_super v4 = [(STStorageFPFSController *)self specifierAtIndexPath:a4];

  return v4 != 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  if ([(STStorageFPFSController *)self pinnedOnly]) {
    objc_super v4 = @"UNPIN";
  }
  else {
    objc_super v4 = @"DELETE";
  }
  objc_super v5 = STStorageLocStr(v4);

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
    v6 = [(STStorageFPFSController *)self specifierAtIndexPath:a5];
    uint64_t v7 = [v6 propertyForKey:STStorageFPItemKey];
    v8 = (void *)v7;
    if (v7)
    {
      uint64_t v10 = v7;
      v9 = +[NSArray arrayWithObjects:&v10 count:1];
      [(STStorageFPFSController *)self deleteItems:v9];
    }
  }
}

- (void)emptyTrash
{
  BOOL v3 = [(FPItemCollection *)self->_collection items];
  objc_super v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v5 = [(FPItemCollection *)self->_collection items];
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
        if ([v10 isTrashed]) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(STStorageFPFSController *)self deleteItems:v4];
}

- (void)reloadSpecs
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5444;
  block[3] = &unk_2CA90;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  objc_super v4 = [a3 items];
  objc_super v5 = +[NSArray arrayWithArray:v4];
  [(STStorageFPFSController *)self setFpItems:v5];

  self->_areCollectionsLoaded = 1;

  [(STStorageFPFSController *)self reloadSpecs];
}

- (FPItemCollection)collection
{
  return (FPItemCollection *)objc_getProperty(self, a2, 192, 1);
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
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setFpItems:(id)a3
{
}

- (NSMutableDictionary)specsByItemID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 208, 1);
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
  objc_storeStrong((id *)&self->_specsByItemID, 0);
  objc_storeStrong((id *)&self->_fpItems, 0);

  objc_storeStrong((id *)&self->_collection, 0);
}

@end