@interface HMDCoreDataContextTransactionAuthor
+ (id)contextAuthorWithString:(id)a3;
+ (id)contextAuthorWithType:(unint64_t)a3;
+ (id)contextAuthorWithType:(unint64_t)a3 clientIdentifier:(id)a4;
+ (id)contextAuthorWithType:(unint64_t)a3 clientIdentifier:(id)a4 qualityOfService:(int64_t)a5;
+ (id)controllerForceUpdateContextAuthor;
+ (id)firstPartyContextAuthor;
+ (id)residentSyncContextAuthor;
+ (id)unitTestsContextAuthor;
- (HMDCoreDataContextTransactionAuthor)initWithType:(unint64_t)a3 clientIdentifier:(id)a4 qualityOfService:(int64_t)a5;
- (NSString)clientIdentifier;
- (NSString)string;
- (int64_t)qualityOfService;
- (unint64_t)type;
@end

@implementation HMDCoreDataContextTransactionAuthor

- (void).cxx_destruct
{
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)string
{
  unint64_t v3 = [(HMDCoreDataContextTransactionAuthor *)self type] - 2;
  if (v3 > 9) {
    v4 = @"HMD.Unknown";
  }
  else {
    v4 = off_264A27760[v3];
  }
  v5 = [(HMDCoreDataContextTransactionAuthor *)self clientIdentifier];

  if (!v5) {
    goto LABEL_22;
  }
  uint64_t v6 = [(HMDCoreDataContextTransactionAuthor *)self qualityOfService];
  v7 = 0;
  int v8 = 0;
  if (v6 <= 16)
  {
    if (v6 == -1)
    {
      v7 = @"defaultQoS";
    }
    else
    {
      if (v6 != 9) {
        goto LABEL_17;
      }
      v7 = @"backgroundQoS";
    }
  }
  else
  {
    switch(v6)
    {
      case 17:
        v7 = @"utilityQoS";
        break;
      case 25:
        v7 = @"userInitiatedQoS";
        break;
      case 33:
        v7 = @"userInteractiveQoS";
        break;
      default:
        goto LABEL_17;
    }
  }
  int v8 = 1;
LABEL_17:
  int64_t v9 = [(HMDCoreDataContextTransactionAuthor *)self qualityOfService];
  v10 = NSString;
  uint64_t v11 = [(HMDCoreDataContextTransactionAuthor *)self clientIdentifier];
  v12 = (void *)v11;
  if (!v8 || v9 == -1) {
    [v10 stringWithFormat:@"%@/%@", v4, v11, v14];
  }
  else {
  v4 = [v10 stringWithFormat:@"%@/%@/%@", v4, v11, v7];
  }

LABEL_22:
  return (NSString *)v4;
}

- (HMDCoreDataContextTransactionAuthor)initWithType:(unint64_t)a3 clientIdentifier:(id)a4 qualityOfService:(int64_t)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDCoreDataContextTransactionAuthor;
  int64_t v9 = [(HMDCoreDataContextTransactionAuthor *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    if ([v8 containsString:@"/"]) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v8;
    }
    objc_storeStrong((id *)&v10->_clientIdentifier, v11);
    v10->_qualityOfService = a5;
  }

  return v10;
}

+ (id)contextAuthorWithString:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 componentsSeparatedByString:@"/"];
    if ([v6 count])
    {
      if ((unint64_t)[v6 count] >= 4)
      {
        v7 = (void *)MEMORY[0x230FBD990]();
        id v8 = a1;
        int64_t v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = HMFGetLogIdentifier();
          int v24 = 138543618;
          v25 = v10;
          __int16 v26 = 2112;
          v27 = v5;
          _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unknown components in context transaction author string will not be parsed: %@", (uint8_t *)&v24, 0x16u);
        }
      }
      id v11 = [v6 objectAtIndexedSubscript:0];
      uint64_t v12 = 0;
      if ([v11 hasPrefix:@"HMD."])
      {
        if ([v11 isEqualToString:@"HMD.v4"])
        {
          uint64_t v12 = 3;
        }
        else if ([v11 isEqualToString:@"HMD.CK"])
        {
          uint64_t v12 = 4;
        }
        else if ([v11 isEqualToString:@"HMD.RS"])
        {
          uint64_t v12 = 5;
        }
        else if ([v11 isEqualToString:@"HMD.1P"])
        {
          uint64_t v12 = 6;
        }
        else if ([v11 isEqualToString:@"HMD.MI"])
        {
          uint64_t v12 = 7;
        }
        else if ([v11 isEqualToString:@"HMD.RC"])
        {
          uint64_t v12 = 8;
        }
        else if ([v11 isEqualToString:@"HMD.CKS"])
        {
          uint64_t v12 = 9;
        }
        else if ([v11 isEqualToString:@"HMD.CFU"])
        {
          uint64_t v12 = 10;
        }
        else if ([v11 isEqualToString:@"HMD.PCE"])
        {
          uint64_t v12 = 11;
        }
        else if ([v11 isEqualToString:@"HMD.UT"])
        {
          uint64_t v12 = 2;
        }
        else
        {
          uint64_t v12 = 0;
        }
      }

      if ((unint64_t)[v6 count] < 2)
      {
        v18 = 0;
      }
      else
      {
        v18 = [v6 objectAtIndexedSubscript:1];
      }
      if ([v18 containsString:@"/"])
      {

        v18 = 0;
      }
      if ((unint64_t)[v6 count] < 3)
      {
        v19 = 0;
      }
      else
      {
        v19 = [v6 objectAtIndexedSubscript:2];
      }
      id v20 = v19;
      if ([v20 isEqualToString:@"userInteractiveQoS"])
      {
        uint64_t v21 = 33;
      }
      else if ([v20 isEqualToString:@"userInitiatedQoS"])
      {
        uint64_t v21 = 25;
      }
      else if ([v20 isEqualToString:@"utilityQoS"])
      {
        uint64_t v21 = 17;
      }
      else if ([v20 isEqualToString:@"backgroundQoS"])
      {
        uint64_t v21 = 9;
      }
      else
      {
        uint64_t v21 = -1;
      }

      if ((unint64_t)[v6 count] < 3)
      {
        if ([v6 count] == 2) {
          +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:v12 clientIdentifier:v18];
        }
        else {
        v22 = +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:v12];
        }
      }
      else
      {
        v22 = [[HMDCoreDataContextTransactionAuthor alloc] initWithType:v12 clientIdentifier:v18 qualityOfService:v21];
      }
      objc_super v13 = v22;
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = a1;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        int v24 = 138543618;
        v25 = v17;
        __int16 v26 = 2112;
        v27 = v5;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Invalid context transaction author string: %@", (uint8_t *)&v24, 0x16u);
      }
      objc_super v13 = 0;
    }
  }
  else
  {
    objc_super v13 = +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:0];
  }

  return v13;
}

+ (id)contextAuthorWithType:(unint64_t)a3 clientIdentifier:(id)a4 qualityOfService:(int64_t)a5
{
  id v7 = a4;
  id v8 = [[HMDCoreDataContextTransactionAuthor alloc] initWithType:a3 clientIdentifier:v7 qualityOfService:a5];

  return v8;
}

+ (id)contextAuthorWithType:(unint64_t)a3 clientIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [[HMDCoreDataContextTransactionAuthor alloc] initWithType:a3 clientIdentifier:v5 qualityOfService:-1];

  return v6;
}

+ (id)contextAuthorWithType:(unint64_t)a3
{
  unint64_t v3 = [[HMDCoreDataContextTransactionAuthor alloc] initWithType:a3 clientIdentifier:0 qualityOfService:-1];
  return v3;
}

+ (id)controllerForceUpdateContextAuthor
{
  return +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:10];
}

+ (id)unitTestsContextAuthor
{
  return +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:2];
}

+ (id)firstPartyContextAuthor
{
  return +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:6];
}

+ (id)residentSyncContextAuthor
{
  return +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:5];
}

@end