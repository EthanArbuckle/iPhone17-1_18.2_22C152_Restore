@interface CDMSpanMatcherRequestCommand
- (CDMSpanMatcherRequestCommand)initWithRequest:(id)a3;
- (CDMSpanMatcherRequestCommand)initWithRequests:(id)a3;
- (CDMSpanMatcherRequestCommand)initWithRequests:(id)a3 asrHypothesis:(id)a4;
- (CDMSpanMatcherRequestCommand)initWithRequests:(id)a3 asrHypothesis:(id)a4 selfMetadata:(id)a5;
- (CDMSpanMatcherRequestCommand)initWithRequests:(id)a3 selfMetadata:(id)a4;
- (NLXSchemaNLXClientEventMetadata)selfMetadata;
- (NSArray)asrHypothesis;
- (NSArray)spanMatchRequests;
- (void)setAsrHypothesis:(id)a3;
- (void)setSelfMetadata:(id)a3;
- (void)setSpanMatchRequests:(id)a3;
@end

@implementation CDMSpanMatcherRequestCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfMetadata, 0);
  objc_storeStrong((id *)&self->_asrHypothesis, 0);
  objc_storeStrong((id *)&self->_spanMatchRequests, 0);
}

- (void)setSelfMetadata:(id)a3
{
}

- (NLXSchemaNLXClientEventMetadata)selfMetadata
{
  return self->_selfMetadata;
}

- (void)setAsrHypothesis:(id)a3
{
}

- (NSArray)asrHypothesis
{
  return self->_asrHypothesis;
}

- (void)setSpanMatchRequests:(id)a3
{
}

- (NSArray)spanMatchRequests
{
  return self->_spanMatchRequests;
}

- (CDMSpanMatcherRequestCommand)initWithRequests:(id)a3 asrHypothesis:(id)a4 selfMetadata:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CDMSpanMatcherRequestCommand;
  v12 = [(CDMBaseCommand *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_spanMatchRequests, a3);
    objc_storeStrong((id *)&v13->_asrHypothesis, a4);
    objc_storeStrong((id *)&v13->_selfMetadata, a5);
  }

  return v13;
}

- (CDMSpanMatcherRequestCommand)initWithRequests:(id)a3 selfMetadata:(id)a4
{
  v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 array];
  id v10 = [(CDMSpanMatcherRequestCommand *)self initWithRequests:v8 asrHypothesis:v9 selfMetadata:v7];

  return v10;
}

- (CDMSpanMatcherRequestCommand)initWithRequests:(id)a3 asrHypothesis:(id)a4
{
  return [(CDMSpanMatcherRequestCommand *)self initWithRequests:a3 asrHypothesis:a4 selfMetadata:0];
}

- (CDMSpanMatcherRequestCommand)initWithRequests:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  v6 = [v4 array];
  id v7 = [(CDMSpanMatcherRequestCommand *)self initWithRequests:v5 asrHypothesis:v6 selfMetadata:0];

  return v7;
}

- (CDMSpanMatcherRequestCommand)initWithRequest:(id)a3
{
  v4 = [MEMORY[0x263EFF8C0] arrayWithObject:a3];
  id v5 = [(CDMSpanMatcherRequestCommand *)self initWithRequests:v4];

  return v5;
}

@end