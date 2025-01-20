@interface IMSystemProxySettingsFetcher
- (IMSystemProxySettingsFetcher)initWithHost:(id)a3 port:(unsigned __int16)a4 delegate:(id)a5;
- (IMSystemProxySettingsFetcher)initWithProxyProtocol:(int64_t)a3 proxyHost:(id)a4 proxyPort:(unsigned __int16)a5 delegate:(id)a6;
- (NSString)_host;
- (NSString)_proxyAccount;
- (NSString)_proxyHost;
- (NSString)_proxyPassword;
- (id)delegate;
- (int64_t)_proxyProtocol;
- (unsigned)_port;
- (unsigned)_proxyPort;
- (void)_callAccountSettingsDelegateMethod;
- (void)_callProxySettingsDelegateMethod;
- (void)_getProxyAccountAndPasswordFromKeychain;
- (void)retrieveProxyAccountSettings;
- (void)setDelegate:(id)a3;
- (void)set_host:(id)a3;
- (void)set_port:(unsigned __int16)a3;
- (void)set_proxyAccount:(id)a3;
- (void)set_proxyHost:(id)a3;
- (void)set_proxyPassword:(id)a3;
- (void)set_proxyPort:(unsigned __int16)a3;
- (void)set_proxyProtocol:(int64_t)a3;
@end

@implementation IMSystemProxySettingsFetcher

- (void)_callProxySettingsDelegateMethod
{
  objc_msgSend_delegate(self, a2, v2, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_systemProxySettingsFetcher_retrievedHost_port_protocol_(v6, v5, (uint64_t)self, (uint64_t)self->_proxyHost, self->_proxyPort, self->_proxyProtocol);
}

- (void)_callAccountSettingsDelegateMethod
{
  objc_msgSend_delegate(self, a2, v2, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_systemProxySettingsFetcher_retrievedAccount_password_(v6, v5, (uint64_t)self, (uint64_t)self->_proxyAccount, self->_proxyPassword);
}

- (void)_getProxyAccountAndPasswordFromKeychain
{
  uint64_t v3 = (void *)MEMORY[0x192FDE5A0](self, a2);
  objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(self, v4, (uint64_t)sel__callAccountSettingsDelegateMethod, 0, 0);
}

- (IMSystemProxySettingsFetcher)initWithHost:(id)a3 port:(unsigned __int16)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)IMSystemProxySettingsFetcher;
  v11 = [(IMSystemProxySettingsFetcher *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_proxyProtocol = 4;
    v11->_delegate = v10;
    objc_storeStrong((id *)&v11->_host, a3);
    v12->_port = a4;
  }

  return v12;
}

- (IMSystemProxySettingsFetcher)initWithProxyProtocol:(int64_t)a3 proxyHost:(id)a4 proxyPort:(unsigned __int16)a5 delegate:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)IMSystemProxySettingsFetcher;
  v13 = [(IMSystemProxySettingsFetcher *)&v16 init];
  objc_super v14 = v13;
  if (v13)
  {
    v13->_proxyProtocol = a3;
    v13->_delegate = v12;
    objc_storeStrong((id *)&v13->_proxyHost, a4);
    v14->_proxyPort = a5;
  }

  return v14;
}

- (void)retrieveProxyAccountSettings
{
  if (self->_proxyAccount) {
    ((void (*)(IMSystemProxySettingsFetcher *, char *))MEMORY[0x1F4181798])(self, sel__callAccountSettingsDelegateMethod);
  }
  else {
    objc_msgSend_performSelectorInBackground_withObject_(self, a2, (uint64_t)sel__getProxyAccountAndPasswordFromKeychain, 0);
  }
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (NSString)_host
{
  return self->_host;
}

- (void)set_host:(id)a3
{
}

- (unsigned)_port
{
  return self->_port;
}

- (void)set_port:(unsigned __int16)a3
{
  self->_port = a3;
}

- (int64_t)_proxyProtocol
{
  return self->_proxyProtocol;
}

- (void)set_proxyProtocol:(int64_t)a3
{
  self->_proxyProtocol = a3;
}

- (NSString)_proxyHost
{
  return self->_proxyHost;
}

- (void)set_proxyHost:(id)a3
{
}

- (unsigned)_proxyPort
{
  return self->_proxyPort;
}

- (void)set_proxyPort:(unsigned __int16)a3
{
  self->_proxyPort = a3;
}

- (NSString)_proxyAccount
{
  return self->_proxyAccount;
}

- (void)set_proxyAccount:(id)a3
{
}

- (NSString)_proxyPassword
{
  return self->_proxyPassword;
}

- (void)set_proxyPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyPassword, 0);
  objc_storeStrong((id *)&self->_proxyAccount, 0);
  objc_storeStrong((id *)&self->_proxyHost, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end