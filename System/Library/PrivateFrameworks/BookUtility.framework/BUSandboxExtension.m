@interface BUSandboxExtension
- (BUSandboxExtension)initWithExtensionToken:(const char *)a3;
- (void)close;
- (void)dealloc;
@end

@implementation BUSandboxExtension

- (BUSandboxExtension)initWithExtensionToken:(const char *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BUSandboxExtension;
  v3 = [(BUSandboxExtension *)&v7 init];
  if (v3 && (uint64_t v4 = sandbox_extension_consume(), v3->_extensionHandle = v4, v4 < 0))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_21E1F0D24();
    }
    v5 = 0;
  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (void)close
{
}

- (void)dealloc
{
  objc_msgSend_close(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)BUSandboxExtension;
  [(BUSandboxExtension *)&v4 dealloc];
}

@end