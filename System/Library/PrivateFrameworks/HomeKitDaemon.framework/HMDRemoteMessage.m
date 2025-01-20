@interface HMDRemoteMessage
+ (HMDRemoteMessage)messageWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 messagePayload:(id)a6 restriction:(unint64_t)a7;
+ (id)secureMessageWithName:(id)a3 destination:(id)a4 messagePayload:(id)a5;
+ (id)secureMessageWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 messagePayload:(id)a6;
+ (id)secureMessageWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 messagePayload:(id)a6 restriction:(unint64_t)a7;
+ (id)secureMessageWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 messagePayload:(id)a6 timeout:(double)a7 restriction:(unint64_t)a8;
- (BOOL)isRemote;
- (HMDHomeKitVersion)sourceVersion;
- (HMDRemoteMessage)initWithName:(id)a3 destination:(id)a4 payload:(id)a5;
- (HMDRemoteMessage)initWithName:(id)a3 destination:(id)a4 payload:(id)a5 headers:(id)a6 type:(int64_t)a7 timeout:(double)a8 secure:(BOOL)a9;
- (HMDRemoteMessage)initWithName:(id)a3 destination:(id)a4 payload:(id)a5 type:(int64_t)a6 timeout:(double)a7 secure:(BOOL)a8;
- (HMDRemoteMessage)initWithName:(id)a3 destination:(id)a4 payload:(id)a5 type:(int64_t)a6 timeout:(double)a7 secure:(BOOL)a8 restriction:(unint64_t)a9;
- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6;
- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 headers:(id)a7 type:(int64_t)a8 timeout:(double)a9 secure:(BOOL)a10;
- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 headers:(id)a7 type:(int64_t)a8 timeout:(double)a9 secure:(BOOL)a10 restriction:(unint64_t)a11 sendOptions:(unint64_t)a12;
- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 headers:(id)a7 type:(int64_t)a8 timeout:(double)a9 secure:(BOOL)a10 restriction:(unint64_t)a11 sendOptions:(unint64_t)a12 collapseID:(id)a13;
- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 type:(int64_t)a7 timeout:(double)a8 secure:(BOOL)a9;
- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 type:(int64_t)a7 timeout:(double)a8 secure:(BOOL)a9 restriction:(unint64_t)a10;
- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 type:(int64_t)a7 timeout:(double)a8 secure:(BOOL)a9 restriction:(unint64_t)a10 sendOptions:(unint64_t)a11;
- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 type:(int64_t)a7 timeout:(double)a8 secure:(BOOL)a9 restriction:(unint64_t)a10 sendOptions:(unint64_t)a11 collapseID:(id)a12;
- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 userInfo:(id)a6 headers:(id)a7 payload:(id)a8;
- (NSString)attributedMessageName;
- (NSString)collapseID;
- (NSUUID)transactionIdentifier;
- (id)copyWithDestination:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)privateDescription;
- (int64_t)type;
- (unint64_t)sendOptions;
- (void)setAttributedMessageName:(id)a3;
- (void)setDisallowsIDSRacing:(BOOL)a3;
- (void)setInternalResponseHandler:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setResponseRestriction:(unint64_t)a3;
- (void)setRestriction:(unint64_t)a3;
- (void)setSecure:(BOOL)a3;
- (void)setSenderContext:(id)a3;
- (void)setSourceVersion:(id)a3;
- (void)setToID:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation HMDRemoteMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

- (void)setSourceVersion:(id)a3
{
}

- (HMDHomeKitVersion)sourceVersion
{
  return self->_sourceVersion;
}

- (unint64_t)sendOptions
{
  return self->_sendOptions;
}

- (void)setTransactionIdentifier:(id)a3
{
}

- (NSUUID)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (id)copyWithDestination:(id)a3
{
  id v4 = a3;
  v5 = [HMDRemoteMessage alloc];
  v6 = [(HMDRemoteMessage *)self name];
  uint64_t v7 = [(HMDRemoteMessage *)self qualityOfService];
  v8 = [(HMDRemoteMessage *)self messagePayload];
  v9 = [(HMDRemoteMessage *)self headers];
  int64_t v10 = [(HMDRemoteMessage *)self type];
  [(HMDRemoteMessage *)self timeout];
  double v12 = v11;
  LOBYTE(v17) = [(HMDRemoteMessage *)self isSecure];
  v13 = [(HMDRemoteMessage *)v5 initWithName:v6 qualityOfService:v7 destination:v4 payload:v8 headers:v9 type:v10 timeout:v12 secure:v17 restriction:[(HMDRemoteMessage *)self restriction] sendOptions:[(HMDRemoteMessage *)self sendOptions]];

  v14 = [(HMDRemoteMessage *)self transactionIdentifier];
  [(HMDRemoteMessage *)v13 setTransactionIdentifier:v14];

  v15 = [(HMDRemoteMessage *)self identifier];
  [(HMDRemoteMessage *)v13 setIdentifier:v15];

  [(HMDRemoteMessage *)v13 setDisallowsIDSRacing:[(HMDRemoteMessage *)self disallowsIDSRacing]];
  return v13;
}

- (void)setDisallowsIDSRacing:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(HMDRemoteMessage *)self userInfo];
  id v8 = (id)[v5 mutableCopy];

  v6 = [NSNumber numberWithBool:v3];
  [v8 setObject:v6 forKeyedSubscript:@"HMD.remoteDisallowsIDSRacing"];

  uint64_t v7 = [(HMDRemoteMessage *)self internal];
  [v7 setUserInfo:v8];
}

- (NSString)collapseID
{
  v2 = [(HMDRemoteMessage *)self userInfo];
  BOOL v3 = [v2 objectForKeyedSubscript:@"HMD.remoteCollapseID"];

  return (NSString *)v3;
}

- (void)setToID:(id)a3
{
  id v4 = a3;
  v5 = [(HMDRemoteMessage *)self userInfo];
  id v7 = (id)[v5 mutableCopy];

  [v7 setObject:v4 forKeyedSubscript:@"kRemoteMessageIDSToIDKey"];
  v6 = [(HMDRemoteMessage *)self internal];
  [v6 setUserInfo:v7];
}

- (void)setSenderContext:(id)a3
{
  id v4 = a3;
  v5 = [(HMDRemoteMessage *)self userInfo];
  id v7 = (id)[v5 mutableCopy];

  [v7 setObject:v4 forKeyedSubscript:@"HMD.remoteSenderContext"];
  v6 = [(HMDRemoteMessage *)self internal];
  [v6 setUserInfo:v7];
}

- (void)setAttributedMessageName:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(HMDRemoteMessage *)self userInfo];
    id v8 = (id)[v5 mutableCopy];

    [v8 setObject:v4 forKeyedSubscript:@"HMD.attributedMessageName"];
    v6 = [(HMDRemoteMessage *)self internal];
    id v7 = (void *)[v8 copy];
    [v6 setUserInfo:v7];
  }
}

- (NSString)attributedMessageName
{
  v2 = [(HMDRemoteMessage *)self internal];
  BOOL v3 = [v2 userInfo];
  id v4 = objc_msgSend(v3, "hmf_stringForKey:", @"HMD.attributedMessageName");

  return (NSString *)v4;
}

- (void)setResponseRestriction:(unint64_t)a3
{
  v5 = [(HMDRemoteMessage *)self userInfo];
  id v9 = (id)[v5 mutableCopy];

  v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v9 setObject:v6 forKeyedSubscript:@"HMD.remoteTransportResponseRestriction"];

  id v7 = [(HMDRemoteMessage *)self internal];
  id v8 = (void *)[v9 copy];
  [v7 setUserInfo:v8];
}

- (void)setRestriction:(unint64_t)a3
{
  v5 = [(HMDRemoteMessage *)self userInfo];
  id v9 = (id)[v5 mutableCopy];

  v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v9 setObject:v6 forKeyedSubscript:@"HMD.remoteTransportRestriction"];

  id v7 = [(HMDRemoteMessage *)self internal];
  id v8 = (void *)[v9 copy];
  [v7 setUserInfo:v8];
}

- (void)setInternalResponseHandler:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HMDRemoteMessage;
  [(HMDRemoteMessage *)&v3 setResponseHandler:a3];
}

- (void)setResponseHandler:(id)a3
{
  id v4 = a3;
  if (v4 && [(HMDRemoteMessage *)self type] == 3) {
    [(HMDRemoteMessage *)self setType:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)HMDRemoteMessage;
  [(HMDRemoteMessage *)&v5 setResponseHandler:v4];
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  if (!a3)
  {
    id v4 = [(HMDRemoteMessage *)self transactionIdentifier];

    if (!v4)
    {
      id v5 = [MEMORY[0x263F08C38] UUID];
      [(HMDRemoteMessage *)self setTransactionIdentifier:v5];
    }
  }
}

- (void)setSecure:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HMDRemoteMessage *)self userInfo];
  id v9 = (id)[v5 mutableCopy];

  v6 = [NSNumber numberWithBool:v3];
  [v9 setObject:v6 forKeyedSubscript:@"HMD.remoteSecure"];

  id v7 = [(HMDRemoteMessage *)self internal];
  id v8 = (void *)[v9 copy];
  [v7 setUserInfo:v8];
}

- (BOOL)isRemote
{
  return 1;
}

- (id)privateDescription
{
  return [(HMDRemoteMessage *)self descriptionWithPointer:0];
}

- (id)description
{
  return [(HMDRemoteMessage *)self descriptionWithPointer:0];
}

- (id)debugDescription
{
  return [(HMDRemoteMessage *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = shouldLogPrivateInformation();
  v6 = [(HMDRemoteMessage *)self destination];
  id v7 = v6;
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = [v6 privateDescription];

    id v7 = (void *)v8;
  }
  if (shouldLogPrivateInformation())
  {
    v24 = [(HMDRemoteMessage *)self userInfo];
  }
  else
  {
    v24 = @"...";
    id v9 = @"...";
  }
  v21 = NSString;
  v22 = [(id)objc_opt_class() shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    int64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int64_t v10 = &stru_26E2EB898;
  }
  BOOL v23 = v3;
  double v11 = [(HMDRemoteMessage *)self identifier];
  double v12 = [v11 UUIDString];
  v13 = [(HMDRemoteMessage *)self name];
  [(HMDRemoteMessage *)self qualityOfService];
  v14 = HMFQualityOfServiceToString();
  unint64_t v15 = [(HMDRemoteMessage *)self type];
  if (v15 > 3) {
    v16 = 0;
  }
  else {
    v16 = off_264A2EBD0[v15];
  }
  uint64_t v17 = [(HMDRemoteMessage *)self transactionIdentifier];
  v18 = [(HMDRemoteMessage *)self headers];
  v19 = [v21 stringWithFormat:@"<%@%@, Identifier = %@, Name = %@, QoS = %@, Type = %@, TransactionIdentifier = %@, Destination = %@,\nUser Info = %@,\nHeaders = %@>", v22, v10, v12, v13, v14, v16, v17, v7, v24, v18];

  if (v23) {
  return v19;
  }
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 headers:(id)a7 type:(int64_t)a8 timeout:(double)a9 secure:(BOOL)a10 restriction:(unint64_t)a11 sendOptions:(unint64_t)a12 collapseID:(id)a13
{
  v41[3] = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a13;
  unint64_t v24 = __ROR8__(a4 - 9, 3);
  if (v24 >= 4) {
    uint64_t v25 = HMDCurrentQOSWithFloor();
  }
  else {
    uint64_t v25 = 8 * v24 + 9;
  }
  v41[0] = MEMORY[0x263EFFA88];
  v40[0] = @"HMD.remote";
  v40[1] = @"HMD.remoteSecure";
  v26 = objc_msgSend(NSNumber, "numberWithBool:", a10, a8);
  v41[1] = v26;
  v40[2] = @"HMD.remoteTransportRestriction";
  v27 = [NSNumber numberWithUnsignedInteger:a11];
  v41[2] = v27;
  v28 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];

  if (v23)
  {
    v29 = (void *)[v28 mutableCopy];
    [v29 setObject:v23 forKeyedSubscript:@"HMD.remoteCollapseID"];
    uint64_t v30 = [v29 copy];

    v28 = (void *)v30;
  }
  v39.receiver = self;
  v39.super_class = (Class)HMDRemoteMessage;
  v31 = [(HMDRemoteMessage *)&v39 initWithName:v19 qualityOfService:v25 destination:v20 userInfo:v28 headers:v22 payload:v21];
  v32 = v31;
  if (v31)
  {
    v31->_type = v38;
    if (a9 > 0.0)
    {
      v33 = [(HMDRemoteMessage *)v31 internal];
      [v33 setTimeout:a9];
    }
    if (!v38)
    {
      uint64_t v34 = [MEMORY[0x263F08C38] UUID];
      transactionIdentifier = v32->_transactionIdentifier;
      v32->_transactionIdentifier = (NSUUID *)v34;
    }
    v32->_sendOptions = a12;
  }

  return v32;
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 type:(int64_t)a7 timeout:(double)a8 secure:(BOOL)a9 restriction:(unint64_t)a10 sendOptions:(unint64_t)a11 collapseID:(id)a12
{
  LOBYTE(v13) = a9;
  return [(HMDRemoteMessage *)self initWithName:a3 qualityOfService:a4 destination:a5 payload:a6 headers:0 type:a7 timeout:a8 secure:v13 restriction:a10 sendOptions:a11 collapseID:a12];
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 headers:(id)a7 type:(int64_t)a8 timeout:(double)a9 secure:(BOOL)a10 restriction:(unint64_t)a11 sendOptions:(unint64_t)a12
{
  LOBYTE(v13) = a10;
  return [(HMDRemoteMessage *)self initWithName:a3 qualityOfService:a4 destination:a5 payload:a6 headers:a7 type:a8 timeout:a9 secure:v13 restriction:a11 sendOptions:a12 collapseID:0];
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 type:(int64_t)a7 timeout:(double)a8 secure:(BOOL)a9 restriction:(unint64_t)a10 sendOptions:(unint64_t)a11
{
  LOBYTE(v12) = a9;
  return [(HMDRemoteMessage *)self initWithName:a3 qualityOfService:a4 destination:a5 payload:a6 headers:0 type:a7 timeout:a8 secure:v12 restriction:a10 sendOptions:a11];
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 type:(int64_t)a7 timeout:(double)a8 secure:(BOOL)a9 restriction:(unint64_t)a10
{
  LOBYTE(v11) = a9;
  return [(HMDRemoteMessage *)self initWithName:a3 qualityOfService:a4 destination:a5 payload:a6 headers:0 type:a7 timeout:a8 secure:v11 restriction:a10 sendOptions:0];
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 type:(int64_t)a7 timeout:(double)a8 secure:(BOOL)a9
{
  LOBYTE(v10) = a9;
  return [(HMDRemoteMessage *)self initWithName:a3 qualityOfService:a4 destination:a5 payload:a6 headers:0 type:a7 timeout:a8 secure:v10];
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6 headers:(id)a7 type:(int64_t)a8 timeout:(double)a9 secure:(BOOL)a10
{
  LOBYTE(v11) = a10;
  return [(HMDRemoteMessage *)self initWithName:a3 qualityOfService:a4 destination:a5 payload:a6 headers:a7 type:a8 timeout:a9 secure:v11 restriction:-1 sendOptions:0];
}

- (HMDRemoteMessage)initWithName:(id)a3 destination:(id)a4 payload:(id)a5 type:(int64_t)a6 timeout:(double)a7 secure:(BOOL)a8 restriction:(unint64_t)a9
{
  return [(HMDRemoteMessage *)self initWithName:a3 qualityOfService:-1 destination:a4 payload:a5 type:a6 timeout:a8 secure:a7 restriction:a9 sendOptions:0];
}

- (HMDRemoteMessage)initWithName:(id)a3 destination:(id)a4 payload:(id)a5 headers:(id)a6 type:(int64_t)a7 timeout:(double)a8 secure:(BOOL)a9
{
  LOBYTE(v10) = a9;
  return [(HMDRemoteMessage *)self initWithName:a3 qualityOfService:-1 destination:a4 payload:a5 headers:a6 type:a7 timeout:a8 secure:v10 restriction:-1 sendOptions:0];
}

- (HMDRemoteMessage)initWithName:(id)a3 destination:(id)a4 payload:(id)a5 type:(int64_t)a6 timeout:(double)a7 secure:(BOOL)a8
{
  return [(HMDRemoteMessage *)self initWithName:a3 destination:a4 payload:a5 headers:0 type:a6 timeout:a8 secure:a7];
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 userInfo:(id)a6 headers:(id)a7 payload:(id)a8
{
  LOBYTE(v9) = 0;
  return [(HMDRemoteMessage *)self initWithName:a3 qualityOfService:a4 destination:a5 payload:a8 headers:a7 type:3 timeout:0.0 secure:v9 restriction:-1 sendOptions:0];
}

- (HMDRemoteMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6
{
  return [(HMDRemoteMessage *)self initWithName:a3 qualityOfService:a4 destination:a5 payload:a6 type:3 timeout:0 secure:0.0 restriction:-1];
}

- (HMDRemoteMessage)initWithName:(id)a3 destination:(id)a4 payload:(id)a5
{
  return [(HMDRemoteMessage *)self initWithName:a3 qualityOfService:-1 destination:a4 payload:a5 type:3 timeout:0 secure:0.0 restriction:-1 sendOptions:0];
}

+ (HMDRemoteMessage)messageWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 messagePayload:(id)a6 restriction:(unint64_t)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  unint64_t v15 = (void *)[objc_alloc((Class)a1) initWithName:v14 qualityOfService:a4 destination:v13 payload:v12 type:3 timeout:0 secure:0.0 restriction:a7 sendOptions:0];

  return (HMDRemoteMessage *)v15;
}

+ (id)secureMessageWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 messagePayload:(id)a6 timeout:(double)a7 restriction:(unint64_t)a8
{
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  uint64_t v17 = (void *)[objc_alloc((Class)a1) initWithName:v16 qualityOfService:a4 destination:v15 payload:v14 type:3 timeout:1 secure:a7 restriction:a8 sendOptions:0];

  return v17;
}

+ (id)secureMessageWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 messagePayload:(id)a6 restriction:(unint64_t)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = (void *)[objc_alloc((Class)a1) initWithName:v14 qualityOfService:a4 destination:v13 payload:v12 type:3 timeout:1 secure:0.0 restriction:a7 sendOptions:0];

  return v15;
}

+ (id)secureMessageWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 messagePayload:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = (void *)[objc_alloc((Class)a1) initWithName:v12 qualityOfService:a4 destination:v11 payload:v10 type:3 timeout:1 secure:0.0 restriction:-1 sendOptions:0];

  return v13;
}

+ (id)secureMessageWithName:(id)a3 destination:(id)a4 messagePayload:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithName:v10 qualityOfService:-1 destination:v9 payload:v8 type:3 timeout:1 secure:0.0 restriction:-1 sendOptions:0];

  return v11;
}

@end