@interface BLDAAPItemsRequest
- (BLDAAPItemsRequest)initWithDSID:(id)a3 reason:(int64_t)a4 databaseID:(id)a5 body:(id)a6;
- (NSNumber)bagDatabaseID;
- (id)createDaapURL:(id)a3;
- (void)setBagDatabaseID:(id)a3;
@end

@implementation BLDAAPItemsRequest

- (BLDAAPItemsRequest)initWithDSID:(id)a3 reason:(int64_t)a4 databaseID:(id)a5 body:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v23.receiver = self;
  v23.super_class = (Class)BLDAAPItemsRequest;
  v12 = [(BLDAAPURLRequest *)&v23 initWithDSID:a3 reason:a4];
  v15 = v12;
  if (v12)
  {
    objc_msgSend_setContentType_(v12, v13, 0, v14);
    objc_msgSend_setBagDatabaseID_(v15, v16, (uint64_t)v10, v17);
    objc_msgSend_setBody_(v15, v18, (uint64_t)v11, v19);
    objc_msgSend_setDataEncoding_(v15, v20, 1, v21);
  }

  return v15;
}

- (id)createDaapURL:(id)a3
{
  v31[2] = *MEMORY[0x263EF8340];
  v4 = NSString;
  id v5 = a3;
  v9 = objc_msgSend_bagDatabaseID(self, v6, v7, v8);
  v12 = objc_msgSend_stringWithFormat_(v4, v10, @"databases/%@/items", v11, v9);
  v15 = objc_msgSend_URLByAppendingPathComponent_(v5, v13, (uint64_t)v12, v14);

  uint64_t v17 = objc_msgSend_queryItemWithName_value_(MEMORY[0x263F08BD0], v16, @"includeApplePubBooks", @"1");
  uint64_t v19 = objc_msgSend_queryItemWithName_value_(MEMORY[0x263F08BD0], v18, @"includeItemFlavors", @"1");
  uint64_t v21 = objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x263F08BA0], v20, (uint64_t)v15, 0);
  v31[0] = v17;
  v31[1] = v19;
  objc_super v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v22, (uint64_t)v31, 2);
  objc_msgSend_setQueryItems_(v21, v24, (uint64_t)v23, v25);

  v29 = objc_msgSend_URL(v21, v26, v27, v28);

  return v29;
}

- (NSNumber)bagDatabaseID
{
  return self->_bagDatabaseID;
}

- (void)setBagDatabaseID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end