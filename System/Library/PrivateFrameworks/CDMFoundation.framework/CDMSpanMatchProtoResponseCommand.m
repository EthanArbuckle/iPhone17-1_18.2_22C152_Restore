@interface CDMSpanMatchProtoResponseCommand
- (CDMSpanMatchProtoResponseCommand)initWithResponse:(id)a3;
- (NSArray)matchingSpansForExternalParsers;
- (NSArray)matchingSpansForNL;
- (SIRINLUINTERNALSPANMATCHSpanMatchResponse)spanMatchResponse;
- (id)description;
- (void)setSpanMatchResponse:(id)a3;
@end

@implementation CDMSpanMatchProtoResponseCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingSpansForNL, 0);
  objc_storeStrong((id *)&self->_matchingSpansForExternalParsers, 0);
  objc_storeStrong((id *)&self->_spanMatchResponse, 0);
}

- (NSArray)matchingSpansForNL
{
  return self->_matchingSpansForNL;
}

- (NSArray)matchingSpansForExternalParsers
{
  return self->_matchingSpansForExternalParsers;
}

- (void)setSpanMatchResponse:(id)a3
{
}

- (SIRINLUINTERNALSPANMATCHSpanMatchResponse)spanMatchResponse
{
  return self->_spanMatchResponse;
}

- (id)description
{
  return (id)[MEMORY[0x263F71F80] printableSpanMatchResponse:self->_spanMatchResponse];
}

- (CDMSpanMatchProtoResponseCommand)initWithResponse:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CDMSpanMatchProtoResponseCommand;
  v6 = [(CDMBaseCommand *)&v26 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_spanMatchResponse, a3);
    v8 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "matchingSpansCount"));
    v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "matchingSpansCount"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v10 = objc_msgSend(v5, "matchingSpans", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if (+[CDMSpanMatchUtils isSpanOnlyForExternalParsers:v15])
          {
            v16 = v9;
          }
          else
          {
            v16 = v8;
          }
          [(NSArray *)v16 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v31 count:16];
      }
      while (v12);
    }

    matchingSpansForNL = v7->_matchingSpansForNL;
    v7->_matchingSpansForNL = v8;
    v18 = v8;

    objc_storeStrong((id *)&v7->_matchingSpansForExternalParsers, v9);
    v19 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = [(NSArray *)v9 count];
      *(_DWORD *)buf = 136315394;
      v28 = "-[CDMSpanMatchProtoResponseCommand initWithResponse:]";
      __int16 v29 = 2048;
      uint64_t v30 = v21;
      _os_log_debug_impl(&dword_2263A0000, v19, OS_LOG_TYPE_DEBUG, "%s Filtered %lu spans to only expose to external parsers", buf, 0x16u);
    }
  }
  return v7;
}

@end