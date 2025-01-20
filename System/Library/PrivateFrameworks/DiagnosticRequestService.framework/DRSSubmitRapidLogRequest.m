@interface DRSSubmitRapidLogRequest
+ (Class)_moClass;
+ (id)entityName;
- (BOOL)isEqualToRequest:(id)a3;
- (DRSSubmitRapidLogRequest)initWithXPCDict:(id)a3;
- (NSData)cfReplyPayload;
- (NSNumber)cfDidSucceed;
- (NSString)cfFailureReason;
- (id)_initWithSubmitRapidLogRequestMO_ON_MOC_QUEUE:(id)a3;
- (id)debugDescription;
- (id)jsonCompatibleDictionaryRepresentationVerbose:(BOOL)a3;
- (id)requestType;
- (id)targetContainerName;
- (unint64_t)expectedType;
- (unint64_t)logSizeLimitBytes;
- (void)_configureRequestMO:(id)a3;
- (void)setCfDidSucceed:(id)a3;
- (void)setCfFailureReason:(id)a3;
- (void)setCfReplyPayload:(id)a3;
@end

@implementation DRSSubmitRapidLogRequest

+ (Class)_moClass
{
  return (Class)objc_opt_class();
}

+ (id)entityName
{
  return @"DRSSubmitRapidLogRequestMO";
}

- (unint64_t)expectedType
{
  return 5;
}

- (id)_initWithSubmitRapidLogRequestMO_ON_MOC_QUEUE:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DRSSubmitRapidLogRequest;
  v5 = [(DRSSubmitLogRequest *)&v13 _initWithSubmitLogRequestMO_ON_MOC_QUEUE:v4];
  if (v5)
  {
    uint64_t v6 = [v4 cfDidSucceed];
    v7 = (void *)v5[18];
    v5[18] = v6;

    uint64_t v8 = [v4 cfFailureReason];
    v9 = (void *)v5[19];
    v5[19] = v8;

    uint64_t v10 = [v4 cfReplyPayload];
    v11 = (void *)v5[20];
    v5[20] = v10;
  }
  return v5;
}

- (id)requestType
{
  return @"SubmitRapidLog";
}

- (id)targetContainerName
{
  return 0;
}

- (DRSSubmitRapidLogRequest)initWithXPCDict:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DRSSubmitRapidLogRequest;
  v3 = [(DRSRequest *)&v6 initWithXPCDict:a3];
  id v4 = v3;
  if (v3) {
    [(DRSRequest *)v3 setDecisionServerDecision:2];
  }
  return v4;
}

- (unint64_t)logSizeLimitBytes
{
  return 104857600;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)DRSSubmitRapidLogRequest;
  if ([(DRSSubmitLogRequest *)&v31 isEqualToRequest:v4])
  {
    id v5 = v4;
    objc_super v6 = [(DRSSubmitRapidLogRequest *)self cfDidSucceed];
    v7 = [v5 cfDidSucceed];
    char IsNil = _oneIsNil((uint64_t)v6, (uint64_t)v7);

    if (IsNil) {
      goto LABEL_9;
    }
    uint64_t v9 = [(DRSSubmitRapidLogRequest *)self cfDidSucceed];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      v11 = [(DRSSubmitRapidLogRequest *)self cfDidSucceed];
      v12 = [v5 cfDidSucceed];
      int v13 = [v11 isEqualToNumber:v12];

      if (!v13) {
        goto LABEL_9;
      }
    }
    v14 = [(DRSSubmitRapidLogRequest *)self cfFailureReason];
    v15 = [v5 cfFailureReason];
    char v16 = _oneIsNil((uint64_t)v14, (uint64_t)v15);

    if (v16) {
      goto LABEL_9;
    }
    uint64_t v17 = [(DRSSubmitRapidLogRequest *)self cfFailureReason];
    if (v17)
    {
      v18 = (void *)v17;
      v19 = [(DRSSubmitRapidLogRequest *)self cfFailureReason];
      v20 = [v5 cfFailureReason];
      int v21 = [v19 isEqualToString:v20];

      if (!v21) {
        goto LABEL_9;
      }
    }
    v22 = [(DRSSubmitRapidLogRequest *)self cfReplyPayload];
    v23 = [v5 cfReplyPayload];
    char v24 = _oneIsNil((uint64_t)v22, (uint64_t)v23);

    if (v24)
    {
LABEL_9:
      char v25 = 0;
    }
    else
    {
      uint64_t v27 = [(DRSSubmitRapidLogRequest *)self cfReplyPayload];
      if (v27)
      {
        v28 = (void *)v27;
        v29 = [(DRSSubmitRapidLogRequest *)self cfReplyPayload];
        v30 = [v5 cfReplyPayload];
        char v25 = [v29 isEqualToData:v30];
      }
      else
      {
        char v25 = 1;
      }
    }
  }
  else
  {
    char v25 = 0;
  }

  return v25;
}

- (id)jsonCompatibleDictionaryRepresentationVerbose:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)MEMORY[0x21050DCE0](self, a2);
  v15.receiver = self;
  v15.super_class = (Class)DRSSubmitRapidLogRequest;
  objc_super v6 = [(DRSRequest *)&v15 jsonCompatibleDictionaryRepresentationVerbose:v3];
  v7 = [(DRSSubmitRapidLogRequest *)self cfDidSucceed];

  if (v7)
  {
    uint64_t v8 = [(DRSSubmitRapidLogRequest *)self cfDidSucceed];
    [v6 setObject:v8 forKeyedSubscript:@"cfDidSucceed"];

    uint64_t v9 = [(DRSSubmitRapidLogRequest *)self cfFailureReason];

    if (v9)
    {
      uint64_t v10 = [(DRSSubmitRapidLogRequest *)self cfFailureReason];
      [v6 setObject:v10 forKeyedSubscript:@"cfFailureReason"];
    }
    v11 = [(DRSSubmitRapidLogRequest *)self cfReplyPayload];

    if (v11)
    {
      v12 = [(DRSSubmitRapidLogRequest *)self cfReplyPayload];
      int v13 = [v12 base64EncodedStringWithOptions:0];
      [v6 setObject:v13 forKeyedSubscript:@"cfReplyPayload"];
    }
  }

  return v6;
}

- (id)debugDescription
{
  BOOL v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)DRSSubmitRapidLogRequest;
  id v4 = [(DRSRequest *)&v13 debugDescription];
  id v5 = [(DRSSubmitRapidLogRequest *)self cfDidSucceed];
  if (v5)
  {
    objc_super v6 = [(DRSSubmitRapidLogRequest *)self cfDidSucceed];
  }
  else
  {
    objc_super v6 = @"-";
  }
  v7 = [(DRSSubmitRapidLogRequest *)self cfFailureReason];
  if (v7)
  {
    uint64_t v8 = [(DRSSubmitRapidLogRequest *)self cfFailureReason];
  }
  else
  {
    uint64_t v8 = @"-";
  }
  uint64_t v9 = [(DRSSubmitRapidLogRequest *)self cfReplyPayload];
  if (v9)
  {
    uint64_t v10 = [(DRSSubmitRapidLogRequest *)self cfReplyPayload];
    v11 = [v3 stringWithFormat:@"%@ %@ %@ %@", v4, v6, v8, v10];
  }
  else
  {
    v11 = [v3 stringWithFormat:@"%@ %@ %@ %@", v4, v6, v8, @"-"];
  }

  if (v7) {
  if (v5)
  }

  return v11;
}

- (void)_configureRequestMO:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DRSSubmitRapidLogRequest;
  [(DRSSubmitLogRequest *)&v9 _configureRequestMO:v4];
  id v5 = v4;
  objc_super v6 = [(DRSSubmitRapidLogRequest *)self cfDidSucceed];
  [v5 setCfDidSucceed:v6];

  v7 = [(DRSSubmitRapidLogRequest *)self cfFailureReason];
  [v5 setCfFailureReason:v7];

  uint64_t v8 = [(DRSSubmitRapidLogRequest *)self cfReplyPayload];
  [v5 setCfReplyPayload:v8];
}

- (NSNumber)cfDidSucceed
{
  return self->_cfDidSucceed;
}

- (void)setCfDidSucceed:(id)a3
{
}

- (NSString)cfFailureReason
{
  return self->_cfFailureReason;
}

- (void)setCfFailureReason:(id)a3
{
}

- (NSData)cfReplyPayload
{
  return self->_cfReplyPayload;
}

- (void)setCfReplyPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cfReplyPayload, 0);
  objc_storeStrong((id *)&self->_cfFailureReason, 0);

  objc_storeStrong((id *)&self->_cfDidSucceed, 0);
}

@end