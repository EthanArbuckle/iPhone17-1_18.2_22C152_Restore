@interface BLDownloadManifestRequest
+ (BOOL)supportsSecureCoding;
- (BLDownloadManifestRequest)initWithCoder:(id)a3;
- (BLDownloadManifestRequest)initWithURLRequest:(id)a3;
- (NSURLRequest)URLRequest;
- (void)encodeWithCoder:(id)a3;
- (void)setURLRequest:(id)a3;
- (void)startWithManifestResponseBlock:(id)a3;
@end

@implementation BLDownloadManifestRequest

- (BLDownloadManifestRequest)initWithURLRequest:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BLDownloadManifestRequest;
  v8 = [(BLDownloadManifestRequest *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
    urlRequest = v8->_urlRequest;
    v8->_urlRequest = (NSURLRequest *)v9;
  }
  return v8;
}

- (void)startWithManifestResponseBlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = BLServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_msgSend_URLRequest(self, v6, v7, v8);
    *(_DWORD *)buf = 134218242;
    v19 = self;
    __int16 v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadManifestRequest] Start download manifest request %p: urlRequest=%@", buf, 0x16u);
  }
  v13 = objc_msgSend_sharedInstance(BLDownloadQueueNonUI, v10, v11, v12);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21E0114FC;
  v16[3] = &unk_26448BCA0;
  v16[4] = self;
  id v17 = v4;
  id v14 = v4;
  objc_msgSend_addDownloadsWithManifestRequest_completion_(v13, v15, (uint64_t)self, (uint64_t)v16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLDownloadManifestRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BLDownloadManifestRequest;
  v5 = [(BLDownloadManifestRequest *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"URLRequest");
    objc_msgSend_setURLRequest_(v5, v9, (uint64_t)v8, v10);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend_URLRequest(self, v5, v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v9, @"URLRequest");
}

- (NSURLRequest)URLRequest
{
  return self->_urlRequest;
}

- (void)setURLRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end