@interface CDMPSCResponseCommand
- (CDMPSCResponseCommand)initWithPscParses:(id)a3 pscResponse:(id)a4;
- (NSArray)pscParses;
- (SIRINLUINTERNALITFMITFMParserResponse)pscResponse;
@end

@implementation CDMPSCResponseCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pscResponse, 0);
  objc_storeStrong((id *)&self->_pscParses, 0);
}

- (SIRINLUINTERNALITFMITFMParserResponse)pscResponse
{
  return self->_pscResponse;
}

- (NSArray)pscParses
{
  return self->_pscParses;
}

- (CDMPSCResponseCommand)initWithPscParses:(id)a3 pscResponse:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMPSCResponseCommand;
  v9 = [(CDMBaseCommand *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pscParses, a3);
    objc_storeStrong((id *)&v10->_pscResponse, a4);
  }

  return v10;
}

@end