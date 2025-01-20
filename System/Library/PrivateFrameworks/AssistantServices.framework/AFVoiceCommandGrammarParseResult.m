@interface AFVoiceCommandGrammarParseResult
+ (BOOL)supportsSecureCoding;
- (AFVoiceCommandGrammarParseResult)initWithCoder:(id)a3;
- (AFVoiceCommandGrammarParseResult)initWithUtterance:(id)a3 parseCandidates:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)parseCandidates;
- (NSString)utterance;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFVoiceCommandGrammarParseResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parseCandidates, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
}

- (NSArray)parseCandidates
{
  return self->_parseCandidates;
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)encodeWithCoder:(id)a3
{
  utterance = self->_utterance;
  id v5 = a3;
  [v5 encodeObject:utterance forKey:@"AFVoiceCommandGrammarParseResult::utterance"];
  [v5 encodeObject:self->_parseCandidates forKey:@"AFVoiceCommandGrammarParseResult::parseCandidates"];
}

- (AFVoiceCommandGrammarParseResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFVoiceCommandGrammarParseResult::utterance"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"AFVoiceCommandGrammarParseResult::parseCandidates"];

  v10 = [(AFVoiceCommandGrammarParseResult *)self initWithUtterance:v5 parseCandidates:v9];
  return v10;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  [v3 setObject:self->_utterance forKey:@"utterance"];
  if ([(NSArray *)self->_parseCandidates count])
  {
    id v4 = objc_opt_new();
    parseCandidates = self->_parseCandidates;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__AFVoiceCommandGrammarParseResult_dictionaryRepresentation__block_invoke;
    v9[3] = &unk_1E592AE50;
    id v10 = v4;
    id v6 = v4;
    [(NSArray *)parseCandidates enumerateObjectsUsingBlock:v9];
    [v3 setObject:v6 forKey:@"parseCandidates"];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
    [v3 setObject:v7 forKey:@"parseCandidates"];
  }
  return v3;
}

void __60__AFVoiceCommandGrammarParseResult_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 dictionaryRepresentation];
  [v2 addObject:v3];
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendFormat:@"utterance = %@", self->_utterance];
  parseCandidates = self->_parseCandidates;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__AFVoiceCommandGrammarParseResult_description__block_invoke;
  v7[3] = &unk_1E592AE50;
  id v5 = v3;
  id v8 = v5;
  [(NSArray *)parseCandidates enumerateObjectsUsingBlock:v7];

  return v5;
}

void __47__AFVoiceCommandGrammarParseResult_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 appendString:@"\n"];
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [v6 description];

  [v7 appendFormat:@"parseCandidate[%lu] --> %@", a3, v8];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFVoiceCommandGrammarParseResult *)a3;
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
      id v6 = [(AFVoiceCommandGrammarParseResult *)v5 utterance];
      utterance = self->_utterance;
      if (utterance == v6 || [(NSString *)utterance isEqual:v6])
      {
        id v8 = [(AFVoiceCommandGrammarParseResult *)v5 parseCandidates];
        parseCandidates = self->_parseCandidates;
        BOOL v10 = parseCandidates == v8 || [(NSArray *)parseCandidates isEqual:v8];
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

- (AFVoiceCommandGrammarParseResult)initWithUtterance:(id)a3 parseCandidates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFVoiceCommandGrammarParseResult;
  id v8 = [(AFVoiceCommandGrammarParseResult *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    utterance = v8->_utterance;
    v8->_utterance = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    parseCandidates = v8->_parseCandidates;
    v8->_parseCandidates = (NSArray *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end