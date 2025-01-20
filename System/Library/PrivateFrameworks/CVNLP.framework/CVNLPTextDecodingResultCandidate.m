@interface CVNLPTextDecodingResultCandidate
- (CVNLPTextDecodingResultCandidate)initWithTokens:(id)a3 score:(double)a4 activationScore:(double)a5;
- (NSArray)tokens;
- (NSString)fullString;
- (double)activationScore;
- (double)score;
- (void)setActivationScore:(double)a3;
- (void)setScore:(double)a3;
@end

@implementation CVNLPTextDecodingResultCandidate

- (CVNLPTextDecodingResultCandidate)initWithTokens:(id)a3 score:(double)a4 activationScore:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CVNLPTextDecodingResultCandidate;
  v10 = [(CVNLPTextDecodingResultCandidate *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_tokens, a3);
    v11->_score = a4;
    v11->_activationScore = a5;
  }

  return v11;
}

- (NSString)fullString
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = self->_tokens;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v6);
        }
        v15 = objc_msgSend_fullString(*(void **)(*((void *)&v19 + 1) + 8 * i), v9, v10, v11, (void)v19);
        objc_msgSend_appendString_(v5, v16, (uint64_t)v15, v17);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v19, (uint64_t)v23, 16);
    }
    while (v12);
  }

  return (NSString *)v5;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)activationScore
{
  return self->_activationScore;
}

- (void)setActivationScore:(double)a3
{
  self->_activationScore = a3;
}

- (void).cxx_destruct
{
}

@end