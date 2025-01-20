@interface CDMContextUpdateRequestCommand
- (CDMContextUpdateRequestCommand)initWithCtxUpdateRequest:(id)a3;
- (SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest)ctxUpdateRequest;
- (void)setCtxUpdateRequest:(id)a3;
@end

@implementation CDMContextUpdateRequestCommand

- (void).cxx_destruct
{
}

- (void)setCtxUpdateRequest:(id)a3
{
}

- (SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest)ctxUpdateRequest
{
  return self->_ctxUpdateRequest;
}

- (CDMContextUpdateRequestCommand)initWithCtxUpdateRequest:(id)a3
{
  id v5 = a3;
  v6 = [(CDMBaseCommand *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ctxUpdateRequest, a3);
  }

  return v7;
}

@end