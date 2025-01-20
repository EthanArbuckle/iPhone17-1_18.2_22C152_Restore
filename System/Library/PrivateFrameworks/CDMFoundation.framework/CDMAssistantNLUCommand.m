@interface CDMAssistantNLUCommand
+ (BOOL)supportsSecureCoding;
+ (id)serviceGraphName;
- (CDMAssistantNLUCommand)initWithCoder:(id)a3;
- (CDMAssistantNLUCommand)initWithNLURequest:(id)a3 clientId:(id)a4;
- (CDMAssistantNLUCommand)initWithNLURequest:(id)a3 clientId:(id)a4 dataDispatcherContext:(id)a5;
- (NLXSchemaNLXClientEventMetadata)selfMetadata;
- (NSString)clientId;
- (SIRINLUEXTERNALCDMNluRequest)siriNLUTypeObj;
- (id)loggingRequestID;
- (void)setSelfMetadata:(id)a3;
@end

@implementation CDMAssistantNLUCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfMetadata, 0);
  objc_storeStrong((id *)&self->_siriNLUTypeObj, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
}

- (void)setSelfMetadata:(id)a3
{
}

- (NLXSchemaNLXClientEventMetadata)selfMetadata
{
  return self->_selfMetadata;
}

- (SIRINLUEXTERNALCDMNluRequest)siriNLUTypeObj
{
  return self->_siriNLUTypeObj;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (CDMAssistantNLUCommand)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CDMAssistantNLUCommand;
  return [(CDMBaseCommand *)&v4 init];
}

- (id)loggingRequestID
{
  return (id)[(SIRINLUEXTERNALCDMNluRequest *)self->_siriNLUTypeObj requestId];
}

- (CDMAssistantNLUCommand)initWithNLURequest:(id)a3 clientId:(id)a4 dataDispatcherContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CDMAssistantNLUCommand;
  v12 = [(CDMBaseCommand *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientId, a4);
    objc_storeStrong((id *)&v13->_siriNLUTypeObj, a3);
    v14 = (NLXSchemaNLXClientEventMetadata *)objc_alloc_init(MEMORY[0x263F6E600]);
    selfMetadata = v13->_selfMetadata;
    v13->_selfMetadata = v14;

    [(CDMServiceGraphCommand *)v13 setDataDispatcherContext:v11];
  }

  return v13;
}

- (CDMAssistantNLUCommand)initWithNLURequest:(id)a3 clientId:(id)a4
{
  return [(CDMAssistantNLUCommand *)self initWithNLURequest:a3 clientId:a4 dataDispatcherContext:0];
}

+ (id)serviceGraphName
{
  return @"CDMNLUServiceGraph";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end