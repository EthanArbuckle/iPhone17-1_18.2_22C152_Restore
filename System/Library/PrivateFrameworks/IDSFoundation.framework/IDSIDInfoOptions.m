@interface IDSIDInfoOptions
+ (BOOL)supportsSecureCoding;
+ (id)currentIDInfo;
+ (id)refreshIDInfo;
+ (id)refreshIDInfoAndBypassLimit;
+ (id)sync_currentIDInfo;
+ (id)sync_refreshIDInfo;
- (BOOL)allowRefresh;
- (BOOL)bypassLimit;
- (BOOL)forceRefresh;
- (BOOL)respectExpiry;
- (BOOL)waitForReply;
- (IDSIDInfoOptions)init;
- (IDSIDInfoOptions)initWithBypassLimit:(BOOL)a3 allowRefresh:(BOOL)a4 forceRefresh:(BOOL)a5 respectExpiry:(BOOL)a6 waitForReply:(BOOL)a7;
- (IDSIDInfoOptions)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowRefresh:(BOOL)a3;
- (void)setBypassLimit:(BOOL)a3;
- (void)setForceRefresh:(BOOL)a3;
- (void)setRespectExpiry:(BOOL)a3;
- (void)setWaitForReply:(BOOL)a3;
@end

@implementation IDSIDInfoOptions

+ (id)currentIDInfo
{
  v2 = [IDSIDInfoOptions alloc];
  refreshed = objc_msgSend_initWithBypassLimit_allowRefresh_forceRefresh_respectExpiry_waitForReply_(v2, v3, 0, v4, 0, 0, 1, 0);
  return refreshed;
}

+ (id)refreshIDInfo
{
  v2 = [IDSIDInfoOptions alloc];
  refreshed = objc_msgSend_initWithBypassLimit_allowRefresh_forceRefresh_respectExpiry_waitForReply_(v2, v3, 0, v4, 1, 0, 1, 0);
  return refreshed;
}

+ (id)refreshIDInfoAndBypassLimit
{
  v2 = [IDSIDInfoOptions alloc];
  refreshed = objc_msgSend_initWithBypassLimit_allowRefresh_forceRefresh_respectExpiry_waitForReply_(v2, v3, 1, v4, 1, 0, 1, 0);
  return refreshed;
}

+ (id)sync_currentIDInfo
{
  v2 = [IDSIDInfoOptions alloc];
  refreshed = objc_msgSend_initWithBypassLimit_allowRefresh_forceRefresh_respectExpiry_waitForReply_(v2, v3, 0, v4, 0, 0, 1, 1);
  return refreshed;
}

+ (id)sync_refreshIDInfo
{
  v2 = [IDSIDInfoOptions alloc];
  refreshed = objc_msgSend_initWithBypassLimit_allowRefresh_forceRefresh_respectExpiry_waitForReply_(v2, v3, 0, v4, 1, 0, 1, 1);
  return refreshed;
}

- (IDSIDInfoOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSIDInfoOptions;
  result = [(IDSIDInfoOptions *)&v3 init];
  if (result)
  {
    result->_bypassLimit = 0;
    *(_DWORD *)&result->_allowRefresh = 257;
  }
  return result;
}

- (IDSIDInfoOptions)initWithBypassLimit:(BOOL)a3 allowRefresh:(BOOL)a4 forceRefresh:(BOOL)a5 respectExpiry:(BOOL)a6 waitForReply:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)IDSIDInfoOptions;
  result = [(IDSIDInfoOptions *)&v13 init];
  if (result)
  {
    result->_bypassLimit = a3;
    result->_allowRefresh = a4;
    result->_forceRefresh = a5;
    result->_respectExpiry = a6;
    result->_waitForReply = a7;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v34 = a3;
  uint64_t v7 = objc_msgSend_bypassLimit(self, v4, v5, v6);
  objc_msgSend_encodeBool_forKey_(v34, v8, v7, v9, @"bypassLimit");
  uint64_t v13 = objc_msgSend_allowRefresh(self, v10, v11, v12);
  objc_msgSend_encodeBool_forKey_(v34, v14, v13, v15, @"allowRefresh");
  uint64_t v19 = objc_msgSend_forceRefresh(self, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v34, v20, v19, v21, @"forceRefresh");
  uint64_t v25 = objc_msgSend_respectExpiry(self, v22, v23, v24);
  objc_msgSend_encodeBool_forKey_(v34, v26, v25, v27, @"respectExpiry");
  uint64_t v31 = objc_msgSend_waitForReply(self, v28, v29, v30);
  objc_msgSend_encodeBool_forKey_(v34, v32, v31, v33, @"waitForReply");
}

- (IDSIDInfoOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_decodeBoolForKey_(v4, v5, @"bypassLimit", v6);
  uint64_t v10 = objc_msgSend_decodeBoolForKey_(v4, v8, @"allowRefresh", v9);
  uint64_t v13 = objc_msgSend_decodeBoolForKey_(v4, v11, @"forceRefresh", v12);
  uint64_t v16 = objc_msgSend_decodeBoolForKey_(v4, v14, @"respectExpiry", v15);
  uint64_t v19 = objc_msgSend_decodeBoolForKey_(v4, v17, @"waitForReply", v18);

  return (IDSIDInfoOptions *)objc_msgSend_initWithBypassLimit_allowRefresh_forceRefresh_respectExpiry_waitForReply_(self, v20, v7, v21, v10, v13, v16, v19);
}

- (BOOL)allowRefresh
{
  return self->_allowRefresh;
}

- (void)setAllowRefresh:(BOOL)a3
{
  self->_allowRefresh = a3;
}

- (BOOL)respectExpiry
{
  return self->_respectExpiry;
}

- (void)setRespectExpiry:(BOOL)a3
{
  self->_respectExpiry = a3;
}

- (BOOL)waitForReply
{
  return self->_waitForReply;
}

- (void)setWaitForReply:(BOOL)a3
{
  self->_waitForReply = a3;
}

- (BOOL)forceRefresh
{
  return self->_forceRefresh;
}

- (void)setForceRefresh:(BOOL)a3
{
  self->_forceRefresh = a3;
}

- (BOOL)bypassLimit
{
  return self->_bypassLimit;
}

- (void)setBypassLimit:(BOOL)a3
{
  self->_bypassLimit = a3;
}

@end