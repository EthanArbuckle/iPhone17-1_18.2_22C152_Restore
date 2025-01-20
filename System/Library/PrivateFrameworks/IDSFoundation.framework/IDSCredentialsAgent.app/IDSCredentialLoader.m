@interface IDSCredentialLoader
- (IDSCredentialLoader)initWithCommand:(id)a3 completionBlock:(id)a4;
- (NSString)uniqueID;
- (id)block;
@end

@implementation IDSCredentialLoader

- (IDSCredentialLoader)initWithCommand:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IDSCredentialLoader;
  v8 = [(IDSCredentialLoader *)&v16 init];
  if (v8)
  {
    v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating loader with command: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v15 = v6;
      _IDSLogV();
    }
    id v10 = objc_msgSend(v7, "copy", v15);
    id block = v8->_block;
    v8->_id block = v10;

    uint64_t v12 = +[NSString stringGUID];
    uniqueID = v8->_uniqueID;
    v8->_uniqueID = (NSString *)v12;
  }
  return v8;
}

- (NSString)uniqueID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)block
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong(&self->_block, 0);
}

@end