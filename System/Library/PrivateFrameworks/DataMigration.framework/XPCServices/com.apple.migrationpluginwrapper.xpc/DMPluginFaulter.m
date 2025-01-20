@interface DMPluginFaulter
- (DMPluginFaulter)init;
- (NSString)message;
- (OS_os_log)os_log;
- (void)_faultForUnknownPluginIdentifier;
- (void)faultWithPluginIdentifier:(id)a3 message:(id)a4;
- (void)setMessage:(id)a3;
- (void)setOs_log:(id)a3;
@end

@implementation DMPluginFaulter

- (DMPluginFaulter)init
{
  v5.receiver = self;
  v5.super_class = (Class)DMPluginFaulter;
  v2 = [(DMPluginFaulter *)&v5 init];
  if (v2)
  {
    v3 = _DMCoreLog();
    [(DMPluginFaulter *)v2 setOs_log:v3];
  }
  return v2;
}

- (void)faultWithPluginIdentifier:(id)a3 message:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [(DMPluginFaulter *)self setMessage:v6];
  if (v9)
  {
    v7 = +[DMPluginSpecificUtilitiesManager utilitiesForPluginIdentifier:](DMPluginSpecificUtilitiesManager, "utilitiesForPluginIdentifier:");
    if (v7)
    {
      v8 = [(DMPluginFaulter *)self os_log];
      [v7 faultWithLog:v8 message:v6];
    }
    else
    {
      [(DMPluginFaulter *)self _faultForUnknownPluginIdentifier];
    }
  }
  else
  {
    [(DMPluginFaulter *)self _faultForUnknownPluginIdentifier];
  }
}

- (void)_faultForUnknownPluginIdentifier
{
  v3 = [(DMPluginFaulter *)self os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_100007E08(self, v3);
  }
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (OS_os_log)os_log
{
  return self->_os_log;
}

- (void)setOs_log:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_os_log, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end