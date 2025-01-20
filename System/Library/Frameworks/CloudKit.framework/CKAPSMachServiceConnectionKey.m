@interface CKAPSMachServiceConnectionKey
- (BOOL)isEqual:(id)a3;
- (CKAPSMachServiceConnectionKey)initWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4;
- (NSString)environmentName;
- (NSString)namedDelegatePort;
- (unint64_t)hash;
@end

@implementation CKAPSMachServiceConnectionKey

- (CKAPSMachServiceConnectionKey)initWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKAPSMachServiceConnectionKey;
  v11 = [(CKAPSMachServiceConnectionKey *)&v20 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    environmentName = v11->_environmentName;
    v11->_environmentName = (NSString *)v12;

    uint64_t v17 = objc_msgSend_copy(v7, v14, v15, v16);
    namedDelegatePort = v11->_namedDelegatePort;
    v11->_namedDelegatePort = (NSString *)v17;
  }
  return v11;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_environmentName(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  v13 = objc_msgSend_namedDelegatePort(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
  {
    id v8 = v4;
    uint64_t v12 = objc_msgSend_environmentName(self, v9, v10, v11);
    uint64_t v16 = objc_msgSend_environmentName(v8, v13, v14, v15);
    if (objc_msgSend_isEqualToString_(v12, v17, (uint64_t)v16, v18))
    {
      v22 = objc_msgSend_namedDelegatePort(self, v19, v20, v21);
      v26 = objc_msgSend_namedDelegatePort(v8, v23, v24, v25);
      char isEqualToString = objc_msgSend_isEqualToString_(v22, v27, (uint64_t)v26, v28);
    }
    else
    {
      char isEqualToString = 0;
    }
  }
  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (NSString)environmentName
{
  return self->_environmentName;
}

- (NSString)namedDelegatePort
{
  return self->_namedDelegatePort;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedDelegatePort, 0);

  objc_storeStrong((id *)&self->_environmentName, 0);
}

@end