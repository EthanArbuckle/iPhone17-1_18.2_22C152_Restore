@interface BLURLRequestEncoder
+ (id)DAAPClientVersionString;
+ (id)DAAPPurchaseVersionString;
- (BLURLRequestEncoder)initWithBag:(id)a3 withURLRequest:(id)a4;
- (NSNumber)dsid;
- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4;
- (int64_t)reason;
- (unint64_t)contentType;
- (void)setContentType:(unint64_t)a3;
- (void)setDsid:(id)a3;
- (void)setReason:(int64_t)a3;
@end

@implementation BLURLRequestEncoder

- (BLURLRequestEncoder)initWithBag:(id)a3 withURLRequest:(id)a4
{
  id v6 = a4;
  v68.receiver = self;
  v68.super_class = (Class)BLURLRequestEncoder;
  v10 = [(AMSURLRequestEncoder *)&v68 initWithBag:a3];
  if (v10)
  {
    v11 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v7, v8, v9);
    v15 = objc_msgSend_activeStoreAccount(v11, v12, v13, v14);
    objc_msgSend_setAccount_(v10, v16, (uint64_t)v15, v17);

    objc_msgSend_setIncludeClientVersions_(v10, v18, 0, v19);
    objc_msgSend_setUrlKnownToBeTrusted_(v10, v20, 1, v21);
    objc_msgSend_setMescalType_(v10, v22, 1, v23);
    v27 = objc_msgSend_currentProcess(MEMORY[0x263F27E08], v24, v25, v26);
    v31 = objc_msgSend_copy(v27, v28, v29, v30);

    objc_msgSend_setBundleIdentifier_(v31, v32, @"com.apple.iBooks", v33);
    objc_msgSend_setExecutableName_(v31, v34, @"com.apple.iBooks", v35);
    objc_msgSend_setClientInfo_(v10, v36, (uint64_t)v31, v37);
    uint64_t v41 = objc_msgSend_contentType(v6, v38, v39, v40);
    objc_msgSend_setContentType_(v10, v42, v41, v43);
    v47 = objc_msgSend_DSID(v6, v44, v45, v46);
    objc_msgSend_setDsid_(v10, v48, (uint64_t)v47, v49);

    uint64_t v53 = objc_msgSend_reason(v6, v50, v51, v52);
    objc_msgSend_setReason_(v10, v54, v53, v55);
    objc_msgSend_setDialogOptions_(v10, v56, 1, v57);
    if (objc_msgSend_dataEncoding(v6, v58, v59, v60))
    {
      uint64_t v64 = objc_msgSend_dataEncoding(v6, v61, v62, v63);
      objc_msgSend_setRequestEncoding_(v10, v65, v64, v66);
    }
  }
  return v10;
}

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  v10 = objc_msgSend_mutableCopy(a3, v7, v8, v9);
  v11 = NSNumber;
  uint64_t v15 = objc_msgSend_reason(self, v12, v13, v14);
  v18 = objc_msgSend_numberWithInteger_(v11, v16, v15, v17);
  v22 = objc_msgSend_stringValue(v18, v19, v20, v21);
  objc_msgSend_setValue_forHTTPHeaderField_(v10, v23, (uint64_t)v22, @"Client-Cloud-DAAP-Request-Reason");

  v27 = objc_msgSend_DAAPPurchaseVersionString(BLURLRequestEncoder, v24, v25, v26);
  objc_msgSend_setValue_forHTTPHeaderField_(v10, v28, (uint64_t)v27, @"Client-Cloud-Purchase-Daap-Version");

  v32 = objc_msgSend_DAAPClientVersionString(BLURLRequestEncoder, v29, v30, v31);
  objc_msgSend_setValue_forHTTPHeaderField_(v10, v33, (uint64_t)v32, @"Client-DAAP-Version");

  uint64_t v37 = objc_msgSend_account(self, v34, v35, v36);

  if (v37)
  {
    uint64_t v41 = objc_msgSend_dsid(self, v38, v39, v40);
    if (v41)
    {
      v42 = (void *)v41;
      uint64_t v43 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v38, v39, v40);
      v47 = objc_msgSend_activeStoreAccount(v43, v44, v45, v46);
      uint64_t v51 = objc_msgSend_ams_DSID(v47, v48, v49, v50);
      uint64_t v55 = objc_msgSend_dsid(self, v52, v53, v54);
      char isEqualToNumber = objc_msgSend_isEqualToNumber_(v51, v56, (uint64_t)v55, v57);

      if ((isEqualToNumber & 1) == 0)
      {
        uint64_t v59 = objc_msgSend_dsid(self, v38, v39, v40);
        uint64_t v63 = objc_msgSend_stringValue(v59, v60, v61, v62);
        objc_msgSend_setValue_forHTTPHeaderField_(v10, v64, (uint64_t)v63, @"X-FM-Dsid");
      }
    }
  }
  if (objc_msgSend_contentType(self, v38, v39, v40) == 1) {
    objc_msgSend_setValue_forHTTPHeaderField_(v10, v65, @"application/x-www-form-urlencoded", *MEMORY[0x263F27880]);
  }
  else {
    objc_msgSend_setValue_forHTTPHeaderField_(v10, v65, @"application/x-dmap-tagged", *MEMORY[0x263F27880]);
  }
  v68.receiver = self;
  v68.super_class = (Class)BLURLRequestEncoder;
  uint64_t v66 = [(AMSURLRequestEncoder *)&v68 requestByEncodingRequest:v10 parameters:v6];

  return v66;
}

+ (id)DAAPPurchaseVersionString
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E0196B0;
  block[3] = &unk_26448ACA0;
  block[4] = a1;
  if (qword_26AB3FF80 != -1) {
    dispatch_once(&qword_26AB3FF80, block);
  }
  v2 = (void *)qword_26AB3FF78;

  return v2;
}

+ (id)DAAPClientVersionString
{
  if (qword_26AB3FF70 != -1) {
    dispatch_once(&qword_26AB3FF70, &unk_26CED3E50);
  }
  v2 = (void *)qword_26AB3FF68;

  return v2;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
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

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (void).cxx_destruct
{
}

@end