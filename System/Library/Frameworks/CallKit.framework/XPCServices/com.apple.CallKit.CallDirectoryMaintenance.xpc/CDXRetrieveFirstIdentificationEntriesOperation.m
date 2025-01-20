@interface CDXRetrieveFirstIdentificationEntriesOperation
- (CDXRetrieveFirstIdentificationEntriesOperation)init;
- (CDXRetrieveFirstIdentificationEntriesOperation)initWithPhoneNumbers:(id)a3 extensionsDataSource:(id)a4 store:(id)a5;
- (CDXRetrieveFirstIdentificationEntriesOperation)initWithPhoneNumbers:(id)a3 store:(id)a4;
- (CDXRetrieveFirstIdentificationEntriesOperationExtensionsDataSource)extensionsDataSource;
- (CXCallDirectorySanitizer)sanitizer;
- (CXCallDirectoryStore)store;
- (NSArray)phoneNumbers;
- (OS_dispatch_queue)queue;
- (id)_canonicalizedPhoneNumbersToPhoneNumbers:(id)a3;
- (id)_storeIdentificationEntryToIdentificationEntriesForDictionary:(id)a3;
- (void)performWithCompletionHandler:(id)a3;
- (void)setExtensionsDataSource:(id)a3;
- (void)setPhoneNumbers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSanitizer:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation CDXRetrieveFirstIdentificationEntriesOperation

- (CDXRetrieveFirstIdentificationEntriesOperation)initWithPhoneNumbers:(id)a3 extensionsDataSource:(id)a4 store:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CDXRetrieveFirstIdentificationEntriesOperation;
  v11 = [(CDXRetrieveFirstIdentificationEntriesOperation *)&v19 init];
  if (v11)
  {
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.callkit.calldirectory.retrievefirstidentificationentriesoperation", 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    v14 = (NSArray *)[v8 copy];
    phoneNumbers = v11->_phoneNumbers;
    v11->_phoneNumbers = v14;

    objc_storeStrong((id *)&v11->_extensionsDataSource, a4);
    objc_storeStrong((id *)&v11->_store, a5);
    v16 = (CXCallDirectorySanitizer *)objc_alloc_init((Class)CXCallDirectorySanitizer);
    sanitizer = v11->_sanitizer;
    v11->_sanitizer = v16;
  }
  return v11;
}

- (CDXRetrieveFirstIdentificationEntriesOperation)initWithPhoneNumbers:(id)a3 store:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(CDXRetrieveFirstIdentificationEntriesOperationExtensionsDataSource);
  id v9 = [(CDXRetrieveFirstIdentificationEntriesOperation *)self initWithPhoneNumbers:v7 extensionsDataSource:v8 store:v6];

  return v9;
}

- (CDXRetrieveFirstIdentificationEntriesOperation)init
{
  return 0;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(CDXRetrieveFirstIdentificationEntriesOperation *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013510;
  v7[3] = &unk_100034BB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)_storeIdentificationEntryToIdentificationEntriesForDictionary:(id)a3
{
  id v3 = a3;
  v26 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  v28 = +[NSMutableDictionary dictionary];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v27 = *(void *)v31;
    *(void *)&long long v6 = 138412546;
    long long v24 = v6;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v31 != v27) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v8);
        id v10 = objc_msgSend(v4, "objectForKeyedSubscript:", v9, v24);
        v11 = [v10 extensionBundleIdentifier];
        uint64_t v12 = [v28 objectForKeyedSubscript:v11];
        if (v12)
        {
          v13 = v12;
          id v14 = 0;
LABEL_10:
          id v16 = objc_alloc_init((Class)CXCallDirectoryIdentificationEntry);
          v17 = [v13 identifier];
          [v16 setExtensionIdentifier:v17];

          v18 = [v13 localizedName];
          [v16 setLocalizedExtensionName:v18];

          objc_super v19 = [v13 localizedContainingAppName];
          [v16 setLocalizedExtensionContainingAppName:v19];

          v20 = [v10 localizedLabel];
          [v16 setLocalizedLabel:v20];

          [v26 setObject:v16 forKeyedSubscript:v9];
          goto LABEL_11;
        }
        v15 = [(CDXRetrieveFirstIdentificationEntriesOperation *)self extensionsDataSource];
        id v29 = 0;
        v13 = [v15 installedExtensionWithIdentifier:v11 error:&v29];
        id v14 = v29;

        if (v13)
        {
          [v28 setObject:v13 forKeyedSubscript:v11];
          goto LABEL_10;
        }
        v13 = sub_100006944();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v24;
          v35 = v11;
          __int16 v36 = 2112;
          id v37 = v14;
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error retrieving extension with store identification entry extension bundle identifier %@: %@", buf, 0x16u);
        }
LABEL_11:

        id v8 = (char *)v8 + 1;
      }
      while (v7 != v8);
      id v21 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
      id v7 = v21;
    }
    while (v21);
  }

  id v22 = [v26 copy];

  return v22;
}

- (id)_canonicalizedPhoneNumbersToPhoneNumbers:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v20;
    *(void *)&long long v8 = 138412290;
    long long v18 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v13 = [(CDXRetrieveFirstIdentificationEntriesOperation *)self sanitizer];
        id v14 = [v13 canonicalizedPhoneNumber:v12];

        if (v14)
        {
          [v5 setObject:v12 forKeyedSubscript:v14];
        }
        else
        {
          v15 = sub_100006944();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            uint64_t v24 = v12;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unable to canonicalize phone number '%@'", buf, 0xCu);
          }
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v9);
  }

  id v16 = [v5 copy];

  return v16;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (void)setPhoneNumbers:(id)a3
{
}

- (CDXRetrieveFirstIdentificationEntriesOperationExtensionsDataSource)extensionsDataSource
{
  return self->_extensionsDataSource;
}

- (void)setExtensionsDataSource:(id)a3
{
}

- (CXCallDirectoryStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (CXCallDirectorySanitizer)sanitizer
{
  return self->_sanitizer;
}

- (void)setSanitizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sanitizer, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_extensionsDataSource, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end