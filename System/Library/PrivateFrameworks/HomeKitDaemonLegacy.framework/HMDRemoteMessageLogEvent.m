@interface HMDRemoteMessageLogEvent
+ (id)newFromRemoteMessage:(id)a3 device:(id)a4 transportType:(int)a5 sending:(BOOL)a6;
+ (id)peerInformationForDevice:(id)a3;
+ (id)peerInformationForRemoteMessage:(id)a3;
+ (id)receivedRemoteMessage:(id)a3 transportType:(int)a4;
+ (id)receivedRemoteMessageName:(id)a3 identifier:(id)a4 transactionIdentifier:(id)a5 messageType:(int64_t)a6 peerInformation:(id)a7 secure:(BOOL)a8 transportType:(int)a9 messageQoS:(int64_t)a10;
+ (id)sentRemoteMessage:(id)a3 device:(id)a4 transportType:(int)a5;
+ (id)sentRemoteMessage:(id)a3 transportType:(int)a4;
+ (id)sentRemoteMessageName:(id)a3 identifier:(id)a4 transactionIdentifier:(id)a5 messageType:(int64_t)a6 peerInformation:(id)a7 secure:(BOOL)a8 transportType:(int)a9 messageQoS:(int64_t)a10;
- (BOOL)secure;
- (BOOL)sending;
- (HMDRemoteMessageLogEvent)initWithMessageName:(id)a3 identifier:(id)a4 transactionIdentifier:(id)a5 messageType:(int64_t)a6 peerInformation:(id)a7 secure:(BOOL)a8 transportType:(int)a9 sending:(BOOL)a10 messageQoS:(int64_t)a11;
- (NSString)msgIdentifier;
- (NSString)msgName;
- (NSString)peerInformation;
- (NSString)transactionIdentifier;
- (int)transportType;
- (int64_t)msgQoS;
- (int64_t)msgType;
@end

@implementation HMDRemoteMessageLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerInformation, 0);
  objc_storeStrong((id *)&self->_msgName, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_msgIdentifier, 0);
}

- (int64_t)msgQoS
{
  return self->_msgQoS;
}

- (NSString)peerInformation
{
  return self->_peerInformation;
}

- (int64_t)msgType
{
  return self->_msgType;
}

- (NSString)msgName
{
  return self->_msgName;
}

- (BOOL)secure
{
  return self->_secure;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSString)msgIdentifier
{
  return self->_msgIdentifier;
}

- (BOOL)sending
{
  return self->_sending;
}

- (int)transportType
{
  return self->_transportType;
}

- (HMDRemoteMessageLogEvent)initWithMessageName:(id)a3 identifier:(id)a4 transactionIdentifier:(id)a5 messageType:(int64_t)a6 peerInformation:(id)a7 secure:(BOOL)a8 transportType:(int)a9 sending:(BOOL)a10 messageQoS:(int64_t)a11
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HMDRemoteMessageLogEvent;
  v22 = [(HMMLogEvent *)&v29 init];
  v23 = v22;
  if (v22)
  {
    v22->_transportType = a9;
    v22->_sending = a10;
    uint64_t v24 = [v19 UUIDString];
    msgIdentifier = v23->_msgIdentifier;
    v23->_msgIdentifier = (NSString *)v24;

    uint64_t v26 = [v20 UUIDString];
    transactionIdentifier = v23->_transactionIdentifier;
    v23->_transactionIdentifier = (NSString *)v26;

    v23->_secure = a8;
    objc_storeStrong((id *)&v23->_msgName, a3);
    v23->_msgType = a6;
    objc_storeStrong((id *)&v23->_peerInformation, a7);
    v23->_msgQoS = a11;
  }

  return v23;
}

+ (id)receivedRemoteMessageName:(id)a3 identifier:(id)a4 transactionIdentifier:(id)a5 messageType:(int64_t)a6 peerInformation:(id)a7 secure:(BOOL)a8 transportType:(int)a9 messageQoS:(int64_t)a10
{
  BOOL v10 = a8;
  id v16 = a7;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  BYTE4(v22) = 0;
  LODWORD(v22) = a9;
  id v20 = objc_msgSend(objc_alloc((Class)a1), "initWithMessageName:identifier:transactionIdentifier:messageType:peerInformation:secure:transportType:sending:messageQoS:", v19, v18, v17, a6, v16, v10, v22, a10);

  return v20;
}

+ (id)sentRemoteMessageName:(id)a3 identifier:(id)a4 transactionIdentifier:(id)a5 messageType:(int64_t)a6 peerInformation:(id)a7 secure:(BOOL)a8 transportType:(int)a9 messageQoS:(int64_t)a10
{
  BOOL v10 = a8;
  id v16 = a7;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  BYTE4(v22) = 1;
  LODWORD(v22) = a9;
  id v20 = objc_msgSend(objc_alloc((Class)a1), "initWithMessageName:identifier:transactionIdentifier:messageType:peerInformation:secure:transportType:sending:messageQoS:", v19, v18, v17, a6, v16, v10, v22, a10);

  return v20;
}

+ (id)sentRemoteMessage:(id)a3 transportType:(int)a4
{
  v4 = (void *)[a1 newFromRemoteMessage:a3 device:0 transportType:*(void *)&a4 sending:1];
  return v4;
}

+ (id)sentRemoteMessage:(id)a3 device:(id)a4 transportType:(int)a5
{
  v5 = (void *)[a1 newFromRemoteMessage:a3 device:a4 transportType:*(void *)&a5 sending:1];
  return v5;
}

+ (id)receivedRemoteMessage:(id)a3 transportType:(int)a4
{
  v4 = (void *)[a1 newFromRemoteMessage:a3 device:0 transportType:*(void *)&a4 sending:0];
  return v4;
}

+ (id)newFromRemoteMessage:(id)a3 device:(id)a4 transportType:(int)a5 sending:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = [v10 attributedMessageName];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v10 name];
  }
  v15 = v14;

  if ([v15 isEqualToString:@"HMDHomeCHIPSendRemoteRequestMessage"])
  {
    id v16 = [v10 messagePayload];
    id v17 = [v16 objectForKeyedSubscript:@"HMDHomeCHIPRequestMessageKey"];
    id v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F6A1D0]];

    if (v18)
    {
      uint64_t v19 = [NSString stringWithFormat:@"Remote Matter: %@", v18];

      v15 = (void *)v19;
    }
  }
  if (v11) {
    [a1 peerInformationForDevice:v11];
  }
  else {
  id v20 = [a1 peerInformationForRemoteMessage:v10];
  }
  id v21 = objc_alloc((Class)a1);
  uint64_t v22 = [v10 identifier];
  v23 = [v10 transactionIdentifier];
  BYTE4(v26) = a6;
  LODWORD(v26) = a5;
  uint64_t v24 = objc_msgSend(v21, "initWithMessageName:identifier:transactionIdentifier:messageType:peerInformation:secure:transportType:sending:messageQoS:", v15, v22, v23, objc_msgSend(v10, "type"), v20, objc_msgSend(v10, "isSecure"), v26, objc_msgSend(v10, "qualityOfService"));

  return v24;
}

+ (id)peerInformationForRemoteMessage:(id)a3
{
  v3 = [a3 destination];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  id v6 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = [v8 device];
    id v10 = +[HMDRemoteMessageLogEvent peerInformationForDevice:v9];
  }
  else
  {
    id v11 = v6;
    objc_opt_class();
    unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & (v11 != 0)) != 0) {
      id v10 = @"RemoteAccountHandle";
    }
    else {
      id v10 = 0;
    }
  }

  return v10;
}

+ (id)peerInformationForDevice:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 productInfo];
  [v4 productClass];
  id v5 = HMFProductClassToString();

  if (!v5)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unable to map productClass for device %@", (uint8_t *)&v10, 0x16u);
    }
  }

  return v5;
}

@end