@interface CDMContextualSpanMatcherRequestCommand
- (CDMContextualSpanMatcherRequestCommand)initWithContextualSpanMatcherRequest:(id)a3;
- (SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest)contextualSpanMatcherRequest;
@end

@implementation CDMContextualSpanMatcherRequestCommand

- (void).cxx_destruct
{
}

- (SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest)contextualSpanMatcherRequest
{
  return self->_contextualSpanMatcherRequest;
}

- (CDMContextualSpanMatcherRequestCommand)initWithContextualSpanMatcherRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMContextualSpanMatcherRequestCommand;
  v6 = [(CDMBaseCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contextualSpanMatcherRequest, a3);
  }

  return v7;
}

@end