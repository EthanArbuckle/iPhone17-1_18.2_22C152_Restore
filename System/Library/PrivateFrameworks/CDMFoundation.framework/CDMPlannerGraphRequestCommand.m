@interface CDMPlannerGraphRequestCommand
+ (BOOL)supportsSecureCoding;
+ (Class)innerProtoType;
+ (id)innerProtoPropertyName;
+ (id)serviceGraphName;
- (CDMPlannerGraphRequestCommand)initWithCoder:(id)a3;
- (CDMPlannerGraphRequestCommand)initWithPlannerRequest:(id)a3;
- (SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest)plannerRequest;
- (SIRINLUEXTERNALRequestID)requestId;
- (id)loggingRequestID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CDMPlannerGraphRequestCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_plannerRequest, 0);
}

- (SIRINLUEXTERNALRequestID)requestId
{
  return self->_requestId;
}

- (SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest)plannerRequest
{
  return self->_plannerRequest;
}

- (id)loggingRequestID
{
  return self->_requestId;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CDMPlannerGraphRequestCommand;
  id v4 = a3;
  [(CDMServiceGraphProtoBackedCommand *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_plannerRequest, @"plannerRequest", v6.receiver, v6.super_class);
  v5 = [(SIRINLUEXTERNALRequestID *)self->_requestId data];
  [v4 encodeObject:v5 forKey:@"requestId"];
}

- (CDMPlannerGraphRequestCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CDMPlannerGraphRequestCommand;
  v5 = [(CDMServiceGraphProtoBackedCommand *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"plannerRequest"];
    plannerRequest = v5->_plannerRequest;
    v5->_plannerRequest = (SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestId"];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F71D18]) initWithData:v8];
    requestId = v5->_requestId;
    v5->_requestId = (SIRINLUEXTERNALRequestID *)v9;
  }
  return v5;
}

- (CDMPlannerGraphRequestCommand)initWithPlannerRequest:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CDMPlannerGraphRequestCommand;
  uint64_t v6 = [(CDMBaseCommand *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_plannerRequest, a3);
    v8 = (SIRINLUEXTERNALRequestID *)objc_alloc_init(MEMORY[0x263F71D18]);
    requestId = v7->_requestId;
    v7->_requestId = v8;

    v10 = [v5 cdmPlannerRequestIdentifier];
    v11 = [v10 clientRequestId];

    if (v11)
    {
      objc_super v12 = [v5 cdmPlannerRequestIdentifier];
      v13 = [v12 clientRequestId];
      [(SIRINLUEXTERNALRequestID *)v7->_requestId setIdA:v13];
    }
    else
    {
      v14 = [MEMORY[0x263F08C38] UUID];
      v15 = [v14 UUIDString];
      [(SIRINLUEXTERNALRequestID *)v7->_requestId setIdA:v15];

      objc_super v12 = CDMOSLoggerForCategory(0);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_6;
      }
      v13 = [(SIRINLUEXTERNALRequestID *)v7->_requestId idA];
      *(_DWORD *)buf = 136315394;
      v19 = "-[CDMPlannerGraphRequestCommand initWithPlannerRequest:]";
      __int16 v20 = 2112;
      v21 = v13;
      _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s The (orchestrator) client request Id was not provided. Generated clientRequestId with UUID string: %@", buf, 0x16u);
    }

LABEL_6:
  }

  return v7;
}

+ (id)serviceGraphName
{
  return @"CDMPlannerServiceGraph";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)innerProtoType
{
  return (Class)objc_opt_class();
}

+ (id)innerProtoPropertyName
{
  return @"plannerRequest";
}

@end