@interface BLDAAPURLRequest
- (BLDAAPURLRequest)initWithDSID:(id)a3 reason:(int64_t)a4;
- (NSData)body;
- (NSNumber)DSID;
- (NSString)daapURL;
- (id)createDaapURL:(id)a3;
- (id)description;
- (int64_t)dataEncoding;
- (int64_t)reason;
- (int64_t)requestMethod;
- (unint64_t)contentType;
- (void)_URLWithCompletionHandler:(id)a3;
- (void)_URLWithRetry:(BOOL)a3 completion:(id)a4;
- (void)_requestWithCompletionHandler:(id)a3;
- (void)_serverParametersWithCompletionHandler:(id)a3;
- (void)_valueForDAAPBagKey:(id)a3 completion:(id)a4;
- (void)executeWithCompletionHandler:(id)a3;
- (void)setBody:(id)a3;
- (void)setContentType:(unint64_t)a3;
- (void)setDSID:(id)a3;
- (void)setDaapURL:(id)a3;
- (void)setDataEncoding:(int64_t)a3;
- (void)setReason:(int64_t)a3;
- (void)setRequestMethod:(int64_t)a3;
@end

@implementation BLDAAPURLRequest

- (BLDAAPURLRequest)initWithDSID:(id)a3 reason:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BLDAAPURLRequest;
  v8 = [(BLDAAPURLRequest *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_DSID, a3);
    v9->_reason = a4;
    daapURL = v9->_daapURL;
    v9->_daapURL = (NSString *)&stru_26CED4330;
    v9->_requestMethod = 4;
  }
  return v9;
}

- (void)_requestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_21E022798;
  v8[3] = &unk_26448C2B8;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  objc_msgSend__URLWithCompletionHandler_(self, v6, (uint64_t)v8, v7);
}

- (id)createDaapURL:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_daapURL(self, v5, v6, v7);
  v11 = objc_msgSend_URLByAppendingPathComponent_(v4, v9, (uint64_t)v8, v10);

  return v11;
}

- (void)executeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_21E022D70;
  v8[3] = &unk_26448C290;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  objc_msgSend__requestWithCompletionHandler_(self, v6, (uint64_t)v8, v7);
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v9 = objc_msgSend_daapURL(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_requestMethod(self, v10, v11, v12);
  v17 = objc_msgSend_DSID(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_reason(self, v18, v19, v20);
  v24 = objc_msgSend_stringWithFormat_(v3, v22, @"<%@:%p url=%@ requestMethod=%ld dsid=%@ reason=%ld>", v23, v5, self, v9, v13, v17, v21);

  return v24;
}

- (void)_URLWithCompletionHandler:(id)a3
{
}

- (void)_URLWithRetry:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_21E0231D0;
  v9[3] = &unk_26448C308;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend__valueForDAAPBagKey_completion_(self, v8, @"base-url", (uint64_t)v9);
}

- (void)_valueForDAAPBagKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21E0233C4;
  v12[3] = &unk_26448C330;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  objc_msgSend__serverParametersWithCompletionHandler_(self, v10, (uint64_t)v12, v11);
}

- (void)_serverParametersWithCompletionHandler:(id)a3
{
  id v7 = a3;
  bag = self->_bag;
  if (!bag)
  {
    objc_msgSend_defaultBag(MEMORY[0x263F2BA48], v4, v5, v6);
    id v9 = (BUBag *)objc_claimAutoreleasedReturnValue();
    id v10 = self->_bag;
    self->_bag = v9;

    bag = self->_bag;
  }
  uint64_t v11 = objc_msgSend_purchaseDAAP(bag, v4, v5, v6);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_21E02359C;
  v15[3] = &unk_26448C358;
  id v16 = v7;
  id v12 = v7;
  objc_msgSend_valueWithCompletion_(v11, v13, (uint64_t)v15, v14);
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)daapURL
{
  return self->_daapURL;
}

- (void)setDaapURL:(id)a3
{
}

- (int64_t)requestMethod
{
  return self->_requestMethod;
}

- (void)setRequestMethod:(int64_t)a3
{
  self->_requestMethod = a3;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (int64_t)dataEncoding
{
  return self->_dataEncoding;
}

- (void)setDataEncoding:(int64_t)a3
{
  self->_dataEncoding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daapURL, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_DSID, 0);

  objc_storeStrong((id *)&self->_bag, 0);
}

@end