@interface EKSyncError
+ (Class)frozenClass;
+ (id)augmentSyncErrorUserInfo:(id)a3 for:(id)a4;
+ (id)knownIdentityKeysForComparison;
- (EKSyncError)initWithAccountError:(unint64_t)a3 userInfo:(id)a4;
- (EKSyncError)initWithCalendarError:(unint64_t)a3 userInfo:(id)a4;
- (EKSyncError)initWithCalendarItemError:(unint64_t)a3 userInfo:(id)a4;
- (NSDictionary)userInfo;
- (id)userInfoData;
- (unint64_t)errorCode;
- (unint64_t)errorType;
- (void)setErrorCode:(unint64_t)a3;
- (void)setErrorType:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserInfoData:(id)a3;
@end

@implementation EKSyncError

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_13 != -1) {
    dispatch_once(&knownIdentityKeysForComparison_onceToken_13, &__block_literal_global_80);
  }
  v2 = (void *)knownIdentityKeysForComparison_keys_13;

  return v2;
}

void __45__EKSyncError_knownIdentityKeysForComparison__block_invoke()
{
  v0 = (void *)knownIdentityKeysForComparison_keys_13;
  knownIdentityKeysForComparison_keys_13 = MEMORY[0x1E4F1CBF0];
}

- (EKSyncError)initWithAccountError:(unint64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EKSyncError;
  v7 = [(EKObject *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(EKSyncError *)v7 setErrorType:0];
    [(EKSyncError *)v8 setErrorCode:a3];
    [(EKSyncError *)v8 setUserInfo:v6];
  }

  return v8;
}

- (EKSyncError)initWithCalendarError:(unint64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EKSyncError;
  v7 = [(EKObject *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(EKSyncError *)v7 setErrorType:2];
    [(EKSyncError *)v8 setErrorCode:a3];
    [(EKSyncError *)v8 setUserInfo:v6];
  }

  return v8;
}

- (EKSyncError)initWithCalendarItemError:(unint64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EKSyncError;
  v7 = [(EKObject *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(EKSyncError *)v7 setErrorType:1];
    [(EKSyncError *)v8 setErrorCode:a3];
    [(EKSyncError *)v8 setUserInfo:v6];
  }

  return v8;
}

- (unint64_t)errorType
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56F18]];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setErrorType:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56F18]];
}

- (unint64_t)errorCode
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56F10]];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setErrorCode:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56F10]];
}

- (id)userInfoData
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56F28]];
}

- (void)setUserInfoData:(id)a3
{
}

- (NSDictionary)userInfo
{
  v2 = [(EKSyncError *)self userInfoData];
  unint64_t v3 = +[EKSyncStatusUtils errorUserInfoFromData:v2];

  return (NSDictionary *)v3;
}

- (void)setUserInfo:(id)a3
{
  id v4 = +[EKSyncStatusUtils dataFromErrorUserInfo:a3];
  [(EKSyncError *)self setUserInfoData:v4];
}

+ (id)augmentSyncErrorUserInfo:(id)a3 for:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6) {
      id v8 = (id)[v6 mutableCopy];
    }
    else {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    objc_super v10 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v7;
      if ([v11 isPhantom])
      {
        v12 = [v11 detachedItems];
        v13 = [v12 anyObject];

        if (v13)
        {
          id v14 = v13;

          id v11 = v14;
        }
      }
      id v15 = [v11 calendar];
      id v16 = [v15 source];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v7;
        id v16 = [v15 source];
        id v11 = 0;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = v7;
          id v11 = 0;
          id v15 = 0;
        }
        else
        {
          id v11 = 0;
          id v15 = 0;
          id v16 = 0;
        }
      }
    }
    if ([v15 isSubscribed])
    {
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = [v16 title];
    }
    v32 = (void *)v17;
    [v10 setObject:v17 forKeyedSubscript:@"AccountName"];
    v18 = [v15 title];
    [v10 setObject:v18 forKeyedSubscript:@"CalendarName"];

    [v10 setObject:v11 forKeyedSubscript:@"CalendarItem"];
    v19 = [v11 title];
    [v10 setObject:v19 forKeyedSubscript:@"CalendarItemName"];

    uint64_t v20 = *MEMORY[0x1E4F28A50];
    v21 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
    v22 = v21;
    if (v21)
    {
      v23 = [v21 userInfo];

      if (v23)
      {
        v24 = [v22 userInfo];
        [a1 augmentSyncErrorUserInfo:v24 for:v7];
        v25 = id v31 = v16;

        v26 = (void *)MEMORY[0x1E4F28C58];
        [v22 domain];
        v28 = id v27 = v6;
        v29 = objc_msgSend(v26, "errorWithDomain:code:userInfo:", v28, objc_msgSend(v22, "code"), v25);

        id v6 = v27;
        [v10 setObject:v29 forKeyedSubscript:v20];

        id v16 = v31;
      }
    }
    id v9 = (id)objc_msgSend(v10, "copy", v31);
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

@end