@interface AFVoiceCommandGrammarParseCandidate
+ (BOOL)supportsSecureCoding;
- (AFVoiceCommandGrammarParseCandidate)initWithCoder:(id)a3;
- (AFVoiceCommandGrammarParseCandidate)initWithCommandId:(id)a3 isComplete:(BOOL)a4 paramMatches:(id)a5;
- (AFVoiceCommandGrammarParseCandidate)initWithVoiceCommandUUID:(id)a3 commandId:(id)a4 isComplete:(BOOL)a5 paramMatches:(id)a6;
- (BOOL)isComplete;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)paramMatches;
- (NSString)commandId;
- (NSUUID)voiceCommandUUID;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFVoiceCommandGrammarParseCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paramMatches, 0);
  objc_storeStrong((id *)&self->_commandId, 0);
  objc_storeStrong((id *)&self->_voiceCommandUUID, 0);
}

- (NSDictionary)paramMatches
{
  return self->_paramMatches;
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (NSString)commandId
{
  return self->_commandId;
}

- (NSUUID)voiceCommandUUID
{
  return self->_voiceCommandUUID;
}

- (void)encodeWithCoder:(id)a3
{
  voiceCommandUUID = self->_voiceCommandUUID;
  id v6 = a3;
  [v6 encodeObject:voiceCommandUUID forKey:@"AFVoiceCommandGrammarParseCandidate::voiceCommandUUID"];
  [v6 encodeObject:self->_commandId forKey:@"AFVoiceCommandGrammarParseCandidate::commandId"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isComplete];
  [v6 encodeObject:v5 forKey:@"AFVoiceCommandGrammarParseCandidate::isComplete"];

  [v6 encodeObject:self->_paramMatches forKey:@"AFVoiceCommandGrammarParseCandidate::paramMatches"];
}

- (AFVoiceCommandGrammarParseCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFVoiceCommandGrammarParseCandidate::voiceCommandUUID"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFVoiceCommandGrammarParseCandidate::commandId"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFVoiceCommandGrammarParseCandidate::isComplete"];
  uint64_t v8 = [v7 BOOLValue];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"AFVoiceCommandGrammarParseCandidate::paramMatches"];

  v14 = [(AFVoiceCommandGrammarParseCandidate *)self initWithVoiceCommandUUID:v5 commandId:v6 isComplete:v8 paramMatches:v13];
  return v14;
}

- (id)dictionaryRepresentation
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__21271;
  v13 = __Block_byref_object_dispose__21272;
  id v14 = (id)objc_opt_new();
  [(id)v10[5] setObject:self->_commandId forKey:@"commandId"];
  v3 = (void *)v10[5];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isComplete];
  [v3 setObject:v4 forKey:@"isComplete"];

  paramMatches = self->_paramMatches;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__AFVoiceCommandGrammarParseCandidate_dictionaryRepresentation__block_invoke;
  v8[3] = &unk_1E59281D8;
  v8[4] = &v9;
  [(NSDictionary *)paramMatches enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __63__AFVoiceCommandGrammarParseCandidate_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v6 = a2;
  v7 = [v9 text];
  if (v7) {
    [v9 text];
  }
  else {
  uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  [v5 setObject:v8 forKey:v6];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendFormat:@"["];
  [v3 appendFormat:@"voiceCommandUUID = %@", self->_voiceCommandUUID];
  [v3 appendFormat:@"commandId = %@", self->_commandId];
  if (self->_isComplete) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [v3 appendFormat:@", isComplete = %@", v4];
  paramMatches = self->_paramMatches;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__AFVoiceCommandGrammarParseCandidate_description__block_invoke;
  v8[3] = &unk_1E59281B0;
  id v6 = v3;
  id v9 = v6;
  [(NSDictionary *)paramMatches enumerateKeysAndObjectsUsingBlock:v8];
  [v6 appendFormat:@"]"];

  return v6;
}

void __50__AFVoiceCommandGrammarParseCandidate_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 description];
  [v4 appendFormat:@", %@ : %@", v5, v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFVoiceCommandGrammarParseCandidate *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL isComplete = self->_isComplete;
      if (isComplete == [(AFVoiceCommandGrammarParseCandidate *)v5 isComplete])
      {
        v7 = [(AFVoiceCommandGrammarParseCandidate *)v5 voiceCommandUUID];
        voiceCommandUUID = self->_voiceCommandUUID;
        if (voiceCommandUUID == v7 || [(NSUUID *)voiceCommandUUID isEqual:v7])
        {
          id v9 = [(AFVoiceCommandGrammarParseCandidate *)v5 commandId];
          commandId = self->_commandId;
          if (commandId == v9 || [(NSString *)commandId isEqual:v9])
          {
            uint64_t v11 = [(AFVoiceCommandGrammarParseCandidate *)v5 paramMatches];
            paramMatches = self->_paramMatches;
            BOOL v13 = paramMatches == v11 || [(NSDictionary *)paramMatches isEqual:v11];
          }
          else
          {
            BOOL v13 = 0;
          }
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (AFVoiceCommandGrammarParseCandidate)initWithVoiceCommandUUID:(id)a3 commandId:(id)a4 isComplete:(BOOL)a5 paramMatches:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)AFVoiceCommandGrammarParseCandidate;
  BOOL v13 = [(AFVoiceCommandGrammarParseCandidate *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    voiceCommandUUID = v13->_voiceCommandUUID;
    v13->_voiceCommandUUID = (NSUUID *)v14;

    uint64_t v16 = [v11 copy];
    commandId = v13->_commandId;
    v13->_commandId = (NSString *)v16;

    v13->_BOOL isComplete = a5;
    uint64_t v18 = [v12 copy];
    paramMatches = v13->_paramMatches;
    v13->_paramMatches = (NSDictionary *)v18;
  }
  return v13;
}

- (AFVoiceCommandGrammarParseCandidate)initWithCommandId:(id)a3 isComplete:(BOOL)a4 paramMatches:(id)a5
{
  return [(AFVoiceCommandGrammarParseCandidate *)self initWithVoiceCommandUUID:0 commandId:a3 isComplete:a4 paramMatches:a5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end