@interface CDMSNLCProtoResponseCommand
- (BOOL)isDelegated;
- (CDMSNLCProtoResponseCommand)initWithClassLabel:(int)a3 snlcParses:(id)a4 snlcResponse:(id)a5;
- (NSArray)snlcParses;
- (SIRINLUINTERNALITFMITFMParserResponse)snlcResponse;
- (int)classLabel;
- (void)setClassLabel:(int)a3;
@end

@implementation CDMSNLCProtoResponseCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snlcResponse, 0);
  objc_storeStrong((id *)&self->_snlcParses, 0);
}

- (SIRINLUINTERNALITFMITFMParserResponse)snlcResponse
{
  return self->_snlcResponse;
}

- (NSArray)snlcParses
{
  return self->_snlcParses;
}

- (void)setClassLabel:(int)a3
{
  self->_classLabel = a3;
}

- (int)classLabel
{
  return self->_classLabel;
}

- (BOOL)isDelegated
{
  return self->_classLabel == 0;
}

- (CDMSNLCProtoResponseCommand)initWithClassLabel:(int)a3 snlcParses:(id)a4 snlcResponse:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CDMSNLCProtoResponseCommand;
  v11 = [(CDMBaseCommand *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_snlcParses, a4);
    v12->_classLabel = a3;
    objc_storeStrong((id *)&v12->_snlcResponse, a5);
  }

  return v12;
}

@end