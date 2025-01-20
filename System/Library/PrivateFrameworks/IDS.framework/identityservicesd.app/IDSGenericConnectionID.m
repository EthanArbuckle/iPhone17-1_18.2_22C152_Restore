@interface IDSGenericConnectionID
+ (id)idWithAccount:(id)a3 service:(id)a4 name:(id)a5;
- (BOOL)isEqual:(id)a3;
- (IDSGenericConnectionID)initWithAccount:(id)a3 service:(id)a4 name:(id)a5;
- (NSString)account;
- (NSString)name;
- (NSString)service;
- (id)description;
- (id)serviceConnectorServiceForAccount;
- (unint64_t)hash;
@end

@implementation IDSGenericConnectionID

+ (id)idWithAccount:(id)a3 service:(id)a4 name:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[IDSGenericConnectionID alloc] initWithAccount:v9 service:v8 name:v7];

  return v10;
}

- (id)serviceConnectorServiceForAccount
{
  account = self->_account;
  if (account && self->_service && (v4 = self->_name) != 0)
  {
    v5 = +[NSString stringWithFormat:@"%@/%@/%@", account, self->_service, v4];
  }
  else
  {
    v6 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = self->_account;
      service = self->_service;
      name = self->_name;
      *(_DWORD *)buf = 138413314;
      v12 = self;
      __int16 v13 = 2112;
      uint64_t v14 = 0;
      __int16 v15 = 2112;
      v16 = v7;
      __int16 v17 = 2112;
      v18 = service;
      __int16 v19 = 2112;
      v20 = name;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ returning serviceConnectorServiceForAccountString=%@._account=%@;_service=%@;_name=%@",
        buf,
        0x34u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    v5 = 0;
  }

  return v5;
}

- (id)description
{
  v4 = +[NSString stringWithFormat:@"IDSGenericConnectionID[%@,%@,%@] @%p (%lu)", self->_account, self->_service, self->_name, self, self->_hash];

  return v4;
}

- (IDSGenericConnectionID)initWithAccount:(id)a3 service:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)IDSGenericConnectionID;
  v11 = [(IDSGenericConnectionID *)&v21 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    account = v11->_account;
    v11->_account = v12;

    uint64_t v14 = (NSString *)[v9 copy];
    service = v11->_service;
    v11->_service = v14;

    v16 = (NSString *)[v10 copy];
    name = v11->_name;
    v11->_name = v16;

    NSUInteger v18 = [(NSString *)v11->_account hash];
    unint64_t v19 = [(NSString *)v11->_service hash] ^ v18;
    v11->_hash = v19 ^ [(NSString *)v11->_name hash];
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    account = self->_account;
    id v9 = [v7 account];
    if ([(NSString *)account isEqualToString:v9])
    {
      service = self->_service;
      v11 = [v7 service];
      if ([(NSString *)service isEqualToString:v11])
      {
        name = self->_name;
        __int16 v13 = [v7 name];
        unsigned __int8 v6 = [(NSString *)name isEqualToString:v13];
      }
      else
      {
        unsigned __int8 v6 = 0;
      }
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (NSString)account
{
  return self->_account;
}

- (NSString)service
{
  return self->_service;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end