@interface BLRestoreContentItem
- (BLRestoreContentItem)init;
- (BLRestoreContentItem)initWithRestoreRequestItem:(id)a3;
- (BOOL)isDRMFree;
- (BOOL)isEligibleForRestore:(id *)a3;
- (NSNumber)cloudItemID;
- (NSNumber)storeAccountID;
- (NSNumber)storeItemID;
- (NSNumber)storeOriginalPurchaserAccountID;
- (NSString)downloadKind;
- (NSString)storeAccountAppleID;
- (NSString)storeFlavor;
- (NSString)storeFrontID;
- (NSString)title;
- (id)_restoreKeyForAssetProperty:(id)a3;
- (id)_restoreKeyForDownloadProperty:(id)a3;
- (id)copyRestoreDictionary;
- (void)_setValue:(id)a3 forProperty:(id)a4;
- (void)setCloudItemID:(id)a3;
- (void)setDRMFree:(BOOL)a3;
- (void)setDownloadKind:(id)a3;
- (void)setStoreAccountAppleID:(id)a3;
- (void)setStoreAccountID:(id)a3;
- (void)setStoreFlavor:(id)a3;
- (void)setStoreFrontID:(id)a3;
- (void)setStoreItemID:(id)a3;
- (void)setStoreOriginalPurchaserAccountID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3 forAssetProperty:(id)a4;
- (void)setValue:(id)a3 forDownloadProperty:(id)a4;
@end

@implementation BLRestoreContentItem

- (BLRestoreContentItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)BLRestoreContentItem;
  v2 = [(BLRestoreContentItem *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    properties = v2->_properties;
    v2->_properties = v3;
  }
  return v2;
}

- (BLRestoreContentItem)initWithRestoreRequestItem:(id)a3
{
  id v4 = a3;
  v5 = [(BLRestoreContentItem *)self init];
  if (v5)
  {
    v37[0] = BLSSDownloadPropertyKind;
    v37[1] = BLSSDownloadPropertyIsRestore;
    v37[2] = BLSSDownloadPropertyStoreAccountIdentifier;
    v37[3] = BLSSDownloadPropertyStoreAccountAppleID;
    v37[4] = BLSSDownloadPropertyStoreCollectionIdentifier;
    v37[5] = BLSSDownloadPropertyStoreFrontIdentifier;
    v37[6] = BLSSDownloadPropertyStoreItemIdentifier;
    v37[7] = BLSSDownloadPropertyStoreSoftwareVersionIdentifier;
    v37[8] = BLSSDownloadPropertyTitle;
    objc_super v6 = +[NSArray arrayWithObjects:v37 count:9];
    v7 = [v4 downloadDictionary];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v14 = [v7 objectForKeyedSubscript:v13];
          [(BLRestoreContentItem *)v5 setValue:v14 forDownloadProperty:v13];
        }
        id v10 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v10);
    }

    v35[0] = BLSSDownloadAssetPropertyIsDRMFree;
    v35[1] = BLSSDownloadAssetPropertyStoreFlavor;
    v35[2] = BLSSDownloadAssetPropertyVideoDimensions;
    v15 = +[NSArray arrayWithObjects:v35 count:3];
    id v25 = v4;
    v16 = [v4 assetDictionary];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v15;
    id v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * (void)j);
          v23 = [v16 objectForKeyedSubscript:v22];
          [(BLRestoreContentItem *)v5 setValue:v23 forAssetProperty:v22];
        }
        id v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v19);
    }

    id v4 = v25;
  }

  return v5;
}

- (NSNumber)cloudItemID
{
  return (NSNumber *)[(NSMutableDictionary *)self->_properties objectForKeyedSubscript:@"cloud-id"];
}

- (id)copyRestoreDictionary
{
  id v3 = 0;
  if ([(BLRestoreContentItem *)self isEligibleForRestore:0])
  {
    id v3 = [(NSMutableDictionary *)self->_properties mutableCopy];
    id v4 = [v3 objectForKeyedSubscript:@"flavor"];

    if (v4)
    {
      [v3 removeObjectForKey:@"drm-free"];
      [v3 removeObjectForKey:@"dimensions"];
    }
    v5 = [v3 objectForKeyedSubscript:@"store-front-id"];
    if (v5)
    {
      objc_super v6 = v5;
      v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v5 integerValue]);

      [v3 setObject:v7 forKeyedSubscript:@"store-front-id"];
    }
    originalPurchaserAccountID = self->_originalPurchaserAccountID;
    if (originalPurchaserAccountID) {
      [v3 setObject:originalPurchaserAccountID forKeyedSubscript:@"ownerDsid"];
    }
  }
  return v3;
}

- (NSString)downloadKind
{
  return (NSString *)[(NSMutableDictionary *)self->_properties objectForKeyedSubscript:@"kind"];
}

- (BOOL)isDRMFree
{
  v2 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:@"drm-free"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isEligibleForRestore:(id *)a3
{
  if (!self->_isRestore)
  {
    v12 = sub_10004B6AC(0, 0, 0);
    BOOL v13 = 0;
    if (!a3) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  v5 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:@"cloud-id"];
  uint64_t v6 = BLGetItemIdentifierFromValue();

  v7 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:@"item-id"];
  uint64_t v8 = BLGetItemIdentifierFromValue();

  id v9 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:@"kind"];
  id v10 = v9;
  if (v6 | v8)
  {
    if (!self->_accountID && !self->_appleID)
    {
      int v11 = 119;
      goto LABEL_19;
    }
    if (!v9)
    {
      int v11 = 117;
      goto LABEL_19;
    }
    unsigned int v14 = [v9 isEqualToString:BLDownloadKindAudiobook];
    properties = self->_properties;
    if (v14)
    {
      v16 = [(NSMutableDictionary *)properties objectForKeyedSubscript:@"dimensions"];
      if (v16) {
        goto LABEL_13;
      }
      properties = self->_properties;
    }
    v16 = [(NSMutableDictionary *)properties objectForKeyedSubscript:@"drm-free"];
    if (!v16)
    {
      id v17 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:@"flavor"];

      if (!v17)
      {
        int v11 = 118;
        goto LABEL_19;
      }
LABEL_14:
      v12 = 0;
      BOOL v13 = 1;
      goto LABEL_20;
    }
LABEL_13:

    goto LABEL_14;
  }
  int v11 = 116;
LABEL_19:
  v12 = sub_10004B6AC(v11, 0, 0);
  BOOL v13 = 0;
LABEL_20:

  if (a3) {
LABEL_21:
  }
    *a3 = v12;
LABEL_22:

  return v13;
}

- (void)setCloudItemID:(id)a3
{
}

- (void)setDownloadKind:(id)a3
{
}

- (void)setDRMFree:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(BLRestoreContentItem *)self _setValue:v4 forProperty:@"drm-free"];
}

- (void)setStoreFlavor:(id)a3
{
}

- (void)setStoreFrontID:(id)a3
{
}

- (void)setStoreItemID:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setValue:(id)a3 forAssetProperty:(id)a4
{
  id v6 = a3;
  id v7 = [(BLRestoreContentItem *)self _restoreKeyForAssetProperty:a4];
  [(BLRestoreContentItem *)self _setValue:v6 forProperty:v7];
}

- (void)setValue:(id)a3 forDownloadProperty:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(BLRestoreContentItem *)self _restoreKeyForDownloadProperty:v6];
  if (v7)
  {
    [(BLRestoreContentItem *)self _setValue:v8 forProperty:v7];
  }
  else if ([v6 isEqualToString:BLSSDownloadPropertyIsRestore])
  {
    self->_isRestore = [v8 BOOLValue];
  }
  else if ([v6 isEqualToString:BLSSDownloadPropertyStoreAccountAppleID])
  {
    [(BLRestoreContentItem *)self setStoreAccountAppleID:v8];
  }
  else if ([v6 isEqualToString:BLSSDownloadPropertyStoreAccountIdentifier])
  {
    [(BLRestoreContentItem *)self setStoreAccountID:v8];
  }
  else if ([v6 isEqualToString:BLSSDownloadPropertyTitle])
  {
    [(BLRestoreContentItem *)self setTitle:v8];
  }
}

- (NSString)storeFlavor
{
  return (NSString *)[(NSMutableDictionary *)self->_properties objectForKeyedSubscript:@"flavor"];
}

- (NSString)storeFrontID
{
  return (NSString *)[(NSMutableDictionary *)self->_properties objectForKeyedSubscript:@"store-front-id"];
}

- (NSNumber)storeItemID
{
  return (NSNumber *)[(NSMutableDictionary *)self->_properties objectForKeyedSubscript:@"item-id"];
}

- (NSString)title
{
  return (NSString *)[(NSMutableDictionary *)self->_properties objectForKeyedSubscript:@"title"];
}

- (id)_restoreKeyForAssetProperty:(id)a3
{
  uint64_t v3 = qword_1001C8228;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1001C8228, &stru_1001A3088);
  }
  v5 = [(id)qword_1001C8220 objectForKeyedSubscript:v4];

  return v5;
}

- (id)_restoreKeyForDownloadProperty:(id)a3
{
  uint64_t v3 = qword_1001C8238;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1001C8238, &stru_1001A30A8);
  }
  v5 = [(id)qword_1001C8230 objectForKeyedSubscript:v4];

  return v5;
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v8)
    {
      if ([v8 conformsToProtocol:&OBJC_PROTOCOL___NSCopying])
      {
        id v7 = [v8 copy];
        [(NSMutableDictionary *)self->_properties setObject:v7 forKeyedSubscript:v6];
      }
      else
      {
        [(NSMutableDictionary *)self->_properties setObject:v8 forKeyedSubscript:v6];
      }
    }
    else
    {
      [(NSMutableDictionary *)self->_properties removeObjectForKey:v6];
    }
  }
}

- (NSString)storeAccountAppleID
{
  return self->_appleID;
}

- (void)setStoreAccountAppleID:(id)a3
{
}

- (NSNumber)storeAccountID
{
  return self->_accountID;
}

- (void)setStoreAccountID:(id)a3
{
}

- (NSNumber)storeOriginalPurchaserAccountID
{
  return self->_originalPurchaserAccountID;
}

- (void)setStoreOriginalPurchaserAccountID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_originalPurchaserAccountID, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

@end