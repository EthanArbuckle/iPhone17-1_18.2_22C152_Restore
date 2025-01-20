@interface BUAppDataContainer
- (BOOL)_setupWithBundleID:(id)a3;
- (BUAppDataContainer)initWithBundleID:(id)a3;
- (NSURL)url;
- (id)consumeSandboxToken;
- (void)close;
- (void)dealloc;
@end

@implementation BUAppDataContainer

- (BUAppDataContainer)initWithBundleID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BUAppDataContainer;
  v5 = [(BUAppDataContainer *)&v10 init];
  v7 = v5;
  if (v5 && !objc_msgSend__setupWithBundleID_(v5, v6, (uint64_t)v4)) {
    v8 = 0;
  }
  else {
    v8 = v7;
  }

  return v8;
}

- (BOOL)_setupWithBundleID:(id)a3
{
  id v4 = a3;
  getuid();
  v5 = (container_query_s *)container_query_create();
  if (v5)
  {
    container_query_set_class();
    container_query_operation_set_flags();
    container_query_set_persona_unique_string();
    container_query_set_uid();
    id v6 = v4;
    v9 = (const char *)objc_msgSend_UTF8String(v6, v7, v8);
    xpc_object_t v10 = xpc_string_create(v9);
    container_query_set_identifiers();

    single_result = (container_object_s *)container_query_get_single_result();
    if (single_result)
    {
      self->_container = single_result;
      self->_containerQuery = v5;
      LOBYTE(v5) = 1;
    }
    else
    {
      container_query_get_last_error();
      v12 = (void *)container_error_copy_unlocalized_description();
      v13 = BookUtilityLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_21E1F0E80((uint64_t)v12, v13);
      }

      free(v12);
      container_query_free();
      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (NSURL)url
{
  uint64_t path = container_get_path();
  id v4 = objc_msgSend_stringWithCString_encoding_(NSString, v3, path, 4);
  id v6 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(NSURL, v5, (uint64_t)v4, 1, 0);

  return (NSURL *)v6;
}

- (id)consumeSandboxToken
{
  uint64_t v2 = container_copy_sandbox_token();
  if (v2)
  {
    v3 = (void *)v2;
    id v4 = [BUSandboxExtension alloc];
    id v6 = objc_msgSend_initWithExtensionToken_(v4, v5, (uint64_t)v3);
    free(v3);
  }
  else
  {
    v7 = BookUtilityLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_21E1F0EF8(v7);
    }

    id v6 = 0;
  }

  return v6;
}

- (void)close
{
  if (self->_containerQuery)
  {
    v3 = BookUtilityLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_21E1C7000, v3, OS_LOG_TYPE_DEFAULT, "BUAppDataContainer: About to free containerQuery", v4, 2u);
    }

    container_query_free();
    self->_container = 0;
    self->_containerQuery = 0;
  }
}

- (void)dealloc
{
  objc_msgSend_close(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)BUAppDataContainer;
  [(BUAppDataContainer *)&v4 dealloc];
}

@end