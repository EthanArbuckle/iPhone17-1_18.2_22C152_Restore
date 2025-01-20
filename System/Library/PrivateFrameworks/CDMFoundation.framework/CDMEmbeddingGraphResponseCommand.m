@interface CDMEmbeddingGraphResponseCommand
+ (BOOL)supportsSecureCoding;
+ (id)serviceGraphName;
- (CDMEmbeddingGraphResponseCommand)initWithCoder:(id)a3;
- (CDMEmbeddingGraphResponseCommand)initWithEmbeddingProtoResponseCommand:(id)a3;
- (CDMEmbeddingProtoResponseCommand)embeddingProtoResponseCommand;
- (id)convertResponseToSubwordResponse;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CDMEmbeddingGraphResponseCommand

- (void).cxx_destruct
{
}

- (CDMEmbeddingProtoResponseCommand)embeddingProtoResponseCommand
{
  return self->_embeddingProtoResponseCommand;
}

- (id)convertResponseToSubwordResponse
{
  v2 = (void *)MEMORY[0x263F71F60];
  v3 = [(CDMEmbeddingGraphResponseCommand *)self embeddingProtoResponseCommand];
  v4 = [v3 response];
  v5 = [v2 convertToSubwordEmbeddingResponse:v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CDMEmbeddingGraphResponseCommand;
  [(CDMServiceGraphCommand *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_embeddingProtoResponseCommand forKey:@"embeddingProtoResponseCommand"];
}

- (CDMEmbeddingGraphResponseCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMEmbeddingGraphResponseCommand;
  objc_super v5 = [(CDMServiceGraphCommand *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"embeddingProtoResponseCommand"];
    embeddingProtoResponseCommand = v5->_embeddingProtoResponseCommand;
    v5->_embeddingProtoResponseCommand = (CDMEmbeddingProtoResponseCommand *)v6;
  }
  return v5;
}

- (CDMEmbeddingGraphResponseCommand)initWithEmbeddingProtoResponseCommand:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMEmbeddingGraphResponseCommand;
  uint64_t v6 = [(CDMBaseCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_embeddingProtoResponseCommand, a3);
  }

  return v7;
}

+ (id)serviceGraphName
{
  return @"CDMEmbeddingServiceGraph";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end