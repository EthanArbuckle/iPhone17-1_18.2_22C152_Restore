@interface EARSpeechRecognitionResult
+ (BOOL)supportsSecureCoding;
- (EARSpeechRecognitionResult)initWithCoder:(id)a3;
- (EARSpeechRecognitionResult)initWithResult:(id)a3;
- (NSArray)preITNTokens;
- (NSArray)preITNVoiceCommandInterpretations;
- (NSArray)tokens;
- (NSArray)voiceCommandInterpretations;
- (double)confidence;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EARSpeechRecognitionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preITNVoiceCommandInterpretations, 0);
  objc_storeStrong((id *)&self->_voiceCommandInterpretations, 0);
  objc_storeStrong((id *)&self->_preITNTokens, 0);

  objc_storeStrong((id *)&self->_tokens, 0);
}

- (NSArray)preITNVoiceCommandInterpretations
{
  return self->_preITNVoiceCommandInterpretations;
}

- (NSArray)voiceCommandInterpretations
{
  return self->_voiceCommandInterpretations;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSArray)preITNTokens
{
  return self->_preITNTokens;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (EARSpeechRecognitionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EARSpeechRecognitionResult;
  v5 = [(EARSpeechRecognitionResult *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"tokens"];
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"preITNTokens"];
    preITNTokens = v5->_preITNTokens;
    v5->_preITNTokens = (NSArray *)v8;

    [v4 decodeDoubleForKey:@"confidence"];
    v5->_confidence = v10;
    uint64_t v11 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"voiceCommandInterpretations"];
    voiceCommandInterpretations = v5->_voiceCommandInterpretations;
    v5->_voiceCommandInterpretations = (NSArray *)v11;

    uint64_t v13 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"preITNVoiceCommandInterpretations"];
    preITNVoiceCommandInterpretations = v5->_preITNVoiceCommandInterpretations;
    v5->_preITNVoiceCommandInterpretations = (NSArray *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  tokens = self->_tokens;
  id v5 = a3;
  [v5 encodeObject:tokens forKey:@"tokens"];
  [v5 encodeObject:self->_preITNTokens forKey:@"preITNTokens"];
  [v5 encodeDouble:@"confidence" forKey:self->_confidence];
  [v5 encodeObject:self->_voiceCommandInterpretations forKey:@"voiceCommandInterpretations"];
  [v5 encodeObject:self->_preITNVoiceCommandInterpretations forKey:@"preITNVoiceCommandInterpretations"];
}

- (EARSpeechRecognitionResult)initWithResult:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)EARSpeechRecognitionResult;
  id v5 = [(EARSpeechRecognitionResult *)&v33 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
    v7 = [v4 tokens];
    uint64_t v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

    v9 = [v4 tokens];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __45__EARSpeechRecognitionResult_initWithResult___block_invoke;
    v31[3] = &unk_1E6154E98;
    id v32 = v8;
    id v10 = v8;
    [v9 enumerateObjectsUsingBlock:v31];

    uint64_t v11 = (void *)MEMORY[0x1E4F1CA48];
    v12 = [v4 preITNTokens];
    uint64_t v13 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));

    v14 = [v4 preITNTokens];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __45__EARSpeechRecognitionResult_initWithResult___block_invoke_2;
    v29 = &unk_1E6154E98;
    id v30 = v13;
    id v15 = v13;
    [v14 enumerateObjectsUsingBlock:&v26];

    uint64_t v16 = objc_msgSend(v10, "copy", v26, v27, v28, v29);
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v16;

    uint64_t v18 = [v15 copy];
    preITNTokens = v5->_preITNTokens;
    v5->_preITNTokens = (NSArray *)v18;

    [v4 confidence];
    v5->_confidence = v20;
    uint64_t v21 = [v4 voiceCommandInterpretations];
    voiceCommandInterpretations = v5->_voiceCommandInterpretations;
    v5->_voiceCommandInterpretations = (NSArray *)v21;

    uint64_t v23 = [v4 preITNVoiceCommandInterpretations];
    preITNVoiceCommandInterpretations = v5->_preITNVoiceCommandInterpretations;
    v5->_preITNVoiceCommandInterpretations = (NSArray *)v23;
  }
  return v5;
}

void __45__EARSpeechRecognitionResult_initWithResult___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [[EARSpeechRecognitionToken alloc] initWithToken:v3];

  [v2 addObject:v4];
}

void __45__EARSpeechRecognitionResult_initWithResult___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [[EARSpeechRecognitionToken alloc] initWithToken:v3];

  [v2 addObject:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end