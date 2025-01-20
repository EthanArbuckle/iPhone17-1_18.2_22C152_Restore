@interface CDMEmbeddingProtoResponseCommand
+ (BOOL)supportsSecureCoding;
- (CDMEmbeddingConfigs)embeddingConfigs;
- (CDMEmbeddingProtoResponseCommand)initWithCoder:(id)a3;
- (CDMEmbeddingProtoResponseCommand)initWithResponse:(id)a3 embeddingConfigs:(id)a4;
- (SIRINLUINTERNALEMBEDDINGEmbeddingResponse)response;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation CDMEmbeddingProtoResponseCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingConfigs, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

- (CDMEmbeddingConfigs)embeddingConfigs
{
  return self->_embeddingConfigs;
}

- (void)setResponse:(id)a3
{
}

- (SIRINLUINTERNALEMBEDDINGEmbeddingResponse)response
{
  return self->_response;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CDMEmbeddingProtoResponseCommand;
  id v4 = a3;
  [(CDMBaseCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_response, @"response", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_embeddingConfigs forKey:@"embeddingConfigs"];
}

- (CDMEmbeddingProtoResponseCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDMEmbeddingProtoResponseCommand;
  objc_super v5 = [(CDMBaseCommand *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"response"];
    response = v5->_response;
    v5->_response = (SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"embeddingConfigs"];
    embeddingConfigs = v5->_embeddingConfigs;
    v5->_embeddingConfigs = (CDMEmbeddingConfigs *)v8;
  }
  return v5;
}

- (id)description
{
  v2 = [(CDMEmbeddingProtoResponseCommand *)self dictionaryRepresentation];
  v3 = [v2 description];

  return v3;
}

- (id)dictionaryRepresentation
{
  v2 = self;
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v3 = 24;
  uint64_t v4 = [(SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)self->_response embeddingTensorOutputs];
  if (v4
    && (objc_super v5 = (void *)v4,
        [(SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)v2->_response embeddingTensorOutputs],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v5,
        v7))
  {
    id v8 = objc_alloc(MEMORY[0x263EFF9A0]);
    v9 = [(SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)v2->_response embeddingTensorOutputs];
    id v23 = (id)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [(SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)v2->_response embeddingTensorOutputs];
    uint64_t v24 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v24)
    {
      uint64_t v22 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(obj);
          }
          objc_super v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v29[0] = @"numTokens";
          v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)((char *)&v2->super.super.isa + v3), "numToken"));
          v30[0] = v12;
          v29[1] = @"embeddingDim";
          uint64_t v13 = v3;
          v14 = v2;
          v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "embeddingDim"));
          v30[1] = v15;
          v29[2] = @"isStableModel";
          v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "isStableEmbeddingsVersion"));
          v30[2] = v16;
          v29[3] = @"embeddingVersion";
          v17 = [v11 embeddingVersion];
          v30[3] = v17;
          v18 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:4];
          v19 = [v11 embeddingVersion];
          [v23 setObject:v18 forKeyedSubscript:v19];

          v2 = v14;
          uint64_t v3 = v13;
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v24);
    }
  }
  else
  {
    id v23 = 0;
  }
  return v23;
}

- (CDMEmbeddingProtoResponseCommand)initWithResponse:(id)a3 embeddingConfigs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMEmbeddingProtoResponseCommand;
  v9 = [(CDMBaseCommand *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_response, a3);
    objc_storeStrong((id *)&v10->_embeddingConfigs, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end