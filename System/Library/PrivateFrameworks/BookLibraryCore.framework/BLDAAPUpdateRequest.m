@interface BLDAAPUpdateRequest
- (BLDAAPUpdateRequest)initWithDSID:(id)a3 reason:(int64_t)a4 sessionID:(id)a5 localVersion:(id)a6;
@end

@implementation BLDAAPUpdateRequest

- (BLDAAPUpdateRequest)initWithDSID:(id)a3 reason:(int64_t)a4 sessionID:(id)a5 localVersion:(id)a6
{
  v33[2] = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  v31.receiver = self;
  v31.super_class = (Class)BLDAAPUpdateRequest;
  v12 = [(BLDAAPURLRequest *)&v31 initWithDSID:a3 reason:a4];
  v15 = v12;
  if (v12)
  {
    objc_msgSend_setDaapURL_(v12, v13, @"update", v14);
    v16 = NSURL;
    v32[0] = @"session-id";
    v20 = objc_msgSend_stringValue(v10, v17, v18, v19);
    v32[1] = @"revision-number";
    v33[0] = v20;
    v33[1] = v11;
    v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v21, (uint64_t)v33, (uint64_t)v32, 2);
    v24 = objc_msgSend_bu_queryStringForDictionary_escapedValues_(v16, v23, (uint64_t)v22, 0);
    v27 = objc_msgSend_dataUsingEncoding_(v24, v25, 4, v26);
    objc_msgSend_setBody_(v15, v28, (uint64_t)v27, v29);
  }
  return v15;
}

@end