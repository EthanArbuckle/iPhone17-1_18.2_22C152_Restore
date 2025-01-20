@interface CDMMentionResolverResponseCommand
- (CDMMentionResolverResponseCommand)initWithMentions:(id)a3;
- (CDMMentionResolverResponseCommand)initWithResponse:(id)a3;
- (SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse)response;
@end

@implementation CDMMentionResolverResponseCommand

- (void).cxx_destruct
{
}

- (SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse)response
{
  return self->_response;
}

- (CDMMentionResolverResponseCommand)initWithMentions:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CDMMentionResolverResponseCommand;
  v5 = [(CDMBaseCommand *)&v18 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F71E50]);
    if (v4)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(v6, "addMentions:", *(void *)(*((void *)&v14 + 1) + 8 * v11++), (void)v14);
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
        }
        while (v9);
      }
    }
    response = v5->_response;
    v5->_response = (SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse *)v6;
  }
  return v5;
}

- (CDMMentionResolverResponseCommand)initWithResponse:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMMentionResolverResponseCommand;
  v5 = [(CDMBaseCommand *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    response = v5->_response;
    v5->_response = (SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse *)v6;
  }
  return v5;
}

@end