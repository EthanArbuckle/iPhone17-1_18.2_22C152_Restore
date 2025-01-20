@interface HMFMessage
+ (BOOL)supportsSecureCoding;
+ (NSSet)allowedClassesForXPC;
+ (id)activityNameWithMessageName:(id)a3;
+ (id)messageWithMessage:(id)a3 messagePayload:(id)a4;
+ (id)messageWithMessage:(id)a3 messagePayload:(id)a4 responseHandler:(id)a5;
+ (id)messageWithName:(id)a3 destination:(id)a4 payload:(id)a5;
+ (id)messageWithName:(id)a3 identifier:(id)a4 messagePayload:(id)a5;
+ (id)messageWithName:(id)a3 messagePayload:(id)a4;
+ (id)messageWithName:(id)a3 messagePayload:(id)a4 responseHandler:(id)a5;
+ (id)messageWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6;
+ (id)shortDescription;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)BOOLForKey:(id)a3 keyPresent:(BOOL *)a4;
- (BOOL)respondWithError:(id)a3;
- (BOOL)respondWithOutcomeOf:(id)a3;
- (BOOL)respondWithPayload:(id)a3;
- (BOOL)respondWithPayload:(id)a3 error:(id)a4;
- (BOOL)respondWithSuccess;
- (HMFActivity)activity;
- (HMFFlow)flow;
- (HMFMessage)init;
- (HMFMessage)initWithCoder:(id)a3;
- (HMFMessage)initWithInternalMessage:(id)a3;
- (HMFMessage)initWithName:(id)a3 destination:(id)a4 payload:(id)a5;
- (HMFMessage)initWithName:(id)a3 identifier:(id)a4 messagePayload:(id)a5 responseHandler:(id)a6;
- (HMFMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6;
- (HMFMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 userInfo:(id)a6 headers:(id)a7 payload:(id)a8;
- (HMFMessageDestination)destination;
- (HMFMessageInternal)internal;
- (HMFMessageTransport)transport;
- (NSDictionary)headers;
- (NSDictionary)messagePayload;
- (NSDictionary)userInfo;
- (NSString)name;
- (NSString)untrustedClientIdentifier;
- (NSUUID)identifier;
- (double)timeout;
- (id)URLForKey:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)arrayOfDateComponentsForKey:(id)a3;
- (id)calendarForKey:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataForKey:(id)a3;
- (id)dateComponentsForKey:(id)a3;
- (id)dateForKey:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)dictionaryForKey:(id)a3;
- (id)errorForKey:(id)a3;
- (id)fileHandleForKey:(id)a3;
- (id)logEventSession;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)nullForKey:(id)a3;
- (id)numberForKey:(id)a3;
- (id)predicateForKey:(id)a3;
- (id)responseHandler;
- (id)setForKey:(id)a3;
- (id)shortDescription;
- (id)stringForKey:(id)a3;
- (id)timeZoneForKey:(id)a3;
- (id)unarchivedObjectForKey:(id)a3 ofClasses:(id)a4;
- (id)uuidForKey:(id)a3;
- (int64_t)qualityOfService;
- (void)__initWithInternalMessage:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDestination:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLogEventSession:(id)a3;
- (void)setMessagePayload:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation HMFMessage

- (void).cxx_destruct
{
}

+ (id)activityNameWithMessageName:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@", @"Message:", a3];
}

- (void)setMessagePayload:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self internal];
  [v5 setMessagePayload:v4];
}

- (void)setIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HMFMessage *)self internal];
    [v5 setIdentifier:v4];
  }
}

- (id)setForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self messagePayload];
  v6 = objc_msgSend(v5, "hmf_setForKey:", v4);

  return v6;
}

- (id)dateForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self messagePayload];
  v6 = objc_msgSend(v5, "hmf_dateForKey:", v4);

  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self messagePayload];
  v6 = objc_msgSend(v5, "hmf_stringForKey:", v4);

  return v6;
}

- (id)numberForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self messagePayload];
  v6 = objc_msgSend(v5, "hmf_numberForKey:", v4);

  return v6;
}

+ (id)messageWithName:(id)a3 messagePayload:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithName:v7 identifier:0 messagePayload:v6 responseHandler:0];

  return v8;
}

- (HMFMessage)initWithName:(id)a3 identifier:(id)a4 messagePayload:(id)a5 responseHandler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  v14 = +[HMFMessageDestination allMessageDestinations];
  v15 = [(HMFMessage *)self initWithName:v13 destination:v14 payload:v12];

  if (v15)
  {
    if (v10)
    {
      v16 = [(HMFMessage *)v15 internal];
      [v16 setIdentifier:v10];
    }
    v17 = [(HMFMessage *)v15 internal];
    [v17 setResponseHandler:v11];
  }
  return v15;
}

+ (id)messageWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = (void *)[objc_alloc((Class)a1) initWithName:v12 qualityOfService:a4 destination:v11 payload:v10];

  return v13;
}

+ (id)messageWithName:(id)a3 destination:(id)a4 payload:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithName:v10 destination:v9 payload:v8];

  return v11;
}

- (HMFMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6
{
  return [(HMFMessage *)self initWithName:a3 qualityOfService:a4 destination:a5 userInfo:0 headers:0 payload:a6];
}

- (HMFMessage)initWithName:(id)a3 destination:(id)a4 payload:(id)a5
{
  return [(HMFMessage *)self initWithName:a3 qualityOfService:-1 destination:a4 payload:a5];
}

- (BOOL)BOOLForKey:(id)a3 keyPresent:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [(HMFMessage *)self messagePayload];
  LOBYTE(a4) = objc_msgSend(v7, "hmf_BOOLForKey:isPresent:", v6, a4);

  return (char)a4;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self messagePayload];
  char v6 = objc_msgSend(v5, "hmf_BOOLForKey:", v4);

  return v6;
}

- (HMFActivity)activity
{
  v2 = [(HMFMessage *)self internal];
  v3 = [v2 activity];

  return (HMFActivity *)v3;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self messagePayload];
  char v6 = objc_msgSend(v5, "hmf_dictionaryForKey:", v4);

  return v6;
}

- (id)copy
{
  v3.receiver = self;
  v3.super_class = (Class)HMFMessage;
  return [(HMFMessage *)&v3 copy];
}

- (BOOL)respondWithPayload:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMFMessage *)self responseHandler];
  id v9 = (void *)v8;
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v7, v6);
  }

  return v9 != 0;
}

- (void)setResponseHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self internal];
  [v5 setResponseHandler:v4];
}

- (BOOL)respondWithPayload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMFMessage *)self responseHandler];
  id v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v4);
  }

  return v6 != 0;
}

- (id)responseHandler
{
  v2 = [(HMFMessage *)self internal];
  objc_super v3 = [v2 responseHandler];

  return v3;
}

- (void)setDestination:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HMFMessage *)self internal];
    [v5 setDestination:v4];
  }
}

- (id)mutableCopy
{
  v3.receiver = self;
  v3.super_class = (Class)HMFMessage;
  return [(HMFMessage *)&v3 mutableCopy];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(HMFMessage *)self internal];
  id v5 = (void *)[v4 copyWithZone:a3];

  id v6 = [(HMFMessage *)+[HMFMutableMessage allocWithZone:a3] initWithInternalMessage:v5];
  return v6;
}

- (HMFMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 userInfo:(id)a6 headers:(id)a7 payload:(id)a8
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v14)
  {
    v24 = (void *)MEMORY[0x19F3A87A0]();
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543362;
      v31 = v26;
      v27 = "%{public}@Name is a required argument";
LABEL_10:
      _os_log_impl(&dword_19D57B000, v25, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);
    }
LABEL_11:

    v23 = 0;
    goto LABEL_12;
  }
  if (!v15)
  {
    v24 = (void *)MEMORY[0x19F3A87A0]();
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543362;
      v31 = v26;
      v27 = "%{public}@Destination is a required argument";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v19 = objc_alloc_init(HMFMessageInternal);
  v20 = [MEMORY[0x1E4F29128] UUID];
  [(HMFMessageInternal *)v19 setIdentifier:v20];

  [(HMFMessageInternal *)v19 setName:v14];
  [(HMFMessageInternal *)v19 setQualityOfService:a4];
  [(HMFMessageInternal *)v19 setDestination:v15];
  [(HMFMessageInternal *)v19 setUserInfo:v16];
  [(HMFMessageInternal *)v19 setHeaders:v17];
  [(HMFMessageInternal *)v19 setMessagePayload:v18];
  v29.receiver = self;
  v29.super_class = (Class)HMFMessage;
  v21 = [(HMFMessage *)&v29 init];
  v22 = v21;
  if (v21) {
    [(HMFMessage *)v21 __initWithInternalMessage:v19];
  }
  self = v22;

  v23 = self;
LABEL_12:

  return v23;
}

- (HMFMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HMFMessageInternal);
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMF.identifier"];
  [(HMFMessageInternal *)v5 setIdentifier:v6];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMF.name"];
  [(HMFMessageInternal *)v5 setName:v7];

  [v4 decodeDoubleForKey:@"HMF.timeout"];
  [(HMFMessageInternal *)v5 setTimeout:"setTimeout:"];
  -[HMFMessageInternal setQualityOfService:](v5, "setQualityOfService:", [v4 decodeIntegerForKey:@"HMF.qos"]);
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMF.destination"];
  [(HMFMessageInternal *)v5 setDestination:v8];

  id v9 = +[HMFMessage allowedClassesForXPC];
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"HMF.headers"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  [(HMFMessageInternal *)v5 setHeaders:v12];
  id v13 = +[HMFMessage allowedClassesForXPC];
  id v14 = [v4 decodeObjectOfClasses:v13 forKey:@"HMF.payload"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  [(HMFMessageInternal *)v5 setMessagePayload:v16];
  id v17 = [(HMFMessage *)self initWithInternalMessage:v5];

  return v17;
}

+ (NSSet)allowedClassesForXPC
{
  v6[14] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  v6[8] = objc_opt_class();
  v6[9] = objc_opt_class();
  v6[10] = objc_opt_class();
  v6[11] = objc_opt_class();
  v6[12] = objc_opt_class();
  v6[13] = objc_opt_class();
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:14];
  id v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self identifier];
  [v4 encodeObject:v5 forKey:@"HMF.identifier"];

  id v6 = [(HMFMessage *)self name];
  [v4 encodeObject:v6 forKey:@"HMF.name"];

  [(HMFMessage *)self timeout];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HMF.timeout");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFMessage qualityOfService](self, "qualityOfService"), @"HMF.qos");
  id v7 = [(HMFMessage *)self destination];
  [v4 encodeObject:v7 forKey:@"HMF.destination"];

  uint64_t v8 = [(HMFMessage *)self headers];
  [v4 encodeObject:v8 forKey:@"HMF.headers"];

  id v9 = [(HMFMessage *)self messagePayload];
  [v4 encodeObject:v9 forKey:@"HMF.payload"];
}

- (NSDictionary)headers
{
  v2 = [(HMFMessage *)self internal];
  objc_super v3 = [v2 headers];

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v5 = v4;

  return v5;
}

- (NSDictionary)messagePayload
{
  v2 = [(HMFMessage *)self internal];
  objc_super v3 = [v2 messagePayload];

  return (NSDictionary *)v3;
}

- (int64_t)qualityOfService
{
  v2 = [(HMFMessage *)self internal];
  int64_t v3 = [v2 qualityOfService];

  return v3;
}

- (HMFMessage)initWithInternalMessage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMFMessage;
  id v5 = [(HMFMessage *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(HMFMessage *)v5 __initWithInternalMessage:v4];
  }

  return v6;
}

- (void)__initWithInternalMessage:(id)a3
{
  id v5 = a3;
  if (self)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_internal, a3);
    id v5 = v6;
  }
}

- (HMFMessageDestination)destination
{
  v2 = [(HMFMessage *)self internal];
  int64_t v3 = [v2 destination];

  return (HMFMessageDestination *)v3;
}

- (HMFMessageTransport)transport
{
  v2 = [(HMFMessage *)self internal];
  int64_t v3 = [v2 transport];

  return (HMFMessageTransport *)v3;
}

- (NSDictionary)userInfo
{
  v2 = [(HMFMessage *)self internal];
  int64_t v3 = [v2 userInfo];

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v5 = v4;

  return v5;
}

- (HMFMessageInternal)internal
{
  return self->_internal;
}

- (NSString)name
{
  v2 = [(HMFMessage *)self internal];
  int64_t v3 = [v2 name];

  return (NSString *)v3;
}

- (NSUUID)identifier
{
  v2 = [(HMFMessage *)self internal];
  int64_t v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (double)timeout
{
  [(HMFMessageInternal *)self->_internal timeout];
  return result;
}

- (id)shortDescription
{
  int64_t v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMFMessage *)self name];
  id v6 = [(HMFMessage *)self identifier];
  id v7 = [v6 UUIDString];
  objc_super v8 = [v3 stringWithFormat:@"%@ %@(%@)", v4, v5, v7];

  return v8;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)respondWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMFMessage *)self responseHandler];
  id v6 = (void (**)(void, void, void))v5;
  if (v5)
  {
    if (v4)
    {
      (*(void (**)(uint64_t, id, void))(v5 + 16))(v5, v4, 0);
    }
    else
    {
      id v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11];
      ((void (**)(void, void *, void))v6)[2](v6, v7, 0);
    }
  }

  return v6 != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)respondWithOutcomeOf:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMFMessage *)self responseHandler];
  id v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__HMFMessage_HMFFuture__respondWithOutcomeOf___block_invoke;
    v8[3] = &unk_1E5957600;
    id v9 = v5;
    [v4 getResultWithCompletion:v8];
  }
  return v6 != 0;
}

uint64_t __46__HMFMessage_HMFFuture__respondWithOutcomeOf___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HMFMessage)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  id v18 = NSString;
  uint64_t v5 = [(id)objc_opt_class() shortDescription];
  BOOL v19 = v3;
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = &stru_1EEF0F5E0;
  }
  id v7 = [(HMFMessage *)self identifier];
  objc_super v8 = [v7 UUIDString];
  id v9 = [(HMFMessage *)self name];
  uint64_t v10 = [(HMFMessage *)self qualityOfService];
  if (v10 <= 16)
  {
    if (v10 == -1)
    {
      id v11 = @"Default";
      goto LABEL_16;
    }
    if (v10 == 9)
    {
      id v11 = @"Background";
      goto LABEL_16;
    }
  }
  else
  {
    switch(v10)
    {
      case 17:
        id v11 = @"Utility";
        goto LABEL_16;
      case 25:
        id v11 = @"User Initiated";
        goto LABEL_16;
      case 33:
        id v11 = @"User Interactive";
        goto LABEL_16;
    }
  }
  id v11 = @"Unknown";
LABEL_16:
  id v12 = [(HMFMessage *)self destination];
  id v13 = [(HMFMessage *)self activity];
  id v14 = [(HMFMessage *)self userInfo];
  id v15 = [(HMFMessage *)self headers];
  id v16 = [v18 stringWithFormat:@"<%@%@, Identifier = %@, Name = %@, QoS = %@, Destination = %@, Activity = %@, \nUser Info = %@,\nHeaders = %@>", v5, v6, v8, v9, v11, v12, v13, v14, v15];

  if (v19) {
  return v16;
  }
}

- (id)debugDescription
{
  return [(HMFMessage *)self descriptionWithPointer:1];
}

- (id)description
{
  return [(HMFMessage *)self descriptionWithPointer:0];
}

- (NSString)untrustedClientIdentifier
{
  v2 = [(HMFMessage *)self headers];
  BOOL v3 = objc_msgSend(v2, "hmf_stringForKey:", @"HMF.untrustedClientIdentifier");

  return (NSString *)v3;
}

- (id)logEventSession
{
  v2 = [(HMFMessage *)self internal];
  BOOL v3 = [v2 logEventSession];

  return v3;
}

- (void)setLogEventSession:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self internal];
  [v5 setLogEventSession:v4];
}

- (BOOL)respondWithSuccess
{
  return [(HMFMessage *)self respondWithPayload:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(HMFMessage *)self internal];
  id v5 = (void *)[v4 copyWithZone:a3];

  id v6 = [MEMORY[0x1E4F29128] UUID];
  [v5 setIdentifier:v6];

  id v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithInternalMessage:", v5);
  return v7;
}

+ (id)messageWithName:(id)a3 messagePayload:(id)a4 responseHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithName:v10 identifier:0 messagePayload:v9 responseHandler:v8];

  return v11;
}

+ (id)messageWithName:(id)a3 identifier:(id)a4 messagePayload:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithName:v10 identifier:v9 messagePayload:v8 responseHandler:0];

  return v11;
}

+ (id)messageWithMessage:(id)a3 messagePayload:(id)a4
{
  id v6 = a4;
  id v7 = [a3 internal];
  id v8 = (void *)[v7 copy];

  [v8 setMessagePayload:v6];
  id v9 = (void *)[objc_alloc((Class)a1) initWithInternalMessage:v8];

  return v9;
}

+ (id)messageWithMessage:(id)a3 messagePayload:(id)a4 responseHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 internal];
  id v11 = (void *)[v10 copy];

  [v11 setMessagePayload:v9];
  if (v8) {
    [v11 setResponseHandler:v8];
  }
  id v12 = (void *)[objc_alloc((Class)a1) initWithInternalMessage:v11];

  return v12;
}

- (id)uuidForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self messagePayload];
  id v6 = objc_msgSend(v5, "hmf_UUIDForKey:", v4);

  return v6;
}

- (HMFFlow)flow
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMFMessage *)self messagePayload];
  id v4 = objc_msgSend(v3, "hmf_flowForKey:", @"HMFMessageFlowKey");

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = +[HMFFlow internalOnlyInitializer];
    id v6 = (void *)MEMORY[0x19F3A87A0]();
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier(0);
      id v9 = [v5 UUID];
      int v11 = 138543874;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = self;
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Incorrect Flow Usage: Expected, but did not find, flow for message: %@", (uint8_t *)&v11, 0x20u);
    }
  }

  return (HMFFlow *)v5;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self messagePayload];
  id v6 = objc_msgSend(v5, "hmf_arrayForKey:", v4);

  return v6;
}

- (id)dataForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self messagePayload];
  id v6 = objc_msgSend(v5, "hmf_dataForKey:", v4);

  return v6;
}

- (id)nullForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self messagePayload];
  id v6 = objc_msgSend(v5, "hmf_nullForKey:", v4);

  return v6;
}

- (id)timeZoneForKey:(id)a3
{
  BOOL v3 = [(HMFMessage *)self dataForKey:a3];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CAF0], "hmf_unarchiveFromData:error:", v3, 0);

  return v4;
}

- (id)dateComponentsForKey:(id)a3
{
  BOOL v3 = [(HMFMessage *)self dataForKey:a3];
  id v4 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hmf_unarchiveFromData:error:", v3, 0);

  return v4;
}

- (id)URLForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self messagePayload];
  id v6 = objc_msgSend(v5, "hmf_URLForKey:", v4);

  return v6;
}

- (id)errorForKey:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMFMessage *)self messagePayload];
  id v6 = objc_msgSend(v5, "hmf_errorForKey:", v4);

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    v10[0] = objc_opt_class();
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v7 = [(HMFMessage *)self unarchivedObjectForKey:v4 ofClasses:v8];
  }
  return v7;
}

- (id)calendarForKey:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8[0] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v6 = [(HMFMessage *)self unarchivedObjectForKey:v4 ofClasses:v5];

  return v6;
}

- (id)predicateForKey:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMFMessage *)self dataForKey:a3];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC0];
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    id v7 = [v5 setWithArray:v6];
    id v8 = [v4 unarchivedObjectOfClasses:v7 fromData:v3 error:0];

    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)arrayOfDateComponentsForKey:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMFMessage *)self dataForKey:a3];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC0];
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    id v7 = [v5 setWithArray:v6];
    id v8 = [v4 unarchivedObjectOfClasses:v7 fromData:v3 error:0];

    objc_opt_class();
    id v9 = 0;
    if (objc_opt_isKindOfClass())
    {
      if (objc_msgSend(v8, "hmf_objectsAreKindOfClass:", objc_opt_class())) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)unarchivedObjectForKey:(id)a3 ofClasses:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMFMessage *)self messagePayload];
  id v9 = objc_msgSend(v8, "hmf_unarchivedObjectForKey:ofClasses:", v7, v6);

  return v9;
}

- (id)fileHandleForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFMessage *)self messagePayload];
  id v6 = objc_msgSend(v5, "hmf_fileHandleForKey:", v4);

  return v6;
}

@end