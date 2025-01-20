@interface BLAddItemToMediaLibraryOperation
- (BLAddItemToMediaLibraryOperation)initWithIPodLibraryItem:(id)a3;
- (BLMLImporterItem)IPodLibraryItem;
- (NSNumber)insertedItemPersistentIdentifier;
- (id)_libraryItem;
- (void)_setInsertedItemPersistentIdentifier:(int64_t)a3;
- (void)run;
@end

@implementation BLAddItemToMediaLibraryOperation

- (BLAddItemToMediaLibraryOperation)initWithIPodLibraryItem:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLAddItemToMediaLibraryOperation;
  v5 = [(BLOperation *)&v9 init];
  if (v5)
  {
    v6 = (BLMLImporterItem *)[v4 copy];
    libraryItem = v5->_libraryItem;
    v5->_libraryItem = v6;
  }
  return v5;
}

- (BLMLImporterItem)IPodLibraryItem
{
  [(BLOperation *)self lock];
  id v3 = [(BLMLImporterItem *)self->_libraryItem copy];
  [(BLOperation *)self unlock];

  return (BLMLImporterItem *)v3;
}

- (NSNumber)insertedItemPersistentIdentifier
{
  [(BLOperation *)self lock];
  id v3 = self->_insertedItemPersistentIdentifier;
  [(BLOperation *)self unlock];

  return v3;
}

- (void)run
{
  id v3 = [(BLAddItemToMediaLibraryOperation *)self _libraryItem];
  id v4 = BLServiceMediaLibraryManagerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    v7 = [v3 itemMediaPath];
    *(_DWORD *)buf = 138412546;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: Adding media item to iPod library: %@", buf, 0x16u);
  }
  v8 = +[BLMLImporter deviceMLImporter];
  id v16 = 0;
  id v9 = [v8 addLibraryItem:v3 error:&v16];
  id v10 = v16;

  v11 = BLServiceMediaLibraryManagerLog();
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v3;
      v13 = "Item added. Persistent id %lld Item: %@";
      v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v3;
    __int16 v19 = 2112;
    id v20 = v10;
    v13 = "Adding failed for item %@. Error  %@";
    v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    goto LABEL_8;
  }

  [(BLAddItemToMediaLibraryOperation *)self _setInsertedItemPersistentIdentifier:v9];
  [(BLOperation *)self setError:v10];
  [(BLOperation *)self setSuccess:v9 != 0];
}

- (id)_libraryItem
{
  [(BLOperation *)self lock];
  id v3 = self->_libraryItem;
  [(BLOperation *)self unlock];

  return v3;
}

- (void)_setInsertedItemPersistentIdentifier:(int64_t)a3
{
  [(BLOperation *)self lock];
  v5 = (NSNumber *)[objc_alloc((Class)NSNumber) initWithLongLong:a3];
  insertedItemPersistentIdentifier = self->_insertedItemPersistentIdentifier;
  self->_insertedItemPersistentIdentifier = v5;

  [(BLOperation *)self unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryItem, 0);

  objc_storeStrong((id *)&self->_insertedItemPersistentIdentifier, 0);
}

@end