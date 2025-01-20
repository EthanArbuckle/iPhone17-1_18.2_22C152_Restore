@interface BLMediaLibraryManager
- (BLMediaLibraryManager)init;
- (BLOperationQueue)operationQueue;
- (int64_t)addLibraryItem:(id)a3 error:(id *)a4;
- (void)addLibraryItemWithoutWaiting:(id)a3;
- (void)removeMediaItemsForStoreID:(int64_t)a3;
- (void)removeMediaItemsForStoreIDs:(id)a3;
@end

@implementation BLMediaLibraryManager

- (BLMediaLibraryManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)BLMediaLibraryManager;
  v2 = [(BLMediaLibraryManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(BLOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(BLOperationQueue *)v2->_operationQueue setName:@"MediaLibraryManager Queue"];
    [(BLOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    [(BLOperationQueue *)v2->_operationQueue setQualityOfService:17];
  }
  return v2;
}

- (int64_t)addLibraryItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = BLServiceMediaLibraryManagerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding (and waiting for finish) library item %@", buf, 0xCu);
  }

  v8 = [[BLAddItemToMediaLibraryOperation alloc] initWithIPodLibraryItem:v6];
  v9 = [(BLMediaLibraryManager *)self operationQueue];
  v15 = v8;
  v10 = +[NSArray arrayWithObjects:&v15 count:1];
  [v9 addOperations:v10 waitUntilFinished:1];

  v11 = [(BLOperation *)v8 error];

  if (v11)
  {
    if (a4)
    {
      [(BLOperation *)v8 error];
      id v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    v13 = [(BLAddItemToMediaLibraryOperation *)v8 insertedItemPersistentIdentifier];
    id v12 = objc_msgSend(v13, "bl_itemIdentifierValue");
  }
  return (int64_t)v12;
}

- (void)addLibraryItemWithoutWaiting:(id)a3
{
  id v4 = a3;
  v5 = BLServiceMediaLibraryManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Enqueueing operation to add library item %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [[BLAddItemToMediaLibraryOperation alloc] initWithIPodLibraryItem:v4];
  v7 = [(BLMediaLibraryManager *)self operationQueue];
  [v7 addOperation:v6];
}

- (void)removeMediaItemsForStoreID:(int64_t)a3
{
  id v4 = +[NSNumber numberWithLongLong:a3];
  id v6 = v4;
  v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [(BLMediaLibraryManager *)self removeMediaItemsForStoreIDs:v5];
}

- (void)removeMediaItemsForStoreIDs:(id)a3
{
  id v4 = a3;
  v5 = BLServiceMediaLibraryManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Enqueueing operation to remove meida library entires for storeIDs %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [[BLRemoveItemsFromMediaLibraryOperation alloc] initWithStoreIDsToRemove:v4];
  v7 = [(BLMediaLibraryManager *)self operationQueue];
  [v7 addOperation:v6];
}

- (BLOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
}

@end