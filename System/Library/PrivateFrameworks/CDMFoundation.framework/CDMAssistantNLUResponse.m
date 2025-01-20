@interface CDMAssistantNLUResponse
+ (BOOL)supportsSecureCoding;
+ (id)serviceGraphName;
- (CDMAssistantNLUResponse)initWithCoder:(id)a3;
- (CDMAssistantNLUResponse)initWithNLUResponse:(id)a3 preprocessingWrapper:(id)a4 requestId:(id)a5;
- (CDMAssistantNLUResponse)initWithNLUResponse:(id)a3 requestId:(id)a4;
- (NSString)requestId;
- (SIRINLUEXTERNALCDMNluResponse)siriNLUTypeObj;
- (SIRINLUINTERNALPreprocessingWrapper)preprocessingWrapper;
@end

@implementation CDMAssistantNLUResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preprocessingWrapper, 0);
  objc_storeStrong((id *)&self->_siriNLUTypeObj, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

- (SIRINLUINTERNALPreprocessingWrapper)preprocessingWrapper
{
  return self->_preprocessingWrapper;
}

- (SIRINLUEXTERNALCDMNluResponse)siriNLUTypeObj
{
  return self->_siriNLUTypeObj;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (CDMAssistantNLUResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CDMAssistantNLUResponse;
  return [(CDMBaseCommand *)&v4 init];
}

- (CDMAssistantNLUResponse)initWithNLUResponse:(id)a3 preprocessingWrapper:(id)a4 requestId:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CDMAssistantNLUResponse;
  v12 = [(CDMBaseCommand *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestId, a5);
    objc_storeStrong((id *)&v13->_siriNLUTypeObj, a3);
    objc_storeStrong((id *)&v13->_preprocessingWrapper, a4);
  }

  return v13;
}

- (CDMAssistantNLUResponse)initWithNLUResponse:(id)a3 requestId:(id)a4
{
  return [(CDMAssistantNLUResponse *)self initWithNLUResponse:a3 preprocessingWrapper:0 requestId:a4];
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