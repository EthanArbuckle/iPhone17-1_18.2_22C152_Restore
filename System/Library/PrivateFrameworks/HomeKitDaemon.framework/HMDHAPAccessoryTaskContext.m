@interface HMDHAPAccessoryTaskContext
- (BOOL)isComplete;
- (BOOL)isRemoteAccessDeviceReachable;
- (BOOL)isShortActionOperation;
- (BOOL)supportsMultiPartResponse;
- (HMDHAPAccessoryTaskContext)initWithIdentifier:(id)a3 operationType:(int64_t)a4 home:(id)a5 sourceType:(unint64_t)a6 requestMessage:(id)a7 name:(id)a8;
- (HMDHome)home;
- (HMDUser)user;
- (HMFActivity)activity;
- (HMFMessage)requestMessage;
- (NSNumber)identifier;
- (id)clientIdentifier;
- (id)homeMessageDestination;
- (id)homeUniqueIdentifier;
- (id)operationName;
- (id)requestMessageIdentifier;
- (id)requestMessageName;
- (id)workQueue;
- (int64_t)operationType;
- (int64_t)qualityOfService;
- (unint64_t)sourceType;
- (void)dispatchMessage:(id)a3 delegateDevice:(id)a4;
- (void)setActivity:(id)a3;
@end

@implementation HMDHAPAccessoryTaskContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_requestMessage, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setActivity:(id)a3
{
}

- (HMFActivity)activity
{
  return self->_activity;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (HMFMessage)requestMessage
{
  return (HMFMessage *)objc_getProperty(self, a2, 32, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (int64_t)operationType
{
  return self->_operationType;
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (HMDUser)user
{
  v3 = [(HMDHAPAccessoryTaskContext *)self home];
  v4 = [(HMDHAPAccessoryTaskContext *)self requestMessage];

  if (v4)
  {
    if (v3)
    {
      v5 = [(HMDHAPAccessoryTaskContext *)self requestMessage];
      v6 = [v5 userForHome:v3];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = [v3 currentUser];
  }

  return (HMDUser *)v6;
}

- (void)dispatchMessage:(id)a3 delegateDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(HMDHAPAccessoryTaskContext *)self home];
  v8 = [(HMDHAPAccessoryTaskContext *)self homeUniqueIdentifier];
  v9 = [(HMDHAPAccessoryTaskContext *)self workQueue];
  [v10 redispatchToResidentMessage:v7 target:v8 responseQueue:v9 viaDevice:v6];
}

- (BOOL)isComplete
{
  v2 = [(HMDHAPAccessoryTaskContext *)self requestMessage];
  v3 = [v2 responseHandler];
  BOOL v4 = v3 == 0;

  return v4;
}

- (id)requestMessageName
{
  v2 = [(HMDHAPAccessoryTaskContext *)self requestMessage];
  v3 = [v2 name];

  return v3;
}

- (BOOL)supportsMultiPartResponse
{
  char v6 = 0;
  v2 = [(HMDHAPAccessoryTaskContext *)self requestMessage];
  char v3 = [v2 BOOLForKey:@"kMultiPartResponseKey" keyPresent:&v6];
  if (v6) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isRemoteAccessDeviceReachable
{
  v2 = [(HMDHAPAccessoryTaskContext *)self home];
  char v3 = [v2 isRemoteAccessDeviceReachable];

  return v3;
}

- (BOOL)isShortActionOperation
{
  char v3 = [(HMDHAPAccessoryTaskContext *)self requestMessage];
  BOOL v4 = [v3 uuidForKey:@"kActionSetUUID"];

  v5 = [(HMDHAPAccessoryTaskContext *)self requestMessage];
  char v6 = [v5 BOOLForKey:@"kShortActionKey"];
  if (v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6;
  }

  return v7;
}

- (int64_t)qualityOfService
{
  v2 = [(HMDHAPAccessoryTaskContext *)self requestMessage];
  int64_t v3 = [v2 qualityOfService];

  return v3;
}

- (id)clientIdentifier
{
  v2 = [(HMDHAPAccessoryTaskContext *)self requestMessage];
  int64_t v3 = [v2 clientIdentifier];

  return v3;
}

- (id)requestMessageIdentifier
{
  v2 = [(HMDHAPAccessoryTaskContext *)self requestMessage];
  int64_t v3 = [v2 identifier];

  return v3;
}

- (id)homeMessageDestination
{
  v2 = [(HMDHAPAccessoryTaskContext *)self home];
  int64_t v3 = [v2 messageDestination];

  return v3;
}

- (id)homeUniqueIdentifier
{
  v2 = [(HMDHAPAccessoryTaskContext *)self home];
  int64_t v3 = [v2 uuid];

  return v3;
}

- (id)workQueue
{
  v2 = [(HMDHAPAccessoryTaskContext *)self home];
  int64_t v3 = [v2 workQueue];

  return v3;
}

- (id)operationName
{
  if ([(HMDHAPAccessoryTaskContext *)self operationType]) {
    v2 = @"write";
  }
  else {
    v2 = @"read";
  }
  return v2;
}

- (HMDHAPAccessoryTaskContext)initWithIdentifier:(id)a3 operationType:(int64_t)a4 home:(id)a5 sourceType:(unint64_t)a6 requestMessage:(id)a7 name:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDHAPAccessoryTaskContext;
  v19 = [(HMDHAPAccessoryTaskContext *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_home, v16);
    objc_storeStrong((id *)&v20->_identifier, a3);
    v20->_operationType = a4;
    v20->_sourceType = a6;
    objc_storeStrong((id *)&v20->_requestMessage, a7);
    uint64_t v21 = [objc_alloc(MEMORY[0x263F424F0]) initWithName:v18];
    activity = v20->_activity;
    v20->_activity = (HMFActivity *)v21;

    [(HMFActivity *)v20->_activity begin];
  }

  return v20;
}

@end