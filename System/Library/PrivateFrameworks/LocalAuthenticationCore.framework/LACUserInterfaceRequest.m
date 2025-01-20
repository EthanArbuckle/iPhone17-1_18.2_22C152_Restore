@interface LACUserInterfaceRequest
+ (BOOL)supportsSecureCoding;
+ (id)unknownInstance;
- (BOOL)isAuditTokenApplicationIdentity;
- (BOOL)isForSiri;
- (BOOL)isForSoftwareUpdate;
- (LACClientInfo)clientInfo;
- (LACUserInterfaceRequest)init;
- (LACUserInterfaceRequest)initWithCoder:(id)a3;
- (LACUserInterfaceRequest)initWithIdentifier:(int64_t)a3;
- (LACUserInterfaceRequest)initWithIdentifier:(int64_t)a3 evaluationRequest:(id)a4;
- (LACUserInterfaceRequest)initWithIdentifier:(int64_t)a3 evaluationRequest:(id)a4 contextID:(id)a5;
- (NSData)clientAuditTokenData;
- (NSString)description;
- (NSUUID)contextID;
- (int)clientProcessId;
- (unsigned)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setClientAuditTokenData:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setClientProcessId:(int)a3;
- (void)setContextID:(id)a3;
- (void)setIdentifier:(unsigned int)a3;
- (void)setIsAuditTokenApplicationIdentity:(BOOL)a3;
- (void)setIsForSiri:(BOOL)a3;
- (void)setIsForSoftwareUpdate:(BOOL)a3;
@end

@implementation LACUserInterfaceRequest

- (LACUserInterfaceRequest)init
{
  return [(LACUserInterfaceRequest *)self initWithIdentifier:0];
}

- (LACUserInterfaceRequest)initWithIdentifier:(int64_t)a3
{
  return [(LACUserInterfaceRequest *)self initWithIdentifier:a3 evaluationRequest:0 contextID:0];
}

- (LACUserInterfaceRequest)initWithIdentifier:(int64_t)a3 evaluationRequest:(id)a4
{
  return [(LACUserInterfaceRequest *)self initWithIdentifier:a3 evaluationRequest:a4 contextID:0];
}

- (LACUserInterfaceRequest)initWithIdentifier:(int64_t)a3 evaluationRequest:(id)a4 contextID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)LACUserInterfaceRequest;
  v10 = [(LACUserInterfaceRequest *)&v25 init];
  v11 = v10;
  if (v10)
  {
    [(LACUserInterfaceRequest *)v10 setIdentifier:a3];
    [(LACUserInterfaceRequest *)v11 setContextID:v9];
    v12 = [v8 client];
    v13 = [v8 options];
    v14 = +[LACClientInfoProvider infoForXPCClient:v12 evaluationOptions:v13];
    [(LACUserInterfaceRequest *)v11 setClientInfo:v14];

    v15 = [v8 payload];
    v16 = [v15 objectForKeyedSubscript:@"kLACEvaluationRequestPayloadKeyInternalInfo"];

    v17 = [v8 options];
    v18 = [NSNumber numberWithInteger:1080];
    v19 = [v17 objectForKeyedSubscript:v18];

    if (v19) {
      char v20 = [v19 integerValue];
    }
    else {
      char v20 = 3;
    }
    if ((v20 & 2) != 0)
    {
      v21 = [v16 objectForKeyedSubscript:@"AuditToken"];
      [(LACUserInterfaceRequest *)v11 setClientAuditTokenData:v21];
    }
    else
    {
      [(LACUserInterfaceRequest *)v11 setClientAuditTokenData:0];
    }
    v22 = [v16 objectForKeyedSubscript:@"ProcessId"];
    -[LACUserInterfaceRequest setClientProcessId:](v11, "setClientProcessId:", [v22 intValue]);

    [(LACUserInterfaceRequest *)v11 setIsAuditTokenApplicationIdentity:(v20 & 4) != 0];
    v23 = [v16 objectForKeyedSubscript:@"SiriPlugin"];
    -[LACUserInterfaceRequest setIsForSiri:](v11, "setIsForSiri:", [v23 BOOLValue]);

    -[LACUserInterfaceRequest setIsForSoftwareUpdate:](v11, "setIsForSoftwareUpdate:", [v8 policy] == 1010);
  }

  return v11;
}

+ (id)unknownInstance
{
  v2 = objc_alloc_init(LACUserInterfaceRequest);
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(LACUserInterfaceRequest *)self identifier];
  v6 = NSStringFromSelector(sel_identifier);
  [v4 encodeInteger:v5 forKey:v6];

  v7 = [(LACUserInterfaceRequest *)self contextID];
  id v8 = NSStringFromSelector(sel_contextID);
  [v4 encodeObject:v7 forKey:v8];

  id v9 = [(LACUserInterfaceRequest *)self clientAuditTokenData];
  v10 = NSStringFromSelector(sel_clientAuditTokenData);
  [v4 encodeObject:v9 forKey:v10];

  v11 = [(LACUserInterfaceRequest *)self clientInfo];
  v12 = NSStringFromSelector(sel_clientInfo);
  [v4 encodeObject:v11 forKey:v12];

  uint64_t v13 = [(LACUserInterfaceRequest *)self clientProcessId];
  v14 = NSStringFromSelector(sel_clientProcessId);
  [v4 encodeInt:v13 forKey:v14];

  BOOL v15 = [(LACUserInterfaceRequest *)self isAuditTokenApplicationIdentity];
  v16 = NSStringFromSelector(sel_isAuditTokenApplicationIdentity);
  [v4 encodeBool:v15 forKey:v16];

  BOOL v17 = [(LACUserInterfaceRequest *)self isForSiri];
  v18 = NSStringFromSelector(sel_isForSiri);
  [v4 encodeBool:v17 forKey:v18];

  BOOL v19 = [(LACUserInterfaceRequest *)self isForSoftwareUpdate];
  NSStringFromSelector(sel_isForSoftwareUpdate);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v19 forKey:v20];
}

- (LACUserInterfaceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(LACUserInterfaceRequest *)self init];
  v6 = NSStringFromSelector(sel_identifier);
  -[LACUserInterfaceRequest setIdentifier:](v5, "setIdentifier:", [v4 decodeIntegerForKey:v6]);

  uint64_t v7 = objc_opt_class();
  id v8 = NSStringFromSelector(sel_contextID);
  id v9 = [v4 decodeObjectOfClass:v7 forKey:v8];
  [(LACUserInterfaceRequest *)v5 setContextID:v9];

  uint64_t v10 = objc_opt_class();
  v11 = NSStringFromSelector(sel_clientAuditTokenData);
  v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
  [(LACUserInterfaceRequest *)v5 setClientAuditTokenData:v12];

  uint64_t v13 = objc_opt_class();
  v14 = NSStringFromSelector(sel_clientInfo);
  BOOL v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
  [(LACUserInterfaceRequest *)v5 setClientInfo:v15];

  v16 = NSStringFromSelector(sel_clientProcessId);
  -[LACUserInterfaceRequest setClientProcessId:](v5, "setClientProcessId:", [v4 decodeIntForKey:v16]);

  BOOL v17 = NSStringFromSelector(sel_isAuditTokenApplicationIdentity);
  -[LACUserInterfaceRequest setIsAuditTokenApplicationIdentity:](v5, "setIsAuditTokenApplicationIdentity:", [v4 decodeBoolForKey:v17]);

  v18 = NSStringFromSelector(sel_isForSiri);
  -[LACUserInterfaceRequest setIsForSiri:](v5, "setIsForSiri:", [v4 decodeBoolForKey:v18]);

  BOOL v19 = NSStringFromSelector(sel_isForSoftwareUpdate);
  uint64_t v20 = [v4 decodeBoolForKey:v19];

  [(LACUserInterfaceRequest *)v5 setIsForSoftwareUpdate:v20];
  return v5;
}

- (NSString)description
{
  v37[8] = *MEMORY[0x263EF8340];
  v32 = NSString;
  uint64_t v31 = objc_opt_class();
  v3 = NSString;
  v36 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LACUserInterfaceRequest identifier](self, "identifier"));
  v35 = [v3 stringWithFormat:@"identifier: %@", v36];
  v37[0] = v35;
  id v4 = NSString;
  uint64_t v5 = [(LACUserInterfaceRequest *)self contextID];
  v34 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x263EFF9D0] null];
  }
  objc_super v25 = (void *)v5;
  v33 = [v4 stringWithFormat:@"contextID: %@", v5];
  v37[1] = v33;
  v6 = NSString;
  uint64_t v7 = [(LACUserInterfaceRequest *)self clientAuditTokenData];
  id v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x263EFF9D0] null];
  }
  v24 = (void *)v7;
  v30 = [v6 stringWithFormat:@"clientAuditTokenData: %@", v7];
  v37[2] = v30;
  id v9 = NSString;
  v29 = [(LACUserInterfaceRequest *)self clientInfo];
  v28 = [v9 stringWithFormat:@"clientInfo: %@", v29];
  v37[3] = v28;
  uint64_t v10 = NSString;
  v27 = objc_msgSend(NSNumber, "numberWithInt:", -[LACUserInterfaceRequest clientProcessId](self, "clientProcessId"));
  v26 = [v10 stringWithFormat:@"clientProcessId: %@", v27];
  v37[4] = v26;
  v11 = NSString;
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[LACUserInterfaceRequest isAuditTokenApplicationIdentity](self, "isAuditTokenApplicationIdentity"));
  uint64_t v13 = [v11 stringWithFormat:@"isAuditTokenApplicationIdentity: %@", v12];
  v37[5] = v13;
  v14 = NSString;
  BOOL v15 = objc_msgSend(NSNumber, "numberWithBool:", -[LACUserInterfaceRequest isForSiri](self, "isForSiri"));
  v16 = [v14 stringWithFormat:@"isForSiri: %@", v15];
  v37[6] = v16;
  BOOL v17 = NSString;
  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[LACUserInterfaceRequest isForSoftwareUpdate](self, "isForSoftwareUpdate"));
  BOOL v19 = [v17 stringWithFormat:@"isForSoftwareUpdate: %@", v18];
  v37[7] = v19;
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:8];
  v21 = [v20 componentsJoinedByString:@"; "];
  v22 = [v32 stringWithFormat:@"<%@ %p; %@>", v31, self, v21];

  if (!v8) {
  if (!v34)
  }

  return (NSString *)v22;
}

- (NSData)clientAuditTokenData
{
  return self->_clientAuditTokenData;
}

- (void)setClientAuditTokenData:(id)a3
{
}

- (LACClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (int)clientProcessId
{
  return self->_clientProcessId;
}

- (void)setClientProcessId:(int)a3
{
  self->_clientProcessId = a3;
}

- (BOOL)isAuditTokenApplicationIdentity
{
  return self->_isAuditTokenApplicationIdentity;
}

- (void)setIsAuditTokenApplicationIdentity:(BOOL)a3
{
  self->_isAuditTokenApplicationIdentity = a3;
}

- (BOOL)isForSiri
{
  return self->_isForSiri;
}

- (void)setIsForSiri:(BOOL)a3
{
  self->_isForSiri = a3;
}

- (BOOL)isForSoftwareUpdate
{
  return self->_isForSoftwareUpdate;
}

- (void)setIsForSoftwareUpdate:(BOOL)a3
{
  self->_isForSoftwareUpdate = a3;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  self->_identifier = a3;
}

- (NSUUID)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientAuditTokenData, 0);
}

@end