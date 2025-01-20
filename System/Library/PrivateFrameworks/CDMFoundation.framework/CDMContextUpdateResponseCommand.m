@interface CDMContextUpdateResponseCommand
- (CDMContextUpdateResponseCommand)initWithCtxUpdateResponse:(id)a3;
- (SIRINLUEXTERNALCorrectionOutcome)correctionOutcome;
- (SIRINLUINTERNALCONTEXTUPDATEContextUpdateResponse)ctxUpdateResponse;
- (SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle)firstReformedInput;
- (void)setCorrectionOutcome:(id)a3;
- (void)setCtxUpdateResponse:(id)a3;
- (void)setFirstReformedInput:(id)a3;
@end

@implementation CDMContextUpdateResponseCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctionOutcome, 0);
  objc_storeStrong((id *)&self->_firstReformedInput, 0);
  objc_storeStrong((id *)&self->_ctxUpdateResponse, 0);
}

- (void)setCorrectionOutcome:(id)a3
{
}

- (SIRINLUEXTERNALCorrectionOutcome)correctionOutcome
{
  return self->_correctionOutcome;
}

- (void)setFirstReformedInput:(id)a3
{
}

- (SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle)firstReformedInput
{
  return self->_firstReformedInput;
}

- (void)setCtxUpdateResponse:(id)a3
{
}

- (SIRINLUINTERNALCONTEXTUPDATEContextUpdateResponse)ctxUpdateResponse
{
  return self->_ctxUpdateResponse;
}

- (CDMContextUpdateResponseCommand)initWithCtxUpdateResponse:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CDMContextUpdateResponseCommand;
  v6 = [(CDMBaseCommand *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ctxUpdateResponse, a3);
    correctionOutcome = v7->_correctionOutcome;
    v7->_correctionOutcome = 0;

    v9 = [v5 reformedTurnInputBundles];
    uint64_t v10 = [v9 firstObject];
    firstReformedInput = v7->_firstReformedInput;
    v7->_firstReformedInput = (SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle *)v10;

    v12 = v7->_firstReformedInput;
    if (v12)
    {
      if ([(SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle *)v12 type] == 1
        || [(SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle *)v7->_firstReformedInput type] == 3)
      {
        uint64_t v13 = objc_opt_new();
        v14 = v7->_correctionOutcome;
        v7->_correctionOutcome = (SIRINLUEXTERNALCorrectionOutcome *)v13;

        [(SIRINLUEXTERNALCorrectionOutcome *)v7->_correctionOutcome setType:1];
      }
    }
  }

  return v7;
}

@end