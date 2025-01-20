@interface CDMGenericSendCommand
+ (BOOL)supportsSecureCoding;
- (CDMEmbeddingGraphResponseCommand)embeddingResponse;
- (CDMGenericSendCommand)initWithCDMNluResponse:(id)a3 clientId:(id)a4;
- (CDMGenericSendCommand)initWithCoder:(id)a3;
- (CDMGenericSendCommand)initWithEmbeddingGraphResponse:(id)a3;
- (CDMGenericSendCommand)initWithError:(id)a3 clientId:(id)a4;
- (CDMGenericSendCommand)initWithPlannerGraphResponse:(id)a3;
- (CDMGenericSendCommand)initWithPreprocessingWrapper:(id)a3 clientId:(id)a4;
- (CDMGenericSendCommand)initWithSsuInferenceGraphResponse:(id)a3;
- (CDMGenericSendCommand)initWithSubwordEmbeddingResponse:(id)a3 clientId:(id)a4;
- (CDMNluResponse)cdmNluResponse;
- (CDMPlannerGraphResponseCommand)plannerResponse;
- (CDMSsuInferenceGraphResponseCommand)ssuInferenceResponse;
- (NSString)clientId;
- (SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse)subwordEmbeddingResponse;
- (SIRINLUINTERNALPreprocessingWrapper)preprocessingWrapper;
- (SIRINLUResponse)nluResponse;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CDMGenericSendCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plannerResponse, 0);
  objc_storeStrong((id *)&self->_ssuInferenceResponse, 0);
  objc_storeStrong((id *)&self->_subwordEmbeddingResponse, 0);
  objc_storeStrong((id *)&self->_embeddingResponse, 0);
  objc_storeStrong((id *)&self->_preprocessingWrapper, 0);
  objc_storeStrong((id *)&self->_cdmNluResponse, 0);
  objc_storeStrong((id *)&self->_nluResponse, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
}

- (CDMPlannerGraphResponseCommand)plannerResponse
{
  return self->_plannerResponse;
}

- (CDMSsuInferenceGraphResponseCommand)ssuInferenceResponse
{
  return self->_ssuInferenceResponse;
}

- (SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse)subwordEmbeddingResponse
{
  return self->_subwordEmbeddingResponse;
}

- (CDMEmbeddingGraphResponseCommand)embeddingResponse
{
  return self->_embeddingResponse;
}

- (SIRINLUINTERNALPreprocessingWrapper)preprocessingWrapper
{
  return self->_preprocessingWrapper;
}

- (CDMNluResponse)cdmNluResponse
{
  return self->_cdmNluResponse;
}

- (SIRINLUResponse)nluResponse
{
  return self->_nluResponse;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)encodeWithCoder:(id)a3
{
  clientId = self->_clientId;
  id v5 = a3;
  [v5 encodeObject:clientId forKey:@"clientId"];
  [v5 encodeObject:self->_nluResponse forKey:@"nluResponse"];
  [v5 encodeObject:self->_cdmNluResponse forKey:@"cdmNluResponse"];
  [v5 encodeObject:self->_preprocessingWrapper forKey:@"preprocessingWrapper"];
  [v5 encodeObject:self->_embeddingResponse forKey:@"embeddingResponse"];
  [v5 encodeObject:self->_subwordEmbeddingResponse forKey:@"subwordEmbeddingResponse"];
  [v5 encodeObject:self->_ssuInferenceResponse forKey:@"ssuInferenceResponse"];
  [v5 encodeObject:self->_plannerResponse forKey:@"plannerResponse"];
}

- (CDMGenericSendCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CDMGenericSendCommand;
  id v5 = [(CDMBaseCommand *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientId"];
    clientId = v5->_clientId;
    v5->_clientId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nluResponse"];
    nluResponse = v5->_nluResponse;
    v5->_nluResponse = (SIRINLUResponse *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cdmNluResponse"];
    cdmNluResponse = v5->_cdmNluResponse;
    v5->_cdmNluResponse = (CDMNluResponse *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preprocessingWrapper"];
    preprocessingWrapper = v5->_preprocessingWrapper;
    v5->_preprocessingWrapper = (SIRINLUINTERNALPreprocessingWrapper *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"embeddingResponse"];
    embeddingResponse = v5->_embeddingResponse;
    v5->_embeddingResponse = (CDMEmbeddingGraphResponseCommand *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subwordEmbeddingResponse"];
    subwordEmbeddingResponse = v5->_subwordEmbeddingResponse;
    v5->_subwordEmbeddingResponse = (SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ssuInferenceResponse"];
    ssuInferenceResponse = v5->_ssuInferenceResponse;
    v5->_ssuInferenceResponse = (CDMSsuInferenceGraphResponseCommand *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"plannerResponse"];
    plannerResponse = v5->_plannerResponse;
    v5->_plannerResponse = (CDMPlannerGraphResponseCommand *)v20;
  }
  return v5;
}

- (CDMGenericSendCommand)initWithPreprocessingWrapper:(id)a3 clientId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMGenericSendCommand;
  v9 = [(CDMBaseCommand *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_preprocessingWrapper, a3);
    objc_storeStrong((id *)&v10->_clientId, a4);
  }

  return v10;
}

- (CDMGenericSendCommand)initWithError:(id)a3 clientId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CDMGenericSendCommand;
  id v8 = [(CDMBaseCommand *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CDMBaseCommand *)v8 setCmdError:v6];
    objc_storeStrong((id *)&v9->_clientId, a4);
  }

  return v9;
}

- (CDMGenericSendCommand)initWithPlannerGraphResponse:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMGenericSendCommand;
  id v6 = [(CDMBaseCommand *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_plannerResponse, a3);
  }

  return v7;
}

- (CDMGenericSendCommand)initWithSsuInferenceGraphResponse:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMGenericSendCommand;
  id v6 = [(CDMBaseCommand *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ssuInferenceResponse, a3);
  }

  return v7;
}

- (CDMGenericSendCommand)initWithSubwordEmbeddingResponse:(id)a3 clientId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMGenericSendCommand;
  objc_super v9 = [(CDMBaseCommand *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subwordEmbeddingResponse, a3);
    objc_storeStrong((id *)&v10->_clientId, a4);
  }

  return v10;
}

- (CDMGenericSendCommand)initWithEmbeddingGraphResponse:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMGenericSendCommand;
  id v6 = [(CDMBaseCommand *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_embeddingResponse, a3);
  }

  return v7;
}

- (CDMGenericSendCommand)initWithCDMNluResponse:(id)a3 clientId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CDMGenericSendCommand;
  objc_super v9 = [(CDMBaseCommand *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cdmNluResponse, a3);
    objc_storeStrong((id *)&v10->_clientId, a4);
    objc_super v11 = (void *)MEMORY[0x263F71F70];
    objc_super v12 = [v7 objcProto];
    uint64_t v13 = [v11 convertResponse:v12];
    nluResponse = v10->_nluResponse;
    v10->_nluResponse = (SIRINLUResponse *)v13;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end