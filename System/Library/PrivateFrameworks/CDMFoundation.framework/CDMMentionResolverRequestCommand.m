@interface CDMMentionResolverRequestCommand
- (CDMMentionResolverRequestCommand)initWithMRRequest:(id)a3;
- (SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest)mrRequest;
- (id)description;
@end

@implementation CDMMentionResolverRequestCommand

- (void).cxx_destruct
{
}

- (SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest)mrRequest
{
  return self->_mrRequest;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
  v4 = [(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)self->_mrRequest dictionaryRepresentation];
  v5 = (void *)[v3 initWithDictionary:v4];

  [v5 removeObjectForKey:@"embedding_tensor"];
  [v5 removeObjectForKey:@"matching_spans"];
  v6 = [v5 description];

  return v6;
}

- (CDMMentionResolverRequestCommand)initWithMRRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMMentionResolverRequestCommand;
  v6 = [(CDMBaseCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mrRequest, a3);
  }

  return v7;
}

@end