@interface PurchaseHistoryHideShowRequestEncoder
- (id)dataForRequestWithError:(id *)a3;
@end

@implementation PurchaseHistoryHideShowRequestEncoder

- (id)dataForRequestWithError:(id *)a3
{
  id v22 = [objc_alloc((Class)NSOutputStream) initToMemory];
  id v4 = [objc_alloc((Class)DKDAAPWriter) initWithStream:v22];
  [v4 startContainerWithCode:1835360883];
  [v4 writeUInt8:2 withCode:1835625316];
  [v4 startContainerWithCode:1835819884];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v21 = self;
  v5 = self->_items;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v9);
        objc_msgSend(v4, "startContainerWithCode:", 1835821428, v21);
        if (v10)
        {
          id v11 = *(id *)(v10 + 16);
          id v12 = [v11 lockerItemID];

          [v4 writeUInt64:v12 withCode:1835625572];
          BOOL v13 = *(unsigned char *)(v10 + 8) != 0;
        }
        else
        {
          objc_msgSend(v4, "writeUInt64:withCode:", objc_msgSend(0, "lockerItemID"), 1835625572);
          BOOL v13 = 0;
        }
        [v4 writeUInt8:!v13 withCode:1835624553];
        [v4 endContainerWithCode:1835821428];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v14 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
      id v7 = v14;
    }
    while (v14);
  }

  [v4 endContainerWithCode:1835819884];
  [v4 endContainerWithCode:1835360883];
  [v4 close];
  v15 = [v22 propertyForKey:NSStreamDataWrittenToMemoryStreamKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v15;
  }
  else
  {
    v17 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v28 = v19;
      id v20 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[%@]: Purchase History DAAP data not NSData", buf, 0xCu);
    }
    id v16 = 0;
  }

  return v16;
}

- (void).cxx_destruct
{
}

@end