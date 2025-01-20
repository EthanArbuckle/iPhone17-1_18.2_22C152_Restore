@interface MPMediaItemCollection
- (id)bk_cloudRepresentativeItem;
- (id)description;
@end

@implementation MPMediaItemCollection

- (id)bk_cloudRepresentativeItem
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(MPMediaItemCollection *)self items];
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    uint64_t v6 = MPMediaItemPropertyPurchaseHistoryID;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v14 != v5) {
        objc_enumerationMutation(v2);
      }
      v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
      v9 = [v8 valueForProperty:v6];
      if ([v8 mediaType] == &dword_4)
      {
        if ([v9 longLongValue]) {
          break;
        }
      }

      if (v4 == (id)++v7)
      {
        id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v10 = v8;

    if (v10) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_10:
  }
  v11 = NBDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_13BC0(v11);
  }

  id v10 = 0;
LABEL_15:

  return v10;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(MPMediaItemCollection *)self items];
  uint64_t v6 = +[NSString stringWithFormat:@"<%@(%p) %@>", v4, self, v5];

  return v6;
}

@end