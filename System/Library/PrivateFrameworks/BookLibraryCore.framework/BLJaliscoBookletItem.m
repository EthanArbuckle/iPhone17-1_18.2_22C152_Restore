@interface BLJaliscoBookletItem
+ (id)arrayWithServerBookletItems:(id)a3;
+ (id)itemWithServerBookletItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSNumber)size;
- (NSString)storeDownloadParameters;
- (NSString)storeID;
- (NSString)title;
- (id)description;
- (unint64_t)hash;
- (void)setSize:(id)a3;
- (void)setStoreDownloadParameters:(id)a3;
- (void)setStoreID:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BLJaliscoBookletItem

+ (id)itemWithServerBookletItem:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v8 = objc_msgSend_title(v3, v5, v6, v7);
  objc_msgSend_setTitle_(v4, v9, (uint64_t)v8, v10);

  v14 = objc_msgSend_storeDownloadParameters(v3, v11, v12, v13);
  objc_msgSend_setStoreDownloadParameters_(v4, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_storeID(v3, v17, v18, v19);
  objc_msgSend_setStoreID_(v4, v21, (uint64_t)v20, v22);

  v26 = objc_msgSend_size(v3, v23, v24, v25);

  objc_msgSend_setSize_(v4, v27, (uint64_t)v26, v28);

  return v4;
}

+ (id)arrayWithServerBookletItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = objc_msgSend_itemWithServerBookletItem_(BLJaliscoBookletItem, v8, *(void *)(*((void *)&v17 + 1) + 8 * i), v9, (void)v17);
        objc_msgSend_addObject_(v4, v14, (uint64_t)v13, v15);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v17, (uint64_t)v21, 16);
    }
    while (v10);
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_title(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_title(v4, v9, v10, v11);
  if (objc_msgSend_isEqual_(v8, v13, (uint64_t)v12, v14))
  {
    long long v18 = objc_msgSend_storeDownloadParameters(self, v15, v16, v17);
    uint64_t v22 = objc_msgSend_storeDownloadParameters(v4, v19, v20, v21);
    if (objc_msgSend_isEqual_(v18, v23, (uint64_t)v22, v24))
    {
      uint64_t v28 = objc_msgSend_storeID(self, v25, v26, v27);
      v32 = objc_msgSend_storeID(v4, v29, v30, v31);
      if (objc_msgSend_isEqual_(v28, v33, (uint64_t)v32, v34))
      {
        v38 = objc_msgSend_size(self, v35, v36, v37);
        v42 = objc_msgSend_size(v4, v39, v40, v41);
        char isEqual = objc_msgSend_isEqual_(v38, v43, (uint64_t)v42, v44);
      }
      else
      {
        char isEqual = 0;
      }
    }
    else
    {
      char isEqual = 0;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  id v5 = objc_msgSend_title(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_storeDownloadParameters(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  uint64_t v21 = objc_msgSend_storeID(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_hash(v21, v22, v23, v24);
  v29 = objc_msgSend_size(self, v26, v27, v28);
  unint64_t v33 = v17 ^ v25 ^ objc_msgSend_hash(v29, v30, v31, v32);

  return v33;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v9 = objc_msgSend_title(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_storeDownloadParameters(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_storeID(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_size(self, v18, v19, v20);
  uint64_t v24 = objc_msgSend_stringWithFormat_(v3, v22, @"<%@:%p name=%@ redownloadParameters=%@ storeID=%@ size=%@>", v23, v5, self, v9, v13, v17, v21);

  return v24;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)storeDownloadParameters
{
  return self->_storeDownloadParameters;
}

- (void)setStoreDownloadParameters:(id)a3
{
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
}

- (NSNumber)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_storeDownloadParameters, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end