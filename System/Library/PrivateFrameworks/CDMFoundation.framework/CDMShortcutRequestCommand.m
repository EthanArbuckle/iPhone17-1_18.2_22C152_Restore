@interface CDMShortcutRequestCommand
- (CDMShortcutRequestCommand)initWithMatchingSpans:(id)a3 tokenChain:(id)a4 currentTurnContext:(id)a5;
- (NSArray)matchingSpans;
- (SIRINLUEXTERNALTurnContext)currentTurnContext;
- (SIRINLUINTERNALTokenChain)tokenChain;
@end

@implementation CDMShortcutRequestCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTurnContext, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
  objc_storeStrong((id *)&self->_tokenChain, 0);
}

- (SIRINLUEXTERNALTurnContext)currentTurnContext
{
  return self->_currentTurnContext;
}

- (NSArray)matchingSpans
{
  return self->_matchingSpans;
}

- (SIRINLUINTERNALTokenChain)tokenChain
{
  return self->_tokenChain;
}

- (CDMShortcutRequestCommand)initWithMatchingSpans:(id)a3 tokenChain:(id)a4 currentTurnContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CDMShortcutRequestCommand;
  v11 = [(CDMBaseCommand *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    matchingSpans = v11->_matchingSpans;
    v11->_matchingSpans = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    tokenChain = v11->_tokenChain;
    v11->_tokenChain = (SIRINLUINTERNALTokenChain *)v14;

    uint64_t v16 = [v10 copy];
    currentTurnContext = v11->_currentTurnContext;
    v11->_currentTurnContext = (SIRINLUEXTERNALTurnContext *)v16;
  }
  return v11;
}

@end