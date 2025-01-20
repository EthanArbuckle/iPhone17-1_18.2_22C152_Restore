@interface SHMatcherRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestOnceWithAppIntentForRequestID:(id)a3;
+ (id)requestOnceWithNotifications:(BOOL)a3;
+ (id)requestOnceWithNotifications:(BOOL)a3 forRequestID:(id)a4;
+ (id)requestSignatureGenerationOnce;
+ (id)requestSignatureGenerationOnceForRequestID:(id)a3;
+ (id)requestSignatureGenerationUntilDeadline:(id)a3;
+ (id)requestSignatureGenerationUntilDeadline:(id)a3 forRequestID:(id)a4;
+ (id)requestToMatchSignature:(id)a3 installationID:(id)a4 sendNotifications:(BOOL)a5;
+ (id)requestToMatchSignature:(id)a3 installationID:(id)a4 sendNotifications:(BOOL)a5 forRequestID:(id)a6;
+ (id)requestToMatchUntilDeadline:(id)a3 sendNotifications:(BOOL)a4;
+ (id)requestToMatchUntilDeadline:(id)a3 sendNotifications:(BOOL)a4 forRequestID:(id)a5;
+ (id)requestUntilMatchWithNotifications:(BOOL)a3;
+ (id)requestUntilMatchWithNotifications:(BOOL)a3 forRequestID:(id)a4;
- (BOOL)hasHitDeadline;
- (BOOL)sendNotifications;
- (NSDate)deadline;
- (NSString)installationID;
- (NSUUID)requestID;
- (SHMatcherRequest)initWithCoder:(id)a3;
- (SHMatcherRequest)initWithSignature:(id)a3 deadline:(id)a4 installationID:(id)a5 sendNotifications:(BOOL)a6 stopCondition:(int64_t)a7 requestType:(int64_t)a8 requestID:(id)a9;
- (SHMatcherRequest)initWithSignature:(id)a3 deadline:(id)a4 sendNotifications:(BOOL)a5 stopCondition:(int64_t)a6 requestType:(int64_t)a7 requestID:(id)a8;
- (SHSignature)signature;
- (double)watchdogTimeout;
- (int64_t)stopCondition;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHMatcherRequest

+ (id)requestSignatureGenerationOnce
{
  v3 = [MEMORY[0x263F08C38] UUID];
  v4 = [a1 requestSignatureGenerationOnceForRequestID:v3];

  return v4;
}

+ (id)requestSignatureGenerationOnceForRequestID:(id)a3
{
  id v3 = a3;
  v4 = [[SHMatcherRequest alloc] initWithSignature:0 deadline:0 sendNotifications:0 stopCondition:0 requestType:1 requestID:v3];

  return v4;
}

+ (id)requestSignatureGenerationUntilDeadline:(id)a3
{
  v4 = (void *)MEMORY[0x263F08C38];
  id v5 = a3;
  v6 = [v4 UUID];
  v7 = [a1 requestSignatureGenerationUntilDeadline:v5 forRequestID:v6];

  return v7;
}

+ (id)requestSignatureGenerationUntilDeadline:(id)a3 forRequestID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[SHMatcherRequest alloc] initWithSignature:0 deadline:v6 sendNotifications:0 stopCondition:3 requestType:1 requestID:v5];

  return v7;
}

+ (id)requestToMatchSignature:(id)a3 installationID:(id)a4 sendNotifications:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = (void *)MEMORY[0x263F08C38];
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 UUID];
  v12 = [a1 requestToMatchSignature:v10 installationID:v9 sendNotifications:v5 forRequestID:v11];

  return v12;
}

+ (id)requestToMatchSignature:(id)a3 installationID:(id)a4 sendNotifications:(BOOL)a5 forRequestID:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = [[SHMatcherRequest alloc] initWithSignature:v11 deadline:0 installationID:v10 sendNotifications:v6 stopCondition:1 requestType:0 requestID:v9];

  return v12;
}

+ (id)requestToMatchUntilDeadline:(id)a3 sendNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = (void *)MEMORY[0x263F08C38];
  id v7 = a3;
  v8 = [v6 UUID];
  id v9 = [a1 requestToMatchUntilDeadline:v7 sendNotifications:v4 forRequestID:v8];

  return v9;
}

+ (id)requestToMatchUntilDeadline:(id)a3 sendNotifications:(BOOL)a4 forRequestID:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = [[SHMatcherRequest alloc] initWithSignature:0 deadline:v8 sendNotifications:v5 stopCondition:3 requestType:2 requestID:v7];

  return v9;
}

+ (id)requestOnceWithNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [MEMORY[0x263F08C38] UUID];
  BOOL v6 = [a1 requestOnceWithNotifications:v3 forRequestID:v5];

  return v6;
}

+ (id)requestOnceWithNotifications:(BOOL)a3 forRequestID:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  BOOL v6 = [[SHMatcherRequest alloc] initWithSignature:0 deadline:0 sendNotifications:v4 stopCondition:0 requestType:2 requestID:v5];

  return v6;
}

+ (id)requestUntilMatchWithNotifications:(BOOL)a3 forRequestID:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  BOOL v6 = [[SHMatcherRequest alloc] initWithSignature:0 deadline:0 sendNotifications:v4 stopCondition:2 requestType:2 requestID:v5];

  return v6;
}

+ (id)requestUntilMatchWithNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x263F08C38] UUID];
  BOOL v6 = [a1 requestUntilMatchWithNotifications:v3 forRequestID:v5];

  return v6;
}

+ (id)requestOnceWithAppIntentForRequestID:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[SHMatcherRequest alloc] initWithSignature:0 deadline:0 sendNotifications:0 stopCondition:2 requestType:3 requestID:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHMatcherRequest)initWithSignature:(id)a3 deadline:(id)a4 sendNotifications:(BOOL)a5 stopCondition:(int64_t)a6 requestType:(int64_t)a7 requestID:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)SHMatcherRequest;
  v18 = [(SHMatcherRequest *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_signature, a3);
    objc_storeStrong((id *)&v19->_deadline, a4);
    v19->_sendNotifications = a5;
    v19->_stopCondition = a6;
    v19->_type = a7;
    objc_storeStrong((id *)&v19->_requestID, a8);
  }

  return v19;
}

- (SHMatcherRequest)initWithSignature:(id)a3 deadline:(id)a4 installationID:(id)a5 sendNotifications:(BOOL)a6 stopCondition:(int64_t)a7 requestType:(int64_t)a8 requestID:(id)a9
{
  BOOL v11 = a6;
  id v16 = a5;
  id v17 = [(SHMatcherRequest *)self initWithSignature:a3 deadline:a4 sendNotifications:v11 stopCondition:a7 requestType:a8 requestID:a9];
  v18 = v17;
  if (v17) {
    objc_storeStrong((id *)&v17->_installationID, a5);
  }

  return v18;
}

- (SHMatcherRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SHMatcherRequest;
  id v5 = [(SHMatcherRequest *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v5->_signature;
    v5->_signature = (SHSignature *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deadline"];
    deadline = v5->_deadline;
    v5->_deadline = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installationID"];
    installationID = v5->_installationID;
    v5->_installationID = (NSString *)v10;

    v5->_sendNotifications = [v4 decodeBoolForKey:@"sendNotifications"];
    v5->_stopCondition = [v4 decodeIntegerForKey:@"stopCondition"];
    v5->_type = [v4 decodeIntegerForKey:@"requestType"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestID"];
    requestID = v5->_requestID;
    v5->_requestID = (NSUUID *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  requestID = self->_requestID;
  id v5 = a3;
  [v5 encodeObject:requestID forKey:@"requestID"];
  [v5 encodeObject:self->_signature forKey:@"signature"];
  [v5 encodeObject:self->_deadline forKey:@"deadline"];
  [v5 encodeObject:self->_installationID forKey:@"installationID"];
  [v5 encodeBool:self->_sendNotifications forKey:@"sendNotifications"];
  [v5 encodeInteger:self->_stopCondition forKey:@"stopCondition"];
  [v5 encodeInteger:self->_type forKey:@"requestType"];
}

- (NSString)installationID
{
  installationID = self->_installationID;
  if (installationID)
  {
    id v3 = installationID;
  }
  else
  {
    id v3 = +[SHRotatingInstallationID cachedInstallationForDays:31];
  }

  return v3;
}

- (BOOL)hasHitDeadline
{
  id v3 = [(SHMatcherRequest *)self deadline];

  if (!v3) {
    return 0;
  }
  id v4 = [MEMORY[0x263EFF910] date];
  id v5 = [(SHMatcherRequest *)self deadline];
  uint64_t v6 = [v4 laterDate:v5];
  BOOL v7 = v6 == v4;

  return v7;
}

- (double)watchdogTimeout
{
  id v3 = [(SHMatcherRequest *)self deadline];
  if (v3)
  {
    id v4 = [(SHMatcherRequest *)self deadline];
    [v4 timeIntervalSinceNow];
    double v6 = v5;
  }
  else
  {
    double v6 = 45.0;
  }

  return v6;
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (SHSignature)signature
{
  return self->_signature;
}

- (NSDate)deadline
{
  return self->_deadline;
}

- (BOOL)sendNotifications
{
  return self->_sendNotifications;
}

- (int64_t)stopCondition
{
  return self->_stopCondition;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deadline, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_installationID, 0);
}

@end