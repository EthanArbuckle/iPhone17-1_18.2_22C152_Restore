@interface BLDAAPHideItemsRequest
- (BLDAAPHideItemsRequest)initWithDSID:(id)a3 databaseID:(id)a4 body:(id)a5;
@end

@implementation BLDAAPHideItemsRequest

- (BLDAAPHideItemsRequest)initWithDSID:(id)a3 databaseID:(id)a4 body:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)BLDAAPHideItemsRequest;
  v10 = [(BLDAAPURLRequest *)&v24 initWithDSID:a3 reason:6];
  v13 = v10;
  if (v10)
  {
    objc_msgSend_setContentType_(v10, v11, 0, v12);
    v16 = objc_msgSend_stringWithFormat_(NSString, v14, @"databases/%@/edit", v15, v8);
    objc_msgSend_setDaapURL_(v13, v17, (uint64_t)v16, v18);

    objc_msgSend_setBody_(v13, v19, (uint64_t)v9, v20);
    objc_msgSend_setDataEncoding_(v13, v21, 1, v22);
  }

  return v13;
}

@end