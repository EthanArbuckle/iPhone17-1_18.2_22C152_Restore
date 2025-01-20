@interface HWRecentsManager
+ (id)recentsDomain;
+ (id)sharedManager;
- (BOOL)_defaultsLoaded;
- (HWRecentsManager)init;
- (NSArray)items;
- (void)_addItem:(id)a3 dataRepresentation:(id)a4 persist:(BOOL)a5;
- (void)_deleteItem:(id)a3 notify:(BOOL)a4;
- (void)_loadDefaultItems;
- (void)_loadItemsFromIMRecentItemsList;
- (void)_loadItemsFromNSUserDefaults;
- (void)_loadStoredItems;
- (void)_notifyChanges;
- (void)_sortItems;
- (void)_storeItemAsData:(id)a3 optionalData:(id)a4 persist:(BOOL)a5;
- (void)_storeItemDataToDefaults:(id)a3 withUUID:(id)a4 persist:(BOOL)a5;
- (void)_synchronizeHandwritingToDefaults;
- (void)addItem:(id)a3;
- (void)deleteItem:(id)a3;
- (void)reloadStoredItems;
@end

@implementation HWRecentsManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12ED0;
  block[3] = &unk_28778;
  block[4] = a1;
  if (qword_33660 != -1) {
    dispatch_once(&qword_33660, block);
  }
  v2 = (void *)qword_33658;

  return v2;
}

+ (id)recentsDomain
{
  return @"com.apple.Handwriting.HandwritingProvider";
}

- (HWRecentsManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)HWRecentsManager;
  v2 = [(HWRecentsManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    cachedSortedItems = v2->_cachedSortedItems;
    v2->_cachedSortedItems = (NSMutableArray *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    itemsData = v2->_itemsData;
    v2->_itemsData = (NSMutableDictionary *)v5;

    v2->_defaultsLoaded = 0;
    v2->_storedItemsLoaded = 0;
    id v7 = objc_alloc((Class)NSUserDefaults);
    v8 = (NSUserDefaults *)[v7 initWithSuiteName:HWPreferencesDomain];
    handwritingDefaults = v2->_handwritingDefaults;
    v2->_handwritingDefaults = v8;
  }
  return v2;
}

- (NSArray)items
{
  if (!self->_storedItemsLoaded) {
    [(HWRecentsManager *)self _loadStoredItems];
  }
  cachedSortedItems = self->_cachedSortedItems;

  return (NSArray *)cachedSortedItems;
}

- (void)reloadStoredItems
{
  if (self->_storedItemsLoaded) {
    [(HWRecentsManager *)self _loadItemsFromIMRecentItemsList];
  }
}

- (void)addItem:(id)a3
{
}

- (void)deleteItem:(id)a3
{
}

- (void)_addItem:(id)a3 dataRepresentation:(id)a4 persist:(BOOL)a5
{
  BOOL v5 = a5;
  id v18 = a3;
  id v8 = a4;
  uint64_t v9 = [v18 uuid];
  if (v9
    && (v10 = (void *)v9,
        [v18 drawing],
        objc_super v11 = objc_claimAutoreleasedReturnValue(),
        int IsValid = DKDrawingIsValid(),
        v11,
        v10,
        IsValid))
  {
    itemsData = self->_itemsData;
    v14 = [v18 uuid];
    v15 = [v14 UUIDString];
    v16 = [(NSMutableDictionary *)itemsData valueForKey:v15];

    if (!v16)
    {
      [(NSMutableArray *)self->_cachedSortedItems addObject:v18];
      [(HWRecentsManager *)self _sortItems];
      [(HWRecentsManager *)self _storeItemAsData:v18 optionalData:v8 persist:v5];
      [(HWRecentsManager *)self _notifyChanges];
    }
  }
  else
  {
    v17 = [v18 drawing];
    NSLog(@"Attempted to add invalid handwriting: %@ drawing: %@", v18, v17);
  }
}

- (void)_deleteItem:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    v17 = v6;
    if ([(NSMutableArray *)self->_cachedSortedItems containsObject:v6])
    {
      itemsData = self->_itemsData;
      id v8 = [v17 uuid];
      uint64_t v9 = [v8 UUIDString];
      v10 = [(NSMutableDictionary *)itemsData objectForKey:v9];

      objc_super v11 = [(id)objc_opt_class() recentsDomain];
      v12 = IMSharedHelperMD5OfData();
      v13 = +[IMRecentItemsList sharedInstance];
      [v13 deleteRecentItemWithData:v10 GUID:v12 forDomain:v11];

      [(NSMutableArray *)self->_cachedSortedItems removeObject:v17];
      v14 = self->_itemsData;
      v15 = [v17 uuid];
      v16 = [v15 UUIDString];
      [(NSMutableDictionary *)v14 removeObjectForKey:v16];

      [(HWRecentsManager *)self _sortItems];
      if (v4) {
        [(HWRecentsManager *)self _notifyChanges];
      }
    }
  }

  _objc_release_x1();
}

- (void)_sortItems
{
}

- (void)_notifyChanges
{
  id v3 = +[NSNotification notificationWithName:HWRecentsManagerUpdatedNotification object:self];
  v2 = +[NSNotificationQueue defaultQueue];
  [v2 enqueueNotification:v3 postingStyle:2 coalesceMask:1 forModes:0];
}

- (void)_storeItemAsData:(id)a3 optionalData:(id)a4 persist:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = +[HWEncoding encodeHandwriting:v13 compress:1];
    if (!v10) {
      goto LABEL_6;
    }
  }
  objc_super v11 = [v13 uuid];

  if (v11)
  {
    v12 = [v13 uuid];
    [(HWRecentsManager *)self _storeItemDataToDefaults:v10 withUUID:v12 persist:v5];

    goto LABEL_7;
  }
LABEL_6:
  NSLog(@"Attempted to add nil data to defaults %s.", "-[HWRecentsManager _storeItemAsData:optionalData:persist:]");
LABEL_7:
}

- (void)_storeItemDataToDefaults:(id)a3 withUUID:(id)a4 persist:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  id v8 = a4;
  if (v15 && v8)
  {
    if (v5)
    {
      uint64_t v9 = [(id)objc_opt_class() recentsDomain];
      id v10 = v15;
      objc_super v11 = IMSharedHelperMD5OfData();
      v12 = +[IMRecentItemsList sharedInstance];
      [v12 addRecentItemWithData:v10 GUID:v11 infoDictionary:0 forDomain:v9];
    }
    itemsData = self->_itemsData;
    v14 = [v8 UUIDString];
    [(NSMutableDictionary *)itemsData setObject:v15 forKey:v14];
  }
  else
  {
    NSLog(@"Attempted to store nil data to defaults %s.", "-[HWRecentsManager _storeItemDataToDefaults:withUUID:persist:]");
  }
}

- (void)_loadStoredItems
{
  if (!self->_storedItemsLoaded)
  {
    self->_storedItemsLoaded = 1;
    if (![(HWRecentsManager *)self _defaultsLoaded]) {
      [(HWRecentsManager *)self _loadDefaultItems];
    }
    [(HWRecentsManager *)self _loadItemsFromIMRecentItemsList];
  }
}

- (void)_loadItemsFromIMRecentItemsList
{
  id v3 = [(id)objc_opt_class() recentsDomain];
  BOOL v4 = +[IMRecentItemsList sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_13710;
  v5[3] = &unk_289A8;
  v5[4] = self;
  [v4 fetchRecentItemsForDomain:v3 completion:v5];
}

- (void)_loadItemsFromNSUserDefaults
{
  v2 = [(NSUserDefaults *)self->_handwritingDefaults objectForKey:HWPreferencesStoredItemsDictionaryKey];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [v2 allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [v2 objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        if (v8)
        {
          uint64_t v9 = +[HWEncoding decodeHandwritingFromData:v8];
          id v10 = v9;
          if (v9)
          {
            objc_super v11 = [v9 drawing];
            int IsValid = DKDrawingIsValid();

            if (IsValid) {
              [(HWRecentsManager *)self _addItem:v10 dataRepresentation:v8 persist:0];
            }
          }
        }
        else
        {
          NSLog(@"%s encoding handwriting for storage failed.", "-[HWRecentsManager _loadItemsFromNSUserDefaults]");
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  [(HWRecentsManager *)self _synchronizeHandwritingToDefaults];
}

- (void)_synchronizeHandwritingToDefaults
{
  [(NSUserDefaults *)self->_handwritingDefaults setObject:self->_itemsData forKey:HWPreferencesStoredItemsDictionaryKey];
  handwritingDefaults = self->_handwritingDefaults;

  [(NSUserDefaults *)handwritingDefaults synchronize];
}

- (void)_loadDefaultItems
{
  CGAffineTransform *(__cdecl **v30)(CGAffineTransform *__return_ptr __struct_ptr, CGFloat, CGFloat);
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CGAffineTransform *(__cdecl **v42)(CGAffineTransform *__return_ptr __struct_ptr, CGFloat, CGFloat);
  int IsValid;
  BOOL v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  char *v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  id obj;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  long long v61;
  long long v62;
  long long v63;
  long long v64;
  long long v65;
  long long v66;
  long long v67;
  long long v68;
  long long v69;
  long long v70;
  long long v71;
  long long v72;
  unsigned char v73[128];
  unsigned char v74[128];
  unsigned char v75[128];

  if (![(HWRecentsManager *)self _defaultsLoaded])
  {
    self->_defaultsLoaded = 1;
    [(NSUserDefaults *)self->_handwritingDefaults setBool:1 forKey:HWPreferencesDefaultsLoadedKey];
    [(NSUserDefaults *)self->_handwritingDefaults setInteger:3 forKey:HWPreferencesVersionKey];
    id v3 = +[NSBundle hw_handwritingPluginBundle];
    id v4 = +[NSLocale preferredLanguages];
    id v5 = [v4 mutableCopy];
    v50 = v3;
    v59 = [v3 localizations];
    uint64_t v6 = +[NSMutableOrderedSet orderedSet];
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    obj = v4;
    id v7 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v70;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v70 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v69 + 1) + 8 * i);
          v12 = +[NSBundle preferredLocalizationsFromArray:v59 forPreferences:v5];
          id v13 = [v12 firstObject];

          [v6 addObject:v13];
          if ([v5 count]) {
            [v5 removeObject:v11];
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
      }
      while (v8);
    }
    v58 = v5;

    long long v14 = +[NSMutableOrderedSet orderedSet];
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v49 = v6;
    id v15 = [v49 countByEnumeratingWithState:&v65 objects:v74 count:16];
    if (v15)
    {
      id v16 = v15;
      unint64_t v17 = 0;
      uint64_t v18 = *(void *)v66;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v66 != v18) {
            objc_enumerationMutation(v49);
          }
          v20 = *(void **)(*((void *)&v65 + 1) + 8 * (void)j);
          unsigned int v21 = [v20 containsString:@"en"];
          v22 = [v50 URLsForResourcesWithExtension:@"data" subdirectory:0 localization:v20];
          v23 = v22;
          if (v21)
          {
            uint64_t v24 = [v22 sortedArrayUsingComparator:&stru_289E8];

            v23 = (void *)v24;
          }
          if ([v23 count])
          {
            [v14 addObjectsFromArray:v23];

            if (v17 > 1) {
              goto LABEL_24;
            }
            ++v17;
          }
          else
          {
          }
        }
        id v16 = [v49 countByEnumeratingWithState:&v65 objects:v74 count:16];
      }
      while (v16);
    }
LABEL_24:

    if (![v14 count]) {
      NSLog(@"Failed to find drawings for any of the following localizations %@", obj);
    }
    v52 = [(id)objc_opt_class() recentsDomain];
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v55 = v14;
    id v25 = [v55 countByEnumeratingWithState:&v61 objects:v73 count:16];
    v26 = v58;
    if (v25)
    {
      id v27 = v25;
      v28 = 0;
      uint64_t v29 = *(void *)v62;
      v30 = &CGAffineTransformMakeScale_ptr;
      v53 = *(void *)v62;
      do
      {
        v31 = 0;
        v51 = v28;
        v32 = 60 * (void)v28;
        v54 = v27;
        do
        {
          if (*(void *)v62 != v29) {
            objc_enumerationMutation(v55);
          }
          v33 = *(void *)(*((void *)&v61 + 1) + 8 * (void)v31);
          v35 = +[NSData dataWithContentsOfURL:v33];
          if ([v35 length])
          {
            v60 = v34;
            v36 = v27;
            v37 = v29;
            v38 = [v30[129] decodeHandwritingFromData:v35];
            v39 = [v38 uuid];
            v40 = [v39 UUIDString];

            v41 = [v38 drawing];
            v42 = v30;
            int IsValid = DKDrawingIsValid();

            if (IsValid) {
              v44 = v40 == 0;
            }
            else {
              v44 = 1;
            }
            if (v44)
            {
              NSLog(@"%s invalid drawing loaded from default handwriting set.", "-[HWRecentsManager _loadDefaultItems]");
              v30 = v42;
              uint64_t v29 = v37;
              id v27 = v36;
              v34 = v60;
            }
            else
            {
              v57 = +[NSDate dateWithTimeIntervalSince1970:978307200.0 - (double)(unint64_t)v32];
              objc_msgSend(v38, "setCreationDate:");
              v45 = [v42[129] encodeHandwriting:v38 compress:1];
              v46 = (void *)v45;
              if (v45)
              {
                v47 = IMSharedHelperMD5OfData();
                v48 = +[IMRecentItemsList sharedInstance];
                [v48 addRecentItemWithData:v46 GUID:v47 infoDictionary:0 forDomain:v52];
              }
              else
              {
                v47 = [v38 uuid];
                v48 = [v47 UUIDString];
                NSLog(@"%s failed to re-compress drawing from default handwriting set %@.", "-[HWRecentsManager _loadDefaultItems]", v48);
              }
              v34 = v60;

              uint64_t v29 = v53;
              id v27 = v54;
              v30 = &CGAffineTransformMakeScale_ptr;
            }

            v26 = v58;
          }

          v31 = (char *)v31 + 1;
          v32 += 60;
        }
        while (v27 != v31);
        id v27 = [v55 countByEnumeratingWithState:&v61 objects:v73 count:16];
        v28 = (char *)v31 + (void)v51;
      }
      while (v27);
    }
  }
}

- (BOOL)_defaultsLoaded
{
  if (self->_defaultsLoadedChecked) {
    return self->_defaultsLoaded;
  }
  if ((char *)[(NSUserDefaults *)self->_handwritingDefaults integerForKey:HWPreferencesVersionKey] != (char *)&dword_0 + 3)
  {
    [(NSUserDefaults *)self->_handwritingDefaults removeObjectForKey:HWPreferencesDefaultsLoadedKey];
    [(NSUserDefaults *)self->_handwritingDefaults removeObjectForKey:HWPreferencesStoredItemsDictionaryKey];
    [(NSUserDefaults *)self->_handwritingDefaults synchronize];
    NSLog(@"Deleting recents and resetting defaults");
  }
  BOOL result = [(NSUserDefaults *)self->_handwritingDefaults BOOLForKey:HWPreferencesDefaultsLoadedKey];
  self->_defaultsLoaded = result;
  self->_defaultsLoadedChecked = 1;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handwritingDefaults, 0);
  objc_storeStrong((id *)&self->_cachedSortedItems, 0);

  objc_storeStrong((id *)&self->_itemsData, 0);
}

@end