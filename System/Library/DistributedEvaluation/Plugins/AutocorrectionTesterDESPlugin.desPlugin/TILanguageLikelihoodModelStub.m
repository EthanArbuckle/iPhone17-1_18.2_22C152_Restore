@interface TILanguageLikelihoodModelStub
- (double)emojiLastUsageTime;
- (id)rankedLanguagesForRecipient:(id)a3;
- (unint64_t)emojiUsageCount;
- (unint64_t)emojiUsageCountForApp:(id)a3 lastEmojiCountUpdateTime:(double *)a4;
- (void)priorProbabilityForLanguages:(id)a3 recipient:(id)a4 handler:(id)a5;
- (void)setEmojiLastUsageTime:(double)a3;
- (void)setEmojiUsageCount:(unint64_t)a3;
@end

@implementation TILanguageLikelihoodModelStub

- (id)rankedLanguagesForRecipient:(id)a3
{
  return &__NSArray0__struct;
}

- (void)priorProbabilityForLanguages:(id)a3 recipient:(id)a4 handler:(id)a5
{
  id v6 = a3;
  v7 = (void (**)(id, void, char *, float))a5;
  char v19 = 0;
  id v8 = [v6 count];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    float v13 = 1.0 / (float)(unint64_t)v8;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v16 != v12) {
        objc_enumerationMutation(v9);
      }
      v7[2](v7, *(void *)(*((void *)&v15 + 1) + 8 * v14), &v19, v13);
      if (v19) {
        break;
      }
      if (v11 == (id)++v14)
      {
        id v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (unint64_t)emojiUsageCountForApp:(id)a3 lastEmojiCountUpdateTime:(double *)a4
{
  if (a4)
  {
    [(TILanguageLikelihoodModelStub *)self emojiLastUsageTime];
    *(void *)a4 = v6;
  }

  return [(TILanguageLikelihoodModelStub *)self emojiUsageCount];
}

- (unint64_t)emojiUsageCount
{
  return self->_emojiUsageCount;
}

- (void)setEmojiUsageCount:(unint64_t)a3
{
  self->_emojiUsageCount = a3;
}

- (double)emojiLastUsageTime
{
  return self->_emojiLastUsageTime;
}

- (void)setEmojiLastUsageTime:(double)a3
{
  self->_emojiLastUsageTime = a3;
}

@end