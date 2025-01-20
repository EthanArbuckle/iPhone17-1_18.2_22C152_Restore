@interface AFSpeechInfoPackage
+ (BOOL)supportsSecureCoding;
- (AFSpeechInfoPackage)initWithCoder:(id)a3;
- (AFSpeechInfoPackage)initWithCommandGrammarParsePackage:(id)a3;
- (AFSpeechInfoPackage)initWithCommandGrammarParsePackage:(id)a3 debugInfo:(id)a4;
- (AFVoiceCommandDebugInfo)debugInfo;
- (AFVoiceCommandGrammarParsePackage)commandGrammarParsePackage;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSpeechInfoPackage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_commandGrammarParsePackage, 0);
}

- (AFVoiceCommandDebugInfo)debugInfo
{
  return self->_debugInfo;
}

- (AFVoiceCommandGrammarParsePackage)commandGrammarParsePackage
{
  return self->_commandGrammarParsePackage;
}

- (void)encodeWithCoder:(id)a3
{
  commandGrammarParsePackage = self->_commandGrammarParsePackage;
  id v5 = a3;
  [v5 encodeObject:commandGrammarParsePackage forKey:@"AFSpeechInfoPackage::CommandGrammarParsePackage"];
  [v5 encodeObject:self->_debugInfo forKey:@"AFSpeechInfoPackage::DebugInfo"];
}

- (AFSpeechInfoPackage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechInfoPackage::CommandGrammarParsePackage"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechInfoPackage::DebugInfo"];

  v7 = [(AFSpeechInfoPackage *)self initWithCommandGrammarParsePackage:v5 debugInfo:v6];
  return v7;
}

- (id)dictionaryRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"commandGrammarParsePackage";
  v3 = [(AFVoiceCommandGrammarParsePackage *)self->_commandGrammarParsePackage dictionaryRepresentation];
  v7[1] = @"debugInfo";
  v8[0] = v3;
  id v4 = [(AFVoiceCommandDebugInfo *)self->_debugInfo dictionaryRepresentation];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [(AFVoiceCommandGrammarParsePackage *)self->_commandGrammarParsePackage description];
  [v3 appendFormat:@"[CommandGrammarParsePackage = %@]", v4];

  id v5 = [(AFVoiceCommandDebugInfo *)self->_debugInfo description];
  [v3 appendFormat:@"[DebugInfo = %@]", v5];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFSpeechInfoPackage *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(AFSpeechInfoPackage *)v5 commandGrammarParsePackage];
      commandGrammarParsePackage = self->_commandGrammarParsePackage;
      if (commandGrammarParsePackage == v6
        || [(AFVoiceCommandGrammarParsePackage *)commandGrammarParsePackage isEqual:v6])
      {
        v8 = [(AFSpeechInfoPackage *)v5 debugInfo];
        debugInfo = self->_debugInfo;
        BOOL v10 = debugInfo == v8 || [(AFVoiceCommandDebugInfo *)debugInfo isEqual:v8];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (AFSpeechInfoPackage)initWithCommandGrammarParsePackage:(id)a3 debugInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFSpeechInfoPackage;
  v8 = [(AFSpeechInfoPackage *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    commandGrammarParsePackage = v8->_commandGrammarParsePackage;
    v8->_commandGrammarParsePackage = (AFVoiceCommandGrammarParsePackage *)v9;

    uint64_t v11 = [v7 copy];
    debugInfo = v8->_debugInfo;
    v8->_debugInfo = (AFVoiceCommandDebugInfo *)v11;
  }
  return v8;
}

- (AFSpeechInfoPackage)initWithCommandGrammarParsePackage:(id)a3
{
  return [(AFSpeechInfoPackage *)self initWithCommandGrammarParsePackage:a3 debugInfo:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end