@interface RestoreFromBackupController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)_largerThanStandardAX;
- (BOOL)_showAllFooterPresent;
- (BOOL)controllerNeedsToRun;
- (BOOL)scanningForUpdate;
- (BYSoftwareUpdateCache)softwareUpdateCache;
- (BuddyBetaEnrollmentStateManager)betaEnrollmentStateManager;
- (BuddyEnrollmentCoordinator)enrollmentCoordinator;
- (BuddyNetworkProvider)networkProvider;
- (BuddyPendingRestoreState)pendingRestoreState;
- (NSString)availableUpdateVersion;
- (OBAnimationController)animationController;
- (ProximitySetupController)proximitySetupController;
- (RestorableBackupItem)selectedRestorable;
- (RestoreFromBackupController)init;
- (UITableView)backupsTableView;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)filteredRestorableItemsFromBackupList:(id)a3;
- (id)mostSimilarRestorablesInsertRemainingIntoArray:(id)a3 getOtherUniqueDevicesCount:(unint64_t *)a4;
- (id)restorableItemAtIndexPath:(id)a3;
- (id)showModalWiFiSettingsBlock;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4;
- (unint64_t)_backupListErrorSectionCount;
- (unint64_t)_noBackupsFoundSectionCount;
- (void)_presentNetworkWarningForRestorable:(id)a3 completion:(id)a4;
- (void)_updateTable:(id)a3 toMatchArray:(id)a4 withVisibleArray:(id)a5 maxVisible:(unint64_t)a6 fromOldSection:(int64_t)a7 toNewSection:(int64_t)a8;
- (void)cancelRestoreAndRemovePrimaryAppleAccount;
- (void)dealloc;
- (void)handleDebugGesture;
- (void)refreshBackupListFromTimer:(id)a3;
- (void)scanForUpdateIfNecessaryForBackupList:(id)a3 withCompletion:(id)a4;
- (void)setAnimationController:(id)a3;
- (void)setAvailableUpdateVersion:(id)a3;
- (void)setBackupList:(id)a3 forceReload:(BOOL)a4 withError:(id)a5;
- (void)setBackupsTableView:(id)a3;
- (void)setBetaEnrollmentStateManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnrollmentCoordinator:(id)a3;
- (void)setListState:(int)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setPendingRestoreState:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRefreshTimerToDuration:(double)a3;
- (void)setScanningForUpdate:(BOOL)a3;
- (void)setSelectedRestorable:(id)a3;
- (void)setShowModalWiFiSettingsBlock:(id)a3;
- (void)setSoftwareUpdateCache:(id)a3;
- (void)setupWithAlternateChoice:(id)a3;
- (void)showAllBackups;
- (void)showRestoreWarningsIfNeededForRestorable:(id)a3 completion:(id)a4;
- (void)significantTimeChange;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateBackupListCompletion:(id)a3;
- (void)updateListStateWithReload:(BOOL)a3;
- (void)updateVisibleSnapshots;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation RestoreFromBackupController

- (RestoreFromBackupController)init
{
  SEL v23 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"CHOOSE_BACKUP" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
  v5 = +[NSBundle mainBundle];
  v6 = [(NSBundle *)v5 localizedStringForKey:@"CHOOSE_BACKUP_DETAILED" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
  id location = 0;
  v22.receiver = self;
  v22.super_class = (Class)RestoreFromBackupController;
  id location = [(RestoreFromBackupController *)&v22 initWithTitle:v4 detailText:v6 icon:0 adoptTableViewScrollView:1];
  objc_storeStrong(&location, location);

  if (location)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.setup.backup_list", 0);
    v8 = (void *)*((void *)location + 8);
    *((void *)location + 8) = v7;

    id v9 = objc_alloc_init((Class)MBManager);
    v10 = (void *)*((void *)location + 1);
    *((void *)location + 1) = v9;

    id v11 = objc_alloc_init((Class)NSMutableArray);
    v12 = (void *)*((void *)location + 6);
    *((void *)location + 6) = v11;

    id v13 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v14 = (void *)*((void *)location + 21);
    *((void *)location + 21) = v13;

    double v15 = sub_10009D44C();
    [*((id *)location + 21) setDirectionalLayoutMargins:v15, v16, v17, v18, *(void *)&v15, *(void *)&v16, *(void *)&v17, *(void *)&v18, *(void *)&v15, *(void *)&v16, *(void *)&v17, *(void *)&v18];
    [*((id *)location + 21) setDelegate:location];
    [*((id *)location + 21) setDataSource:location];
    [*((id *)location + 21) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)location + 21) _setDrawsSeparatorAtTopOfSections:1];
    [*((id *)location + 21) setEstimatedRowHeight:60.0];
    [location setListState:0];
    v19 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v19 addObserver:location selector:"significantTimeChange" name:UIApplicationSignificantTimeChangeNotification object:0];

    [*((id *)location + 21) registerClass:objc_opt_class() forCellReuseIdentifier:@"PBSnapshotCell"];
    *((unsigned char *)location + 81) = 0;
  }
  v20 = (RestoreFromBackupController *)location;
  objc_storeStrong(&location, 0);
  return v20;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 removeObserver:v5];

  [(NSTimer *)v5->_refreshTimer invalidate];
  v3.receiver = v5;
  v3.super_class = (Class)RestoreFromBackupController;
  [(RestoreFromBackupController *)&v3 dealloc];
}

- (void)significantTimeChange
{
  id v2 = [(RestoreFromBackupController *)self navigationController];
  objc_super v3 = (RestoreFromBackupController *)[v2 topViewController];
  BOOL v4 = 0;
  if (v3 == self)
  {
    BOOL v4 = 1;
    if (self->_listState != 2) {
      BOOL v4 = self->_listState == 3;
    }
  }

  if (v4)
  {
    id v5 = [(RestoreFromBackupController *)self tableView];
    [v5 reloadData];
  }
}

- (id)mostSimilarRestorablesInsertRemainingIntoArray:(id)a3 getOtherUniqueDevicesCount:(unint64_t *)a4
{
  SEL v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = a4;
  unint64_t v20 = 0;
  id v24 = (id)MGCopyAnswer();
  id v19 = v24;
  id v18 = +[NSMutableSet set];
  id v17 = +[NSMutableArray array];
  memset(__b, 0, sizeof(__b));
  id v5 = v23->_backupList;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:__b objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v6; ++i)
      {
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(v5);
        }
        id v16 = *(id *)(__b[1] + 8 * i);
        id v14 = [v16 backupUDID];
        if ([v18 containsObject:v14])
        {
LABEL_7:
          [location[0] addObject:v16];
          goto LABEL_14;
        }
        if ([v16 isThisDevice])
        {
          [v17 insertObject:v16 atIndex:0];
        }
        else
        {
          id v9 = [v16 backup];
          id v10 = [v9 deviceClass];
          unsigned __int8 v11 = [v10 isEqualToString:v19];

          if (v11)
          {
            [v17 addObject:v16];
          }
          else
          {
            if (v23->_listState == 3) {
              goto LABEL_7;
            }
            ++v20;
            [location[0] insertObject:v16 atIndex:];
          }
        }
LABEL_14:
        [v18 addObject:v14];
        objc_storeStrong(&v14, 0);
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:__b objects:v25 count:16];
    }
    while (v6);
  }

  if (v21) {
    unint64_t *v21 = v20;
  }
  id v12 = v17;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v12;
}

- (void)_updateTable:(id)a3 toMatchArray:(id)a4 withVisibleArray:(id)a5 maxVisible:(unint64_t)a6 fromOldSection:(int64_t)a7 toNewSection:(int64_t)a8
{
  v67 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v65 = 0;
  objc_storeStrong(&v65, a4);
  id v64 = 0;
  objc_storeStrong(&v64, a5);
  unint64_t v63 = a6;
  int64_t v62 = a7;
  int64_t v61 = a8;
  [location[0] beginUpdates];
  id v60 = +[NSMutableArray array];
  id v59 = +[NSMutableArray array];
  id v58 = [v64 count];
  if (!v58 || [v65 count])
  {
    if (!v58 && [v65 count])
    {
      id v15 = location[0];
      id v16 = +[NSIndexSet indexSetWithIndex:v61];
      [v15 insertSections:v16 withRowAnimation:0];
    }
    id v57 = [v64 copy];
    v56 = 0;
    memset(__b, 0, sizeof(__b));
    id v17 = v65;
    id v18 = [v17 countByEnumeratingWithState:__b objects:v77 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v18; ++i)
        {
          if (*(void *)__b[2] != v19) {
            objc_enumerationMutation(v17);
          }
          id v55 = *(id *)(__b[1] + 8 * i);
          unint64_t v21 = (unint64_t)v56;
          if (v21 >= (unint64_t)[v64 count])
          {
            id v27 = v60;
            v28 = +[NSIndexPath indexPathForRow:v56 inSection:v61];
            [v27 addObject:v28];

            [v64 addObject:v55];
          }
          else
          {
            id v53 = [v64 objectAtIndexedSubscript:v56];
            if (([v55 isEqual:v53] & 1) == 0)
            {
              id v52 = [v57 indexOfObject:v55];
              if (v52 == (id)0x7FFFFFFFFFFFFFFFLL)
              {
                id v25 = v60;
                v26 = +[NSIndexPath indexPathForRow:v56 inSection:v61];
                [v25 addObject:v26];

                [v64 insertObject:v55 atIndex:v56];
              }
              else
              {
                id v22 = location[0];
                SEL v23 = +[NSIndexPath indexPathForRow:v52 inSection:v62];
                id v24 = +[NSIndexPath indexPathForRow:v56 inSection:v61];
                [v22 moveRowAtIndexPath:v23 toIndexPath:v24];

                id v51 = [v64 indexOfObject:v55];
                if (v51 != (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  [v64 removeObjectAtIndex:v51];
                  [v64 insertObject:v55 atIndex:v56];
                }
              }
            }
            objc_storeStrong(&v53, 0);
          }
          if ((unint64_t)++v56 >= v63)
          {
            int v50 = 2;
            goto LABEL_26;
          }
        }
        id v18 = [v17 countByEnumeratingWithState:__b objects:v77 count:16];
      }
      while (v18);
    }
    int v50 = 0;
LABEL_26:

    uint64_t v73 = 0;
    uint64_t v72 = 0;
    uint64_t v74 = 0;
    uint64_t v75 = 0;
    v49 = 0;
    v48 = 0;
    v29 = (char *)[v64 count];
    if (v29 > v56)
    {
      v30 = v56;
      v31 = (char *)[v64 count];
      v69 = v30;
      v68 = (char *)(v31 - v56);
      v70 = v30;
      v71 = (char *)(v31 - v56);
      v47[2] = (id)(v31 - v56);
      v47[1] = v30;
      v48 = v30;
      v49 = (char *)(v31 - v56);
    }
    while (1)
    {
      unint64_t v32 = (unint64_t)v56;
      if (v32 >= (unint64_t)[v64 count]) {
        break;
      }
      v47[0] = [v64 objectAtIndexedSubscript:v56];
      id v46 = [v57 indexOfObject:v47[0]];
      id v33 = v59;
      v34 = +[NSIndexPath indexPathForRow:v46 inSection:v62];
      [v33 addObject:v34];

      objc_storeStrong(v47, 0);
      ++v56;
    }
    [v64 removeObjectsInRange:v48, v49];
    objc_storeStrong(&v57, 0);
  }
  else
  {
    id v13 = location[0];
    id v14 = +[NSIndexSet indexSetWithIndex:v62];
    [v13 deleteSections:v14 withRowAnimation:0];

    [v64 removeAllObjects];
  }
  id v45 = +[NSMutableSet set];
  if (v67->_listState == 2)
  {
    memset(v43, 0, sizeof(v43));
    id v35 = v64;
    id v36 = [v35 countByEnumeratingWithState:v43 objects:v76 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v43[2];
      do
      {
        for (unint64_t j = 0; j < (unint64_t)v36; ++j)
        {
          if (*(void *)v43[2] != v37) {
            objc_enumerationMutation(v35);
          }
          id v44 = *(id *)(v43[1] + 8 * j);
          id v39 = v45;
          id v40 = [v44 hashString];
          LOBYTE(v39) = [v39 containsObject:v40];

          if (v39)
          {
            v67->_shouldForceShowTimeStampOnBackups = 1;
            int v50 = 7;
            goto LABEL_42;
          }
          id v41 = v45;
          id v42 = [v44 hashString];
          [v41 addObject:v42];
        }
        id v36 = [v35 countByEnumeratingWithState:v43 objects:v76 count:16];
      }
      while (v36);
    }
    int v50 = 0;
LABEL_42:
  }
  [location[0] insertRowsAtIndexPaths:v60 withRowAnimation:0];
  [location[0] deleteRowsAtIndexPaths:v59 withRowAnimation:0];
  [location[0] endUpdates];
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(location, 0);
}

- (void)updateVisibleSnapshots
{
  id v45 = self;
  v44[1] = a2;
  id v2 = [(RestoreFromBackupController *)self tableView];
  [v2 beginUpdates];

  if (*((_DWORD *)v45 + 14) == 3 || *((_DWORD *)v45 + 14) == 2)
  {
    v44[0] = 0;
    id location = +[NSMutableArray array];
    id v3 = [v45 mostSimilarRestorablesInsertRemainingIntoArray:location getOtherUniqueDevicesCount:v44];
    BOOL v4 = (void *)*((void *)v45 + 5);
    *((void *)v45 + 5) = v3;

    if (*((_DWORD *)v45 + 14) == 3)
    {
      v44[0] = 0x7FFFFFFFFFFFFFFFLL;
    }
    else if (*((_DWORD *)v45 + 14) == 2)
    {
      v44[0] = [*((id *)v45 + 5) count];
    }
    id v5 = [*((id *)v45 + 5) arrayByAddingObjectsFromArray:location];
    id v6 = (void *)*((void *)v45 + 5);
    *((void *)v45 + 5) = v5;

    BOOL v42 = 0;
    id v7 = [*((id *)v45 + 6) count];
    BOOL v8 = 0;
    if (v7)
    {
      id v9 = [*((id *)v45 + 5) count];
      BOOL v8 = 0;
      if (v9)
      {
        id v10 = [*((id *)v45 + 6) count];
        id v11 = [*((id *)v45 + 5) count];
        BOOL v8 = 0;
        if (v10 != v11)
        {
          id v12 = [*((id *)v45 + 6) count];
          BOOL v8 = 1;
          if (v12 != (id)1) {
            BOOL v8 = [*((id *)v45 + 5) count] == (id)1;
          }
        }
      }
    }
    BOOL v42 = v8;
    int v41 = 0;
    uint64_t v40 = 0;
    memset(__b, 0, sizeof(__b));
    id v13 = *((id *)v45 + 3);
    id v14 = [v13 countByEnumeratingWithState:__b objects:v46 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v14; ++i)
        {
          if (*(void *)__b[2] != v15) {
            objc_enumerationMutation(v13);
          }
          id v39 = *(id *)(__b[1] + 8 * i);
          char v36 = 0;
          char v34 = 0;
          char v17 = 0;
          if (([v39 isCompatible] & 1) == 0)
          {
            id v18 = v39;
            id v37 = [v45 availableUpdateVersion];
            char v36 = 1;
            unsigned __int8 v19 = [v18 isCompatibleWithUpdateToSystemVersion:];
            char v17 = 0;
            if ((v19 & 1) == 0)
            {
              id v35 = [v45 betaEnrollmentStateManager];
              char v34 = 1;
              char v17 = [v35 isRestorableSeedEnrolled:v39] ^ 1;
            }
          }
          if (v34) {

          }
          if (v36) {
          if (v17)
          }
            ++v40;
        }
        id v14 = [v13 countByEnumeratingWithState:__b objects:v46 count:16];
      }
      while (v14);
    }

    if (v40 <= 0)
    {
      int v41 = 0;
    }
    else
    {
      unint64_t v20 = v40;
      if (v20 >= (unint64_t)[*((id *)v45 + 3) count]) {
        int v41 = 2;
      }
      else {
        int v41 = 1;
      }
    }
    *((_DWORD *)v45 + 19) = v41;
    id v21 = v45;
    id v22 = [v45 tableView];
    [v21 _updateTable:v22 toMatchArray:*((void *)v45 + 5) withVisibleArray:*((void *)v45 + 6) maxVisible:v44[0] fromOldSection:0 toNewSection:0];

    if (v42)
    {
      id v23 = [v45 tableView];
      id v24 = +[NSIndexSet indexSetWithIndex:0];
      [v23 _reloadSectionHeaderFooters:v24 withRowAnimation:0];
    }
    if ([*((id *)v45 + 5) count])
    {
      if (*((_DWORD *)v45 + 14) != 2
        || (id v25 = [*((id *)v45 + 6) count], v25 == objc_msgSend(*((id *)v45 + 5), "count")))
      {
        v26 = &_dispatch_main_q;
        block = _NSConcreteStackBlock;
        int v29 = -1073741824;
        int v30 = 0;
        v31 = sub_10009E864;
        unint64_t v32 = &unk_1002B0D20;
        id v33 = v45;
        dispatch_async((dispatch_queue_t)v26, &block);

        objc_storeStrong(&v33, 0);
      }
    }
    objc_storeStrong(&location, 0);
  }
  else if (*((_DWORD *)v45 + 14) == 1)
  {
    [*((id *)v45 + 6) removeAllObjects];
  }
  id v27 = [v45 tableView];
  [v27 endUpdates];
}

- (void)setListState:(int)a3
{
  char v36 = self;
  SEL v35 = a2;
  int v34 = a3;
  if (a3 == self->_listState) {
    return;
  }
  int listState = 0;
  int listState = v36->_listState;
  v36->_int listState = v34;
  id v3 = [(RestoreFromBackupController *)v36 tableView];
  BOOL v4 = [v3 numberOfSections];

  unint64_t v32 = v4;
  id v5 = [(RestoreFromBackupController *)v36 tableView];
  [v5 beginUpdates];

  if (!listState && v34 == -1)
  {
    id v6 = [(RestoreFromBackupController *)v36 tableView];
    id v7 = +[NSIndexSet indexSetWithIndex:0];
    [v6 deleteSections:v7 withRowAnimation:0];

    id v8 = [(RestoreFromBackupController *)v36 tableView];
    uint64_t v62 = 0;
    int64_t v61 = [(RestoreFromBackupController *)v36 _backupListErrorSectionCount];
    uint64_t v63 = 0;
    id v64 = v61;
    oslog[14] = v61;
    oslog[13] = 0;
    id v9 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v61);
    [v8 insertSections:v9 withRowAnimation:0];

LABEL_31:
    if (v36->_listState != 2 && v36->_listState != 3)
    {
      id v28 = [(RestoreFromBackupController *)v36 navigationItem];
      id v29 = [v28 rightBarButtonItem];
      [v29 setEnabled:0];
    }
    id v30 = [(RestoreFromBackupController *)v36 tableView];
    [v30 endUpdates];

    return;
  }
  if (listState == -1 && !v34)
  {
    id v10 = [(RestoreFromBackupController *)v36 tableView];
    uint64_t v58 = 0;
    id v57 = [(RestoreFromBackupController *)v36 _backupListErrorSectionCount];
    uint64_t v59 = 0;
    id v60 = v57;
    oslog[12] = v57;
    oslog[11] = 0;
    id v11 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v57);
    [v10 deleteSections:v11 withRowAnimation:0];

    id v12 = [(RestoreFromBackupController *)v36 tableView];
    id v13 = +[NSIndexSet indexSetWithIndex:0];
    [v12 insertSections:v13 withRowAnimation:0];

    goto LABEL_31;
  }
  if (listState == -1 && v34 == 2)
  {
    id v14 = [(RestoreFromBackupController *)v36 tableView];
    uint64_t v54 = 0;
    id v53 = [(RestoreFromBackupController *)v36 _backupListErrorSectionCount];
    uint64_t v55 = 0;
    v56 = v53;
    oslog[10] = v53;
    oslog[9] = 0;
    uint64_t v15 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v53);
    [v14 deleteSections:v15 withRowAnimation:0];

    [(RestoreFromBackupController *)v36 updateVisibleSnapshots];
    goto LABEL_31;
  }
  if (!listState && v36->_listState == 2)
  {
    id v16 = [(RestoreFromBackupController *)v36 tableView];
    char v17 = +[NSIndexSet indexSetWithIndex:0];
    [v16 deleteSections:v17 withRowAnimation:0];

    [(RestoreFromBackupController *)v36 updateVisibleSnapshots];
    goto LABEL_31;
  }
  if (listState == 2 && v36->_listState == 3)
  {
    [(RestoreFromBackupController *)v36 updateVisibleSnapshots];
    goto LABEL_31;
  }
  if (!listState && v36->_listState == 1)
  {
    id v18 = [(RestoreFromBackupController *)v36 tableView];
    unsigned __int8 v19 = +[NSIndexSet indexSetWithIndex:0];
    [v18 deleteSections:v19 withRowAnimation:0];

    id v20 = [(RestoreFromBackupController *)v36 tableView];
    uint64_t v50 = 0;
    v49 = [(RestoreFromBackupController *)v36 _noBackupsFoundSectionCount];
    uint64_t v51 = 0;
    id v52 = v49;
    oslog[8] = v49;
    oslog[7] = 0;
    id v21 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v49);
    [v20 insertSections:v21 withRowAnimation:0];

    goto LABEL_31;
  }
  if (listState == 1 && (v36->_listState == 2 || v36->_listState == 3))
  {
    id v22 = [(RestoreFromBackupController *)v36 tableView];
    uint64_t v46 = 0;
    id v45 = [(RestoreFromBackupController *)v36 _noBackupsFoundSectionCount];
    uint64_t v47 = 0;
    v48 = v45;
    oslog[6] = v45;
    oslog[5] = 0;
    id v23 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v45);
    [v22 deleteSections:v23 withRowAnimation:0];

    [(RestoreFromBackupController *)v36 updateVisibleSnapshots];
    goto LABEL_31;
  }
  if ((listState == 2 || listState == 3) && v36->_listState == 1)
  {
    [(RestoreFromBackupController *)v36 updateVisibleSnapshots];
    id v24 = [(RestoreFromBackupController *)v36 tableView];
    uint64_t v42 = 0;
    int v41 = v32;
    uint64_t v43 = 0;
    id v44 = v32;
    oslog[4] = v32;
    oslog[3] = 0;
    id v25 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v32);
    [v24 deleteSections:v25 withRowAnimation:0];

    id v26 = [(RestoreFromBackupController *)v36 tableView];
    uint64_t v38 = 0;
    id v37 = [(RestoreFromBackupController *)v36 _noBackupsFoundSectionCount];
    uint64_t v39 = 0;
    uint64_t v40 = v37;
    oslog[2] = v37;
    oslog[1] = 0;
    id v27 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v37);
    [v26 insertSections:v27 withRowAnimation:0];

    goto LABEL_31;
  }
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_10004F3FC((uint64_t)buf, listState, v36->_listState);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "Tried to transition from state %i to state %i", buf, 0xEu);
  }
  objc_storeStrong((id *)oslog, 0);
}

- (void)updateListStateWithReload:(BOOL)a3
{
  id v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  if (self->_backupList && !v10->_scanningForUpdate)
  {
    if ([(NSArray *)v10->_backupList count])
    {
      if (v10->_listState < 2u || v10->_listState == -1)
      {
        [(RestoreFromBackupController *)v10 setListState:2];
      }
      else if (v8)
      {
        [(RestoreFromBackupController *)v10 updateVisibleSnapshots];
      }
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v3 = oslog;
        os_log_type_t v4 = v6;
        sub_10004B24C(v5);
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "No backups found", (uint8_t *)v5, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      [(RestoreFromBackupController *)v10 setListState:1];
    }
  }
}

- (void)setBackupList:(id)a3 forceReload:(BOOL)a4 withError:(id)a5
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v10 = a4;
  id v9 = 0;
  objc_storeStrong(&v9, a5);
  if (v9)
  {
    if (!v12->_listState) {
      [(RestoreFromBackupController *)v12 setListState:0xFFFFFFFFLL];
    }
  }
  else if (location[0] != v12->_backupList)
  {
    char v8 = ([(NSArray *)v12->_backupList isEqual:location[0]] ^ 1) & 1;
    objc_storeStrong((id *)&v12->_backupList, location[0]);
    char v7 = 1;
    if ((v8 & 1) == 0) {
      char v7 = v10;
    }
    [(RestoreFromBackupController *)v12 updateListStateWithReload:v7 & 1];
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)filteredRestorableItemsFromBackupList:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v24 = +[NSMutableArray array];
  memset(__b, 0, sizeof(__b));
  id v3 = location[0];
  id v4 = [v3 countByEnumeratingWithState:__b objects:v27 count:16];
  if (v4)
  {
    id v5 = (void **)&__b[2];
    uint64_t v6 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (**v5 != v6) {
          objc_enumerationMutation(v3);
        }
        id v23 = *(id *)(__b[1] + 8 * i);
        id v8 = [v23 productType];
        char v9 = [v8 containsString:@"RealityDevice"] ^ 1;

        if (v9)
        {
          memset(v20, 0, sizeof(v20));
          id v10 = [v23 snapshots];
          id v11 = [v10 countByEnumeratingWithState:v20 objects:v26 count:16];
          if (v11)
          {
            uint64_t v18 = v6;
            unsigned __int8 v19 = v5;
            uint64_t v12 = *(void *)v20[2];
            do
            {
              for (unint64_t j = 0; j < (unint64_t)v11; ++j)
              {
                if (*(void *)v20[2] != v12) {
                  objc_enumerationMutation(v10);
                }
                id v21 = *(id *)(v20[1] + 8 * j);
                if (objc_msgSend(v21, "state", v18, v19) == 3)
                {
                  id v14 = v24;
                  uint64_t v15 = +[RestorableBackupItem restorableBackupItemWithBackup:v23 snapshot:v21];
                  [v14 addObject:v15];
                }
              }
              id v11 = [v10 countByEnumeratingWithState:v20 objects:v26 count:16];
            }
            while (v11);
            id v5 = v19;
            uint64_t v6 = v18;
          }
        }
      }
      id v4 = [v3 countByEnumeratingWithState:__b objects:v27 count:16];
    }
    while (v4);
  }

  id v16 = v24;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
  return v16;
}

- (void)updateBackupListCompletion:(id)a3
{
  id v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  id v25 = 0;
  id v3 = (id)_BYSignpostSubsystem();
  uint64_t v4 = _BYSignpostCreate();
  id v24 = v5;
  id v23 = (void *)v4;

  os_log_t log = (os_log_t)(id)_BYSignpostSubsystem();
  char v21 = 1;
  uint64_t v20 = (uint64_t)v23;
  if (v23 && v20 != -1 && os_signpost_enabled(log))
  {
    uint64_t v6 = log;
    os_signpost_type_t v7 = v21;
    os_signpost_id_t v8 = v20;
    sub_10004B24C(buf);
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, v7, v8, "BackupListLoadBackups", " enableTelemetry=YES ", buf, 2u);
  }
  objc_storeStrong((id *)&log, 0);
  os_log_t oslog = (os_log_t)(id)_BYSignpostSubsystem();
  os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046588((uint64_t)v29, (uint64_t)v23);
    _os_log_impl((void *)&_mh_execute_header, oslog, v17, "BEGIN [%lld]: BackupListLoadBackups  enableTelemetry=YES ", v29, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v25 = v23;
  id v26 = v24;
  update_backup_list_queue = v28->_update_backup_list_queue;
  id v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = sub_10009FA14;
  id v14 = &unk_1002B1FB8;
  uint64_t v15 = v28;
  v16[0] = location[0];
  v16[1] = v25;
  v16[2] = v26;
  dispatch_async(update_backup_list_queue, &v10);
  objc_storeStrong(v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)refreshBackupListFromTimer:(id)a3
{
  int v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v11;
  uint64_t v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  os_signpost_type_t v7 = sub_1000A0534;
  os_signpost_id_t v8 = &unk_1002B1FE0;
  char v9 = v11;
  [(RestoreFromBackupController *)v3 updateBackupListCompletion:&v4];
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)cancelRestoreAndRemovePrimaryAppleAccount
{
  id v2 = [(RestoreFromBackupController *)self proximitySetupController];
  BOOL v3 = ![(ProximitySetupController *)v2 signedIniCloudAccount];

  if (!self->_appleAccountRemoved && v3)
  {
    self->_appleAccountRemoved = 1;
    id v4 = +[BuddyAccountTools sharedBuddyAccountTools];
    [v4 removePrimaryAccountCompletion:0];
  }
}

- (void)scanForUpdateIfNecessaryForBackupList:(id)a3 withCompletion:(id)a4
{
  int v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v32 = 0;
  objc_storeStrong(&v32, a4);
  if (!v34->_scannedForUpdate && [location[0] count])
  {
    char v30 = 0;
    memset(__b, 0, sizeof(__b));
    id v5 = location[0];
    id v6 = [v5 countByEnumeratingWithState:__b objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v6; ++i)
        {
          if (*(void *)__b[2] != v7) {
            objc_enumerationMutation(v5);
          }
          id v29 = *(id *)(__b[1] + 8 * i);
          if (([v29 isCompatible] & 1) == 0) {
            char v30 = 1;
          }
          if (v30)
          {
            int v31 = 2;
            goto LABEL_18;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:__b objects:v35 count:16];
      }
      while (v6);
    }
    int v31 = 0;
LABEL_18:

    if (v30)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        char v9 = oslog;
        os_log_type_t v10 = v26;
        sub_10004B24C(buf);
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Found an incompatible snapshot. Scanning for OS update...", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      [(RestoreFromBackupController *)v34 setScanningForUpdate:1];
      int v11 = [(RestoreFromBackupController *)v34 softwareUpdateCache];
      os_log_type_t v17 = _NSConcreteStackBlock;
      int v18 = -1073741824;
      int v19 = 0;
      uint64_t v20 = sub_1000A0A48;
      char v21 = &unk_1002B2008;
      id v22 = v34;
      id v23 = location[0];
      id v24 = v32;
      [(BYSoftwareUpdateCache *)v11 scanUsingCache:1 withCompletion:&v17];

      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v23, 0);
      objc_storeStrong((id *)&v22, 0);
    }
    else if (v32)
    {
      os_log_t v16 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = v16;
        os_log_type_t v13 = v15;
        sub_10004B24C(v14);
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "All snapshots are compatible for restore", (uint8_t *)v14, 2u);
      }
      objc_storeStrong((id *)&v16, 0);
      (*((void (**)(id, void))v32 + 2))(v32, 0);
    }
    int v31 = 0;
  }
  else
  {
    if (v32) {
      (*((void (**)(id, void))v32 + 2))(v32, 0);
    }
    int v31 = 1;
  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);
}

- (void)setRefreshTimerToDuration:(double)a3
{
  id v3 = [(RestoreFromBackupController *)self navigationController];
  id v4 = (RestoreFromBackupController *)[v3 topViewController];

  if (v4 == self)
  {
    [(NSTimer *)self->_refreshTimer invalidate];
    id v5 = +[NSTimer scheduledTimerWithTimeInterval:self target:"refreshBackupListFromTimer:" selector:0 userInfo:0 repeats:a3];
    refreshTimer = self->_refreshTimer;
    self->_refreshTimer = v5;
  }
}

- (void)viewDidLoad
{
  int v11 = self;
  SEL v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)RestoreFromBackupController;
  [(RestoreFromBackupController *)&v9 viewDidLoad];
  id v2 = v11;
  id v3 = [(RestoreFromBackupController *)v11 backupsTableView];
  [(RestoreFromBackupController *)v2 setTableView:v3];

  id v4 = [(RestoreFromBackupController *)v11 tableView];
  [v4 setSeparatorStyle:1];

  id v5 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"Start" transitionDuration:0.01 transitionSpeed:1.0];
  v12[0] = v5;
  id v6 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"Light" darkStateName:@"Dark" transitionDuration:1.0 transitionSpeed:1.0];
  v12[1] = v6;
  os_signpost_id_t v8 = +[NSArray arrayWithObjects:v12 count:2];

  id v7 = [(RestoreFromBackupController *)v11 buddy_animationController:@"iCloudBackup" animatedStates:v8 startAtFirstState:1];
  [(RestoreFromBackupController *)v11 setAnimationController:v7];

  objc_storeStrong((id *)&v8, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  int v18 = self;
  SEL v17 = a2;
  BOOL v16 = a3;
  id v3 = [(RestoreFromBackupController *)self animationController];
  [(OBAnimationController *)v3 startAnimation];

  if (!v18->_refreshTimer) {
    [(RestoreFromBackupController *)v18 setRefreshTimerToDuration:20.0];
  }
  char v15 = [(RestoreFromBackupController *)v18 isMovingToParentViewController] & 1;
  if (v15 || !v18->_backupList)
  {
    [(RestoreFromBackupController *)v18 updateBackupListCompletion:0];
    if (v15)
    {
      [(RestoreFromBackupController *)v18 updateListStateWithReload:0];
      id v4 = [(RestoreFromBackupController *)v18 navigationController];
      id v5 = [v4 viewControllers];
      id v14 = [v5 mutableCopy];

      id location = (id)objc_opt_new();
      char v12 = 0;
      for (unint64_t i = (char *)[v14 count] - 2; ((unint64_t)i & 0x8000000000000000) == 0; --i)
      {
        id v6 = [v14 objectAtIndexedSubscript:i];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          char v12 = 1;
          break;
        }
        id v8 = [v14 objectAtIndexedSubscript:i];
        [location addObject:v8];
      }
      if (v12)
      {
        objc_super v9 = [(RestoreFromBackupController *)v18 delegate];
        [(BFFFlowItemDelegate *)v9 removeViewControllersOnNextPush:location];
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v14, 0);
    }
  }
  v10.receiver = v18;
  v10.super_class = (Class)RestoreFromBackupController;
  [(RestoreFromBackupController *)&v10 viewDidAppear:v16];
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  BOOL v4 = 0;
  BOOL v4 = self->_refreshTimer != 0;
  [(NSTimer *)self->_refreshTimer invalidate];
  objc_storeStrong((id *)&v7->_refreshTimer, 0);
  if (v4
    && ([(RestoreFromBackupController *)v7 isMovingFromParentViewController] & 1) != 0)
  {
    [(RestoreFromBackupController *)v7 cancelRestoreAndRemovePrimaryAppleAccount];
  }
  v3.receiver = v7;
  v3.super_class = (Class)RestoreFromBackupController;
  [(RestoreFromBackupController *)&v3 viewDidDisappear:v5];
}

- (void)setupWithAlternateChoice:(id)a3
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, v21, "Running iCloud Restore escape hatch: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_super v3 = [(RestoreFromBackupController *)v24 enrollmentCoordinator];
  id v4 = [(BuddyEnrollmentCoordinator *)v3 mdmEnrollmentChannel];

  if (v4 != (id)2) {
    [(RestoreFromBackupController *)v24 cancelRestoreAndRemovePrimaryAppleAccount];
  }
  BOOL v5 = [(RestoreFromBackupController *)v24 pendingRestoreState];
  [(BuddyPendingRestoreState *)v5 clearBackupItem];

  id v6 = [(RestoreFromBackupController *)v24 navigationController];
  id v7 = [v6 viewControllers];
  id v8 = [v7 indexOfObjectPassingTest:&stru_1002B2048];

  unint64_t v20 = (unint64_t)v8;
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [(RestoreFromBackupController *)v24 navigationController];
    id v10 = [v9 viewControllers];
    int v11 = (char *)[v10 count];
    os_log_type_t v26 = (char *)(v20 + 1);
    id v25 = &v11[~v20];
    id v27 = (char *)(v20 + 1);
    id v28 = v25;
    v18[2] = v25;
    v18[1] = (id)(v20 + 1);
    id v19 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v20 + 1, v25);

    char v12 = [(RestoreFromBackupController *)v24 delegate];
    id v13 = [(RestoreFromBackupController *)v24 navigationController];
    id v14 = [v13 viewControllers];
    id v15 = [v14 objectsAtIndexes:v19];
    [(BFFFlowItemDelegate *)v12 removeViewControllersOnNextPush:v15];

    id v16 = [(RestoreFromBackupController *)v24 navigationController];
    id v17 = [v16 viewControllers];
    v18[0] = [v17 objectAtIndexedSubscript:v20];

    [v18[0] selectChoiceForIdentifier:location[0]];
    objc_storeStrong(v18, 0);
    objc_storeStrong(&v19, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)showRestoreWarningsIfNeededForRestorable:(id)a3 completion:(id)a4
{
  v79 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v77 = 0;
  objc_storeStrong(&v77, a4);
  v70 = _NSConcreteStackBlock;
  int v71 = -1073741824;
  int v72 = 0;
  uint64_t v73 = sub_1000A2140;
  uint64_t v74 = &unk_1002B2070;
  id v75 = v77;
  id v76 = objc_retainBlock(&v70);
  id v5 = [location[0] backup];
  id v69 = [v5 deviceClass];

  char v68 = [v69 isEqualToString:@"iPad"] & 1;
  id v80 = (id)MGCopyAnswer();
  id v6 = v80;
  unsigned __int8 v7 = [v6 isEqualToString:@"iPad"];

  char v67 = v7 & 1;
  id v66 = 0;
  if (v68 & 1) == 0 || (v67)
  {
    if (v68 & 1) == 0 && (v67)
    {
      id v53 = [v69 uppercaseString];
      id v23 = +[NSBundle mainBundle];
      id v24 = +[NSString localizedStringWithFormat:@"CROSS_DEVICE_CLASS_TO_IPAD_RESTORE_%@", v53];
      id v25 = [(NSBundle *)v23 localizedStringForKey:v24 value:&stru_1002B4E18 table:@"RestoreFromBackup"];
      os_log_type_t v26 = +[NSBundle mainBundle];
      id v27 = +[NSString localizedStringWithFormat:@"CROSS_DEVICE_CLASS_TO_IPAD_RESTORE_WARNING_%@", v53];
      id v28 = [(NSBundle *)v26 localizedStringForKey:v27 value:&stru_1002B4E18 table:@"RestoreFromBackup"];
      id v29 = +[UIAlertController alertControllerWithTitle:v25 message:v28 preferredStyle:1];
      id v30 = v66;
      id v66 = v29;

      id v31 = v66;
      id v32 = +[NSBundle mainBundle];
      id v33 = [(NSBundle *)v32 localizedStringForKey:@"CANCEL" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
      uint64_t v47 = _NSConcreteStackBlock;
      int v48 = -1073741824;
      int v49 = 0;
      uint64_t v50 = sub_1000A2240;
      uint64_t v51 = &unk_1002B2098;
      id v52 = v76;
      int v34 = +[UIAlertAction actionWithTitle:v33 style:1 handler:&v47];
      [v31 addAction:v34];

      id v35 = v66;
      char v36 = +[NSBundle mainBundle];
      id v37 = [(NSBundle *)v36 localizedStringForKey:@"OK" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
      int v41 = _NSConcreteStackBlock;
      int v42 = -1073741824;
      int v43 = 0;
      id v44 = sub_1000A229C;
      id v45 = &unk_1002B2098;
      id v46 = v76;
      uint64_t v38 = +[UIAlertAction actionWithTitle:v37 style:0 handler:&v41];
      [v35 addAction:v38];

      objc_storeStrong(&v46, 0);
      objc_storeStrong(&v52, 0);
      objc_storeStrong(&v53, 0);
    }
  }
  else
  {
    id v8 = +[NSBundle mainBundle];
    id v9 = [(NSBundle *)v8 localizedStringForKey:@"CROSS_DEVICE_CLASS_FROM_IPAD_RESTORE" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
    id v10 = +[NSBundle mainBundle];
    id v11 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"CROSS_DEVICE_CLASS_FROM_IPAD_RESTORE_WARNING"];
    char v12 = [(NSBundle *)v10 localizedStringForKey:v11 value:&stru_1002B4E18 table:@"RestoreFromBackup"];
    id v13 = +[UIAlertController alertControllerWithTitle:v9 message:v12 preferredStyle:1];
    id v14 = v66;
    id v66 = v13;

    id v15 = v66;
    id v16 = +[NSBundle mainBundle];
    id v17 = [(NSBundle *)v16 localizedStringForKey:@"CANCEL" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
    id v60 = _NSConcreteStackBlock;
    int v61 = -1073741824;
    int v62 = 0;
    uint64_t v63 = sub_1000A2188;
    id v64 = &unk_1002B2098;
    id v65 = v76;
    int v18 = +[UIAlertAction actionWithTitle:v17 style:1 handler:&v60];
    [v15 addAction:v18];

    id v19 = v66;
    unint64_t v20 = +[NSBundle mainBundle];
    os_log_type_t v21 = [(NSBundle *)v20 localizedStringForKey:@"OK" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
    uint64_t v54 = _NSConcreteStackBlock;
    int v55 = -1073741824;
    int v56 = 0;
    id v57 = sub_1000A21E4;
    uint64_t v58 = &unk_1002B2098;
    id v59 = v76;
    id v22 = +[UIAlertAction actionWithTitle:v21 style:0 handler:&v54];
    [v19 addAction:v22];

    objc_storeStrong(&v59, 0);
    objc_storeStrong(&v65, 0);
  }
  if (v66)
  {
    id v39 = [(RestoreFromBackupController *)v79 navigationController];
    id v40 = [v39 topViewController];
    [v40 presentViewController:v66 animated:1 completion:0];
  }
  else
  {
    (*((void (**)(id, uint64_t))v76 + 2))(v76, 1);
  }
  objc_storeStrong(&v66, 0);
  objc_storeStrong(&v69, 0);
  objc_storeStrong(&v76, 0);
  objc_storeStrong(&v75, 0);
  objc_storeStrong(&v77, 0);
  objc_storeStrong(location, 0);
}

- (void)_presentNetworkWarningForRestorable:(id)a3 completion:(id)a4
{
  int v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v5 = [(RestoreFromBackupController *)v18 networkProvider];
  id v6 = [location[0] snapshot];
  id v15 = +[BuddyRestoreNetworkAlertController alertControllerForNetworkConnectionWithProvider:estimatedRestoreSize:](BuddyRestoreNetworkAlertController, "alertControllerForNetworkConnectionWithProvider:estimatedRestoreSize:", v5, [v6 estimatedRestoreSize]);

  if (v15)
  {
    id v8 = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    id v11 = sub_1000A24C8;
    char v12 = &unk_1002B0D70;
    id v13 = v16;
    [v15 setRestoreOverCellular:&v8];
    id v7 = [(RestoreFromBackupController *)v18 showModalWiFiSettingsBlock];
    [v15 setPresentWiFiSettings:v7];

    [(RestoreFromBackupController *)v18 presentViewController:v15 animated:1 completion:0];
    objc_storeStrong(&v13, 0);
    int v14 = 0;
  }
  else
  {
    (*((void (**)(id, void))v16 + 2))(v16, 0);
    int v14 = 1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (BOOL)controllerNeedsToRun
{
  id v2 = [(RestoreFromBackupController *)self pendingRestoreState];
  objc_super v3 = [(BuddyPendingRestoreState *)v2 backupItem];
  BOOL v4 = v3 == 0;

  return v4;
}

- (id)restorableItemAtIndexPath:(id)a3
{
  int v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = [location[0] row];
  id v7 = 0;
  if ([(NSMutableArray *)v10->_visibleSimilarRestorables count])
  {
    id v3 = [(NSMutableArray *)v10->_visibleSimilarRestorables objectAtIndexedSubscript:v8];
    id v4 = v7;
    id v7 = v3;
  }
  id v5 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v5->_listState == -1)
  {
    int64_t v6 = [(RestoreFromBackupController *)v5 _backupListErrorSectionCount];
  }
  else if (v5->_listState == 1)
  {
    int64_t v6 = [(RestoreFromBackupController *)v5 _noBackupsFoundSectionCount];
  }
  else
  {
    int64_t v6 = 1;
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v7->_listState == 1 || v7->_listState == -1)
  {
    int64_t v8 = a4 != 0;
  }
  else if (v7->_listState == 3 || v7->_listState == 2)
  {
    int64_t v8 = (int64_t)[(NSMutableArray *)v7->_visibleSimilarRestorables count];
  }
  else
  {
    int64_t v8 = 1;
  }
  objc_storeStrong(location, 0);
  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v10->_listState != -1 || a4)
  {
    if (v10->_listState != 1 || a4)
    {
      id v11 = 0;
    }
    else
    {
      int64_t v6 = +[NSBundle mainBundle];
      id v11 = [(NSBundle *)v6 localizedStringForKey:@"NO_BACKUPS_AVAILABLE" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
    }
  }
  else
  {
    id v5 = +[NSBundle mainBundle];
    id v11 = [(NSBundle *)v5 localizedStringForKey:@"CANNOT_LOAD_BACKUPS" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
  }
  objc_storeStrong(location, 0);
  id v7 = v11;

  return v7;
}

- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((v7->_listState == -1 || v7->_listState == 1) && !a4) {
    int64_t v8 = 1;
  }
  else {
    int64_t v8 = 4;
  }
  objc_storeStrong(location, 0);
  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v22 = a4;
  double v21 = 0.0;
  if (a4 > 0) {
    double v21 = 26.0;
  }
  id v5 = [BuddyTableSectionHeaderView alloc];
  sub_1000A2D38();
  id v20 = -[BuddyTableSectionHeaderView initWithPadding:](v5, "initWithPadding:", v6, v7, v8, v9);
  uint64_t v19 = 4;
  if (!v22 && (v24->_listState == 1 || v24->_listState == -1)) {
    uint64_t v19 = 1;
  }
  int v10 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle2];
  id v11 = [(UIFontDescriptor *)v10 fontDescriptorWithSymbolicTraits:2];
  char v12 = +[UIFont fontWithDescriptor:v11 size:0.0];
  id v13 = [v20 sectionLabel];
  [v13 setFont:v12];

  id v14 = [(RestoreFromBackupController *)v24 tableView:location[0] titleForHeaderInSection:v22];
  id v15 = [v20 sectionLabel];
  [v15 setText:v14];

  id v16 = [v20 sectionLabel];
  [v16 setTextAlignment:v19];

  id v17 = v20;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v17;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  char v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v34 = (unsigned char *)a4;
  if (v36->_listState != -1 || v34)
  {
    if (v36->_listState != 1 || v34)
    {
      if (v36->_listState != 2 && v36->_listState != 3
        || v34 != (char *)[location[0] numberOfSections] - 1)
      {
        goto LABEL_34;
      }
      id v32 = 0;
      int compatibleRestoresState = v36->_compatibleRestoresState;
      if (compatibleRestoresState)
      {
        if (compatibleRestoresState == 1)
        {
          int v10 = +[NSBundle mainBundle];
          id v11 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"SOME_INCOMPATIBLE_SNAPSHOTS"];
          char v12 = [(NSBundle *)v10 localizedStringForKey:v11 value:&stru_1002B4E18 table:@"RestoreFromBackup"];
          id v13 = v32;
          id v32 = v12;
        }
        else if (compatibleRestoresState == 2)
        {
          id v14 = +[NSBundle mainBundle];
          id v15 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ALL_INCOMPATIBLE_SNAPSHOTS"];
          id v16 = [(NSBundle *)v14 localizedStringForKey:v15 value:&stru_1002B4E18 table:@"RestoreFromBackup"];
          id v17 = v32;
          id v32 = v16;
        }
      }
      if (v32)
      {
        id v31 = 0;
        obunint64_t j = 0;
        int v18 = +[UIDevice currentDevice];
        uint64_t v19 = [(UIDevice *)v18 systemVersion];
        id v20 = +[NSString stringWithValidatedFormat:v32, @"%@", &obj, v19 validFormatSpecifiers error];
        objc_storeStrong(&v31, obj);
        id v30 = v20;

        if (v30)
        {
          id v37 = (NSString *)v30;
          int v33 = 1;
        }
        else
        {
          os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            char v26 = 0;
            char v24 = 0;
            if (_BYIsInternalInstall())
            {
              double v21 = (NSString *)v31;
            }
            else if (v31)
            {
              id v27 = [v31 domain];
              char v26 = 1;
              double v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v27, [v31 code]);
              id v25 = v21;
              char v24 = 1;
            }
            else
            {
              double v21 = 0;
            }
            sub_10004BB7C((uint64_t)buf, (uint64_t)v21);
            _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Failed to format compatibility title: %{public}@", buf, 0xCu);
            if (v24) {

            }
            if (v26) {
          }
            }
          objc_storeStrong((id *)&oslog, 0);
          id v37 = 0;
          int v33 = 1;
        }
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v31, 0);
      }
      else
      {
        int v33 = 0;
      }
      objc_storeStrong(&v32, 0);
      if (!v33)
      {
LABEL_34:
        id v37 = 0;
        int v33 = 1;
      }
    }
    else
    {
      double v7 = +[NSBundle mainBundle];
      id v8 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"RESTORE_ALTERNATIVE_DETAILS"];
      id v37 = [(NSBundle *)v7 localizedStringForKey:v8 value:&stru_1002B4E18 table:@"RestoreFromBackup"];

      int v33 = 1;
    }
  }
  else
  {
    id v5 = +[NSBundle mainBundle];
    id v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"PROBLEM_LOADING_BACKUPS_DETAILS"];
    id v37 = [(NSBundle *)v5 localizedStringForKey:v6 value:&stru_1002B4E18 table:@"RestoreFromBackup"];

    int v33 = 1;
  }
  objc_storeStrong(location, 0);
  int64_t v22 = v37;

  return v22;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = (unsigned char *)a4;
  if ([(RestoreFromBackupController *)v15 _showAllFooterPresent]
    && v13 == (char *)[location[0] numberOfSections] - 1)
  {
    id v12 = +[UIButton buttonWithType:1];
    id v5 = +[NSBundle mainBundle];
    id v6 = [(NSBundle *)v5 localizedStringForKey:@"SHOW_ALL_BACKUPS" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
    [v12 setTitle:v6 forState:0];

    double v7 = +[UIColor linkColor];
    [v12 setTitleColor:v7 forState:0];

    id v8 = [v12 titleLabel];
    double v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [v8 setFont:v9];

    [v12 addTarget:v15 action:"showAllBackups" forControlEvents:64];
    id v16 = v12;
    objc_storeStrong(&v12, 0);
  }
  else
  {
    id v16 = 0;
  }
  objc_storeStrong(location, 0);
  int v10 = v16;

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15[1] = (id)a4;
  v15[0] = [(RestoreFromBackupController *)v17 tableView:location[0] viewForHeaderInSection:a4];
  [location[0] bounds];
  double v6 = v5;
  [location[0] layoutMargins];
  double v8 = v6 - v7;
  [location[0] layoutMargins];
  double v10 = v8 - v9;
  id v11 = [v15[0] sectionLabel];
  [v11 setPreferredMaxLayoutWidth:v10];

  [v15[0] systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
  double v13 = v12;
  objc_storeStrong(v15, 0);
  objc_storeStrong(location, 0);
  return v13;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v13 = a4;
  if (![(RestoreFromBackupController *)v15 _largerThanStandardAX]
    && (v15->_listState == 2 || v15->_listState == 3)
    && [(RestoreFromBackupController *)v15 _showAllFooterPresent]
    && (unsigned char *)a4 == (char *)[location[0] numberOfSections] - 1)
  {
    double v16 = 62.0;
  }
  else
  {
    id v5 = [(RestoreFromBackupController *)v15 tableView:location[0] viewForFooterInSection:a4];
    BOOL v6 = v5 != 0;

    BOOL v12 = v6;
    id v7 = [(RestoreFromBackupController *)v15 tableView];
    BOOL v8 = (uint64_t)[v7 numberOfSections] > v13 + 1;

    id v9 = [(RestoreFromBackupController *)v15 tableView:location[0] titleForHeaderInSection:v13 + 1];
    BOOL v10 = v9 != 0;

    if (!v12 && v8 && v10) {
      double v16 = 0.0;
    }
    else {
      double v16 = UITableViewAutomaticDimension;
    }
  }
  objc_storeStrong(location, 0);
  return v16;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return UITableViewAutomaticDimension;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v78 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v76 = 0;
  objc_storeStrong(&v76, a4);
  id v75 = 0;
  switch(v78->_listState)
  {
    case 0xFFFFFFFF:
      id v74 = [v76 section];
      id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
      id v8 = v75;
      id v75 = v7;

      id v9 = [v75 textLabel];
      [v9 setTextAlignment:1];

      if (v74 == (id)1)
      {
        id v10 = [v75 textLabel];
        id v11 = +[NSBundle mainBundle];
        BOOL v12 = [(NSBundle *)v11 localizedStringForKey:@"TRY_AGAIN_CELL" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
        [v10 setText:v12];

        goto LABEL_13;
      }
      if (v74 == (id)2) {
        goto LABEL_10;
      }
      if (v74 == (id)3)
      {
        id v13 = [v75 textLabel];
        id v14 = +[NSBundle mainBundle];
        id v15 = [(NSBundle *)v14 localizedStringForKey:@"RESTORE_ALTERNATIVE_FROM_MAC_OR_PC" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
        [v13 setText:v15];
      }
      goto LABEL_13;
    case 0:
      id v5 = [[SpinnerTableCell alloc] initWithStyle:0 reuseIdentifier:0];
      id v6 = v75;
      id v75 = v5;

      [v75 setSelectionStyle:0];
      break;
    case 1:
      id v73 = [v76 section];
      id v16 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
      id v17 = v75;
      id v75 = v16;

      id v18 = [v75 textLabel];
      [v18 setTextAlignment:1];

      if (v73 == (id)1)
      {
LABEL_10:
        id v19 = [v75 textLabel];
        id v20 = +[NSBundle mainBundle];
        id v21 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"RESTORE_ALTERNATIVE_NEW"];
        int64_t v22 = [(NSBundle *)v20 localizedStringForKey:v21 value:&stru_1002B4E18 table:@"RestoreFromBackup"];
        [v19 setText:v22];
      }
      else if (v73 == (id)2)
      {
        id v23 = [v75 textLabel];
        char v24 = +[NSBundle mainBundle];
        id v25 = [(NSBundle *)v24 localizedStringForKey:@"RESTORE_ALTERNATIVE_FROM_MAC_OR_PC" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
        [v23 setText:v25];
      }
LABEL_13:
      id v26 = [v75 textLabel];
      [v26 setNumberOfLines:0];

      break;
    case 2:
    case 3:
      id v72 = [(RestoreFromBackupController *)v78 restorableItemAtIndexPath:v76];
      char v71 = 0;
      char v69 = 0;
      char v67 = 0;
      unsigned __int8 v27 = 1;
      if (([v72 isCompatible] & 1) == 0)
      {
        id v70 = [(RestoreFromBackupController *)v78 availableUpdateVersion];
        char v69 = 1;
        unsigned __int8 v27 = 1;
        if ((objc_msgSend(v72, "isCompatibleWithUpdateToSystemVersion:") & 1) == 0)
        {
          id v68 = [(RestoreFromBackupController *)v78 betaEnrollmentStateManager];
          char v67 = 1;
          unsigned __int8 v27 = [v68 isRestorableSeedEnrolled:v72];
        }
      }
      if (v67) {

      }
      if (v69) {
      char v71 = v27 & 1;
      }
      id v28 = [location[0] dequeueReusableCellWithIdentifier:@"PBSnapshotCell"];
      id v29 = v75;
      id v75 = v28;

      if (!v75)
      {
        id v75 = [[DeviceRestoreBackupCell alloc] initWithStyle:3 reuseIdentifier:@"PBSnapshotCell"];
      }
      id v30 = [v75 textLabel];
      if (v71)
      {
        id v34 = +[UIColor _labelColor];
        [v30 setTextColor:v34];

        id v35 = [v75 detailTextLabel];
        id v36 = +[UIColor _labelColor];
        [v35 setTextColor:v36];

        [v75 setSelectionStyle:3];
      }
      else
      {
        id v31 = +[UIColor _secondaryLabelColor];
        [v30 setTextColor:v31];

        id v32 = [v75 detailTextLabel];
        id v33 = +[UIColor _secondaryLabelColor];
        [v32 setTextColor:v33];

        [v75 setSelectionStyle:0];
      }
      [v75 setAccessoryType:1];
      BOOL v66 = 0;
      BOOL v66 = v78->_listState == 3 || v78->_shouldForceShowTimeStampOnBackups;
      id v37 = [v75 textLabel];
      id v38 = [v72 dateStringWithStyle:v66];
      [v37 setText:v38];

      id v39 = [v75 textLabel];
      id v40 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
      [v39 setFont:v40];

      id v65 = 0;
      if (v71)
      {
        id v41 = [v72 deviceInfoString];
        id v42 = v65;
        id v65 = v41;
      }
      else
      {
        int v43 = +[NSBundle mainBundle];
        id v44 = [(NSBundle *)v43 localizedStringForKey:@"REQUIRED_OS_VERSION_%@" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
        id v45 = [v72 snapshot];
        id v46 = [v45 systemVersion];
        uint64_t v47 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v44, v46);
        id v48 = v65;
        id v65 = v47;
      }
      id v49 = [v75 imageView];
      id v50 = [v72 backup];
      id v51 = [v50 productType];
      id v52 = [(RestoreFromBackupController *)v78 traitCollection];
      id v53 = +[BuddyDeviceImageUtilities imageForDeviceModelWithModel:v51 traitCollection:v52];
      [v49 setImage:v53];

      id v54 = [v75 detailTextLabel];
      [v54 setText:v65];

      id v55 = [v75 detailTextLabel];
      int v56 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
      [v55 setFont:v56];

      sub_1000A2D38();
      [v75 setSeparatorInset:v57, v58, v59, v60];
      id v61 = [v72 accessibilityIdentifier];
      [v75 setAccessibilityIdentifier:v61];

      objc_storeStrong(&v65, 0);
      objc_storeStrong(&v72, 0);
      break;
    default:
      break;
  }
  int v62 = +[UIColor secondarySystemBackgroundColor];
  [v75 setBackgroundColor:v62];

  id v63 = v75;
  objc_storeStrong(&v75, 0);
  objc_storeStrong(&v76, 0);
  objc_storeStrong(location, 0);
  return v63;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v5 = [location[0] cellForRowAtIndexPath:v16];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v19 = 0;
    int v15 = 1;
  }
  else
  {
    id v14 = [(RestoreFromBackupController *)v18 restorableItemAtIndexPath:v16];
    char v12 = 0;
    char v10 = 0;
    char v7 = 0;
    if (v14)
    {
      char v7 = 0;
      if (([v14 isCompatible] & 1) == 0)
      {
        id v13 = [(RestoreFromBackupController *)v18 availableUpdateVersion];
        char v12 = 1;
        char v7 = 0;
        if ((objc_msgSend(v14, "isCompatibleWithUpdateToSystemVersion:") & 1) == 0)
        {
          id v11 = [(RestoreFromBackupController *)v18 betaEnrollmentStateManager];
          char v10 = 1;
          char v7 = ![(BuddyBetaEnrollmentStateManager *)v11 isRestorableSeedEnrolled:v14];
        }
      }
    }
    if (v10) {

    }
    if (v12) {
    if (v7)
    }
      id v19 = 0;
    else {
      id v19 = v16;
    }
    int v15 = 1;
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  id v8 = v19;

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  if (v18->_listState == -1)
  {
    id v15 = [v16 section];
    if (v15 == (id)1)
    {
      [(RestoreFromBackupController *)v18 setListState:0];
      [(RestoreFromBackupController *)v18 updateBackupListCompletion:0];
      goto LABEL_15;
    }
    if (v15 == (id)2)
    {
LABEL_5:
      [(RestoreFromBackupController *)v18 setupWithAlternateChoice:@"setUpAsNew"];
      goto LABEL_15;
    }
    if (v15 == (id)3) {
      [(RestoreFromBackupController *)v18 setupWithAlternateChoice:@"restoreFromiTunesBackup"];
    }
  }
  else
  {
    if (v18->_listState != 1)
    {
      [location[0] deselectRowAtIndexPath:v16 animated:1];
      id v13 = [(RestoreFromBackupController *)v18 restorableItemAtIndexPath:v16];
      id v5 = v18;
      id v6 = _NSConcreteStackBlock;
      int v7 = -1073741824;
      int v8 = 0;
      id v9 = sub_1000A48A8;
      char v10 = &unk_1002B20E8;
      id v11 = v18;
      id v12 = v13;
      [(RestoreFromBackupController *)v5 showRestoreWarningsIfNeededForRestorable:v13 completion:&v6];
      objc_storeStrong(&v12, 0);
      objc_storeStrong((id *)&v11, 0);
      objc_storeStrong(&v13, 0);
      goto LABEL_15;
    }
    id v14 = [v16 section];
    if (v14 == (id)1) {
      goto LABEL_5;
    }
    if (v14 == (id)2) {
      [(RestoreFromBackupController *)v18 setupWithAlternateChoice:@"restoreFromiTunesBackup"];
    }
  }
LABEL_15:
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)showAllBackups
{
}

- (void)handleDebugGesture
{
  id v20 = self;
  v19[1] = (id)a2;
  v19[0] = [objc_alloc((Class)sub_1000A4DCC()) initWithName:@"com.apple.mobilebackup"];
  BOOL v18 = [v19[0] enabledLevel] == (id)4;
  id v17 = @"iCloud Restore Debug Logging";
  if (v18) {
    id v2 = @"Debug Logging is Enabled";
  }
  else {
    id v2 = @"Debug Logging is Disabled";
  }
  id v16 = v2;
  if (v18) {
    id v3 = @"Disable Debug Logging";
  }
  else {
    id v3 = @"Enable Debug Logging";
  }
  id v15 = v3;
  id location = +[UIAlertController alertControllerWithTitle:v17 message:v16 preferredStyle:1];
  id v4 = location;
  int v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  char v10 = sub_1000A4EE4;
  id v11 = &unk_1002B2110;
  BOOL v13 = v18;
  id v12 = v19[0];
  id v5 = +[UIAlertAction actionWithTitle:v15 style:0 handler:&v8];
  [v4 addAction:v5, v8, v9, v10, v11];

  id v6 = location;
  int v7 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
  [v6 addAction:v7];

  [(RestoreFromBackupController *)v20 presentViewController:location animated:1 completion:0];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v19, 0);
}

- (BOOL)_largerThanStandardAX
{
  id v2 = +[UIApplication sharedApplication];
  id v3 = [(UIApplication *)v2 preferredContentSizeCategory];
  BOOL v4 = UIContentSizeCategoryCompareToCategory(UIContentSizeCategoryExtraLarge, v3) == NSOrderedAscending;

  return v4;
}

- (unint64_t)_backupListErrorSectionCount
{
  id v2 = [(RestoreFromBackupController *)self enrollmentCoordinator];
  BOOL v3 = (id)[(BuddyEnrollmentCoordinator *)v2 mdmEnrollmentChannel] == (id)2;

  if (v3) {
    return 3;
  }
  else {
    return 4;
  }
}

- (unint64_t)_noBackupsFoundSectionCount
{
  id v2 = [(RestoreFromBackupController *)self enrollmentCoordinator];
  BOOL v3 = (id)[(BuddyEnrollmentCoordinator *)v2 mdmEnrollmentChannel] == (id)2;

  if (v3) {
    return 2;
  }
  else {
    return 3;
  }
}

- (BOOL)_showAllFooterPresent
{
  BOOL v2 = 0;
  if (self->_listState == 2)
  {
    id v3 = [(NSMutableArray *)self->_visibleSimilarRestorables count];
    return v3 < (id)[(NSArray *)self->_similarRestorables count];
  }
  return v2;
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RestorableBackupItem)selectedRestorable
{
  return self->_selectedRestorable;
}

- (void)setSelectedRestorable:(id)a3
{
}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (id)showModalWiFiSettingsBlock
{
  return self->_showModalWiFiSettingsBlock;
}

- (void)setShowModalWiFiSettingsBlock:(id)a3
{
}

- (BuddyBetaEnrollmentStateManager)betaEnrollmentStateManager
{
  return self->_betaEnrollmentStateManager;
}

- (void)setBetaEnrollmentStateManager:(id)a3
{
}

- (BYSoftwareUpdateCache)softwareUpdateCache
{
  return self->_softwareUpdateCache;
}

- (void)setSoftwareUpdateCache:(id)a3
{
}

- (BuddyEnrollmentCoordinator)enrollmentCoordinator
{
  return self->_enrollmentCoordinator;
}

- (void)setEnrollmentCoordinator:(id)a3
{
}

- (BOOL)scanningForUpdate
{
  return self->_scanningForUpdate;
}

- (void)setScanningForUpdate:(BOOL)a3
{
  self->_scanningForUpdate = a3;
}

- (NSString)availableUpdateVersion
{
  return self->_availableUpdateVersion;
}

- (void)setAvailableUpdateVersion:(id)a3
{
}

- (UITableView)backupsTableView
{
  return self->_backupsTableView;
}

- (void)setBackupsTableView:(id)a3
{
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end