@interface AFDictationNLUResult
+ (BOOL)supportsSecureCoding;
- (AFDictationNLUResult)init;
- (AFDictationNLUResult)initWithCoder:(id)a3;
- (AFVoiceCommandGrammarParsePackage)commandGrammarParsePackage;
- (BOOL)isEqual:(id)a3;
- (SIRINLUEXTERNALCDMNluResponse)nluResponse;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCommandGrammarParsePackage:(id)a3;
- (void)setNluResponse:(id)a3;
@end

@implementation AFDictationNLUResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandGrammarParsePackage, 0);
  objc_storeStrong((id *)&self->_nluResponse, 0);
}

- (void)setCommandGrammarParsePackage:(id)a3
{
}

- (AFVoiceCommandGrammarParsePackage)commandGrammarParsePackage
{
  return self->_commandGrammarParsePackage;
}

- (void)setNluResponse:(id)a3
{
}

- (SIRINLUEXTERNALCDMNluResponse)nluResponse
{
  return self->_nluResponse;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendFormat:@"[NluResponse = %@]", self->_nluResponse];
  [v3 appendString:@"\n<CommandGrammarParsePackage>\n"];
  v4 = [(AFVoiceCommandGrammarParsePackage *)self->_commandGrammarParsePackage description];
  [v3 appendFormat:@"%@", v4];

  [v3 appendString:@"\n</CommandGrammarParsePackage>\n"];
  return v3;
}

- (AFDictationNLUResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFDictationNLUResult;
  v5 = [(AFDictationNLUResult *)&v12 init];
  if (v5)
  {
    id SIRINLUEXTERNALCDMNluResponseClass = getSIRINLUEXTERNALCDMNluResponseClass();
    if (SIRINLUEXTERNALCDMNluResponseClass)
    {
      uint64_t v7 = [v4 decodeObjectOfClass:SIRINLUEXTERNALCDMNluResponseClass forKey:@"_nluResponse"];
      nluResponse = v5->_nluResponse;
      v5->_nluResponse = (SIRINLUEXTERNALCDMNluResponse *)v7;
    }
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_commandGrammarParsePackage"];
    commandGrammarParsePackage = v5->_commandGrammarParsePackage;
    v5->_commandGrammarParsePackage = (AFVoiceCommandGrammarParsePackage *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  nluResponse = self->_nluResponse;
  id v5 = a3;
  [v5 encodeObject:nluResponse forKey:@"_nluResponse"];
  [v5 encodeObject:self->_commandGrammarParsePackage forKey:@"_commandGrammarParsePackage"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFDictationNLUResult *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      uint64_t v7 = [(AFDictationNLUResult *)v4 commandGrammarParsePackage];
      commandGrammarParsePackage = self->_commandGrammarParsePackage;
      BOOL v6 = commandGrammarParsePackage == v7
        || [(AFVoiceCommandGrammarParsePackage *)commandGrammarParsePackage isEqual:v7];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(AFDictationNLUResult *)self nluResponse];
  BOOL v6 = (void *)[v5 copy];
  [v4 setNluResponse:v6];

  uint64_t v7 = [(AFDictationNLUResult *)self commandGrammarParsePackage];
  v8 = (void *)[v7 copy];
  [v4 setCommandGrammarParsePackage:v8];

  return v4;
}

- (AFDictationNLUResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)AFDictationNLUResult;
  return [(AFDictationNLUResult *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end