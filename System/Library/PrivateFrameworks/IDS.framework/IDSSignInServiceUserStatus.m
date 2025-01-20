@interface IDSSignInServiceUserStatus
- (IDSSignInServiceUserStatus)initWithServiceType:(unint64_t)a3 userInfos:(id)a4;
- (NSArray)serviceUserInfos;
- (id)description;
- (unint64_t)appleIDUserStatus;
- (unint64_t)phoneUserStatus;
- (unint64_t)serviceType;
@end

@implementation IDSSignInServiceUserStatus

- (IDSSignInServiceUserStatus)initWithServiceType:(unint64_t)a3 userInfos:(id)a4
{
  id v7 = a4;
  if (_IDSRunningInDaemon())
  {
    v8 = [MEMORY[0x1E4F6C3B8] signInController];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A2C4C8();
    }

    v9 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)IDSSignInServiceUserStatus;
    v10 = [(IDSSignInServiceUserStatus *)&v13 init];
    v11 = v10;
    if (v10)
    {
      v10->_serviceType = a3;
      objc_storeStrong((id *)&v10->_serviceUserInfos, a4);
    }
    self = v11;
    v9 = self;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = @"iMessage";
  unint64_t serviceType = self->_serviceType;
  if (serviceType != 1) {
    v5 = 0;
  }
  if (!serviceType) {
    v5 = @"FaceTime";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p> Service: %@ Infos: %@", v4, self, v5, self->_serviceUserInfos];
}

- (unint64_t)phoneUserStatus
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_serviceUserInfos;
  unint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (!objc_msgSend(v6, "type", (void)v8))
        {
          unint64_t v3 = [v6 status];
          goto LABEL_11;
        }
      }
      unint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)appleIDUserStatus
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_serviceUserInfos;
  unint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "type", (void)v8) == 1)
        {
          unint64_t v3 = [v6 status];
          goto LABEL_11;
        }
      }
      unint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (NSArray)serviceUserInfos
{
  return self->_serviceUserInfos;
}

- (void).cxx_destruct
{
}

@end