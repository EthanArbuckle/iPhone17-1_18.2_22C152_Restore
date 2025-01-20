@interface _IDSRegisteredAccount
- (BOOL)isEqual:(id)a3;
- (NSArray)registeredDeviceInfo;
- (NSString)accountID;
- (NSString)service;
- (_IDSRegisteredAccount)initWithAccountID:(id)a3 service:(id)a4 registeredDeviceInfo:(id)a5;
@end

@implementation _IDSRegisteredAccount

- (_IDSRegisteredAccount)initWithAccountID:(id)a3 service:(id)a4 registeredDeviceInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_IDSRegisteredAccount;
  v12 = [(_IDSRegisteredAccount *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountID, a3);
    objc_storeStrong((id *)&v13->_registeredDeviceInfo, a5);
    objc_storeStrong((id *)&v13->_service, a4);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_IDSRegisteredAccount *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  if (self == v4)
  {
    char v13 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = v5;
    v7 = [(_IDSRegisteredAccount *)self accountID];
    v8 = [(_IDSRegisteredAccount *)v6 accountID];
    if ([v7 isEqualToString:v8])
    {
      id v9 = [(_IDSRegisteredAccount *)self registeredDeviceInfo];
      id v10 = [(_IDSRegisteredAccount *)v6 registeredDeviceInfo];
      if ([v9 isEqualToArray:v10])
      {
        id v11 = [(_IDSRegisteredAccount *)self service];
        v12 = [(_IDSRegisteredAccount *)v6 service];
        char v13 = [v11 isEqualToString:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
LABEL_7:
    char v13 = 0;
  }
LABEL_13:

  return v13;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (NSString)service
{
  return self->_service;
}

- (NSArray)registeredDeviceInfo
{
  return self->_registeredDeviceInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredDeviceInfo, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

@end