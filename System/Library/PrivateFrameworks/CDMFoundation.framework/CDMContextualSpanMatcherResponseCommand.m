@interface CDMContextualSpanMatcherResponseCommand
- (CDMContextualSpanMatcherResponseCommand)initWithContextualSpanMatcherResponse:(id)a3;
- (CDMContextualSpanMatcherResponseCommand)initWithMentions:(id)a3;
- (SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherResponse)contextualSpanMatcherResponse;
@end

@implementation CDMContextualSpanMatcherResponseCommand

- (void).cxx_destruct
{
}

- (SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherResponse)contextualSpanMatcherResponse
{
  return self->_contextualSpanMatcherResponse;
}

- (CDMContextualSpanMatcherResponseCommand)initWithMentions:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CDMContextualSpanMatcherResponseCommand;
  v5 = [(CDMBaseCommand *)&v17 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F71DE0]);
    objc_storeStrong((id *)&v5->_contextualSpanMatcherResponse, v6);
    if (v4)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(v6, "addContextualSpans:", *(void *)(*((void *)&v13 + 1) + 8 * v11++), (void)v13);
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
        }
        while (v9);
      }
    }
  }

  return v5;
}

- (CDMContextualSpanMatcherResponseCommand)initWithContextualSpanMatcherResponse:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMContextualSpanMatcherResponseCommand;
  id v6 = [(CDMBaseCommand *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contextualSpanMatcherResponse, a3);
  }

  return v7;
}

@end