@interface POPodcastModelObject
+ (Class)SAMPClass;
+ (id)uriScheme;
- (NSIndexPath)indexPath;
- (NSString)feedUrl;
- (NSString)storeId;
- (NSString)title;
- (NSString)uuid;
- (SAMPCollection)SAMPCollection;
- (id)description;
- (void)setFeedUrl:(id)a3;
- (void)setIndexPath:(id)a3;
- (void)setStoreId:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation POPodcastModelObject

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_title(self, v6, v7, v8, v9);
  v15 = objc_msgSend_indexPath(self, v11, v12, v13, v14);
  v20 = objc_msgSend_uuid(self, v16, v17, v18, v19);
  v24 = objc_msgSend_stringWithFormat_(v3, v21, @"%@ (%p) title: %@, index path: %@, uuid, %@", v22, v23, v5, self, v10, v15, v20);

  return v24;
}

- (SAMPCollection)SAMPCollection
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v3 = objc_opt_class();
  id v8 = objc_alloc_init((Class)objc_msgSend_SAMPClass(v3, v4, v5, v6, v7));
  uint64_t v9 = NSString;
  v10 = objc_opt_class();
  v15 = objc_msgSend_uriScheme(v10, v11, v12, v13, v14);
  v20 = objc_msgSend_uuid(self, v16, v17, v18, v19);
  v24 = objc_msgSend_stringWithFormat_(v9, v21, @"%@://device/%@", v22, v23, v15, v20);

  v28 = objc_msgSend_URLWithString_(NSURL, v25, (uint64_t)v24, v26, v27);
  objc_msgSend_setIdentifier_(v8, v29, (uint64_t)v28, v30, v31);

  v36 = objc_msgSend_title(self, v32, v33, v34, v35);
  objc_msgSend_setTitle_(v8, v37, (uint64_t)v36, v38, v39);

  POLogInitIfNeeded();
  if (POLogContextCommand) {
    v40 = POLogContextCommand;
  }
  else {
    v40 = &_os_log_internal;
  }
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v43 = v8;
    _os_log_impl(&dword_222EBF000, v40, OS_LOG_TYPE_INFO, "Returning SAMPCollection %@", buf, 0xCu);
  }

  return (SAMPCollection *)v8;
}

+ (Class)SAMPClass
{
  return 0;
}

+ (id)uriScheme
{
  return 0;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)feedUrl
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFeedUrl:(id)a3
{
}

- (NSIndexPath)indexPath
{
  return (NSIndexPath *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIndexPath:(id)a3
{
}

- (NSString)storeId
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStoreId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeId, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_feedUrl, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end