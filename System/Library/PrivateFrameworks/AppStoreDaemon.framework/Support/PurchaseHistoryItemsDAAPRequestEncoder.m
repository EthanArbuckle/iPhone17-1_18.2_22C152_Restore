@interface PurchaseHistoryItemsDAAPRequestEncoder
- (id)dataForRequestWithError:(id *)a3;
@end

@implementation PurchaseHistoryItemsDAAPRequestEncoder

- (id)dataForRequestWithError:(id *)a3
{
  revision = self->_revision;
  if (revision) {
    id v5 = (id)[(NSNumber *)revision intValue];
  }
  else {
    id v5 = 0;
  }
  v6 = self->_knownApps;
  self;
  id v7 = [objc_alloc((Class)NSOutputStream) initToMemory];
  id v8 = [objc_alloc((Class)DKDAAPWriter) initWithStream:v7];
  [v8 startContainerWithCode:1633973106];
  self;
  v9 = [&off_10054DD88 componentsJoinedByString:@","];
  [v8 writeString:v9 withCode:1835365473];

  [v8 writeUInt32:v5 withCode:1836413810];
  [v8 writeUInt8:1 withCode:1835559268];
  [v8 writeUInt8:1 withCode:1634355568];
  v10 = sub_10041F030();
  v11 = +[NSString stringWithFormat:@"(%@)", v10];

  [v8 writeString:v11 withCode:1836152165];
  [v8 startContainerWithCode:1634038892];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v12 = v6;
  id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v8 startContainerWithCode:1634038889];
        objc_msgSend(v8, "writeUInt32:withCode:", objc_msgSend(v17, "purchaseToken"), 1634038895);
        objc_msgSend(v8, "writeUInt64:withCode:", objc_msgSend(v17, "lockerItemID"), 1835625572);
        [v8 endContainerWithCode:1634038889];
      }
      id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v14);
  }

  [v8 endContainerWithCode:1634038892];
  [v8 endContainerWithCode:1633973106];
  [v8 close];
  v18 = [v7 propertyForKey:NSStreamDataWrittenToMemoryStreamKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v18;
  }
  else
  {
    v20 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v29 = v22;
      id v23 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[%@]: Purchase History DAAP data not NSData", buf, 0xCu);
    }
    id v19 = 0;
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_knownApps, 0);
}

@end