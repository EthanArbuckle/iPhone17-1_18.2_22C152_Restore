@interface IAPInfoDAAPRequestEncoder
- (id)dataForRequestWithError:(id *)a3;
@end

@implementation IAPInfoDAAPRequestEncoder

- (id)dataForRequestWithError:(id *)a3
{
  revision = self->_revision;
  if (revision) {
    id v5 = (id)[(NSNumber *)revision intValue];
  }
  else {
    id v5 = 0;
  }
  v6 = self->_knownIAPs;
  uint64_t v7 = self;
  id v29 = [objc_alloc((Class)NSOutputStream) initToMemory];
  id v8 = [objc_alloc((Class)DKDAAPWriter) initWithStream:v29];
  [v8 startContainerWithCode:1633973106];
  [v8 writeUInt32:v5 withCode:1836413810];
  uint64_t v28 = v7;
  self;
  v36[0] = @"daap.databasesongs";
  v36[1] = @"dmap.status";
  v36[2] = @"dmap.updatetype";
  v36[3] = @"dmap.specifiedtotalcount";
  v36[4] = @"dmap.returnedcount";
  v36[5] = @"dmap.serverrevision";
  v36[6] = @"dmap.listing";
  v36[7] = @"dmap.listingitem";
  v36[8] = @"dmap.itemkind";
  v36[9] = @"com.apple.itunes.adam-id";
  v36[10] = @"daap.songdatemodified";
  v36[11] = @"com.apple.itunes.cloud-purchased-token";
  v36[12] = @"com.apple.itunes.store.in-app-purchase-type";
  v36[13] = @"com.apple.itunes.store.in-app-purchase-expiration-date";
  v36[14] = @"com.apple.itunes.store.app-adam-id";
  v36[15] = @"dmap.longitemid";
  v36[16] = @"com.apple.itunes.store.in-app-used-offers";
  v36[17] = @"com.apple.itunes.store.in-app-subscription-family-id";
  v36[18] = @"com.apple.itunes.store.in-app-auto-renew-status";
  v9 = +[NSArray arrayWithObjects:v36 count:19];
  v10 = [v9 componentsJoinedByString:@","];
  [v8 writeString:v10 withCode:1835365473];

  [v8 startContainerWithCode:1634038892];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v11 = v6;
  id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_msgSend(v8, "startContainerWithCode:", 1634038889, v28);
        v17 = [v16 purchaseDate];
        [v17 timeIntervalSince1970];
        uint64_t v19 = v18;

        [v8 writeUInt32:v19 withCode:1634038895];
        v20 = [v16 adamId];
        id v21 = [v20 unsignedLongLongValue];

        [v8 writeUInt64:v21 withCode:1835625572];
        [v8 endContainerWithCode:1634038889];
      }
      id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v13);
  }

  [v8 endContainerWithCode:1634038892];
  [v8 endContainerWithCode:1633973106];
  [v8 close];
  v22 = [v29 propertyForKey:NSStreamDataWrittenToMemoryStreamKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v22;
  }
  else
  {
    v24 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v35 = v26;
      id v27 = v26;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[%@]: IAP Info DAAP data not NSData", buf, 0xCu);
    }
    id v23 = 0;
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_knownIAPs, 0);
}

@end