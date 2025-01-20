@interface TIStaticLanguageLikelihoodModel
- (TIInputMode)primaryInputMode;
- (TIInputMode)secondaryInputMode;
- (TIStaticLanguageLikelihoodModel)initWithPrimaryInputMode:(id)a3 secondaryInputMode:(id)a4 secondaryLanguageWeight:(float)a5;
- (double)lastOfflineAdaptationTimeForApp:(id)a3;
- (float)_priorProbabilityForLanguage:(id)a3 recipient:(id)a4;
- (float)primaryLanguageWeight;
- (float)secondaryLanguageWeight;
- (id)rankedLanguagesForRecipient:(id)a3;
- (unint64_t)emojiUsageCountForApp:(id)a3 lastEmojiCountUpdateTime:(double *)a4;
- (void)priorProbabilityForLanguages:(id)a3 recipient:(id)a4 handler:(id)a5;
@end

@implementation TIStaticLanguageLikelihoodModel

- (TIStaticLanguageLikelihoodModel)initWithPrimaryInputMode:(id)a3 secondaryInputMode:(id)a4 secondaryLanguageWeight:(float)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TIStaticLanguageLikelihoodModel;
  v11 = [(TIStaticLanguageLikelihoodModel *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_primaryInputMode, a3);
    objc_storeStrong((id *)&v12->_secondaryInputMode, a4);
    v12->_secondaryLanguageWeight = a5;
  }

  return v12;
}

- (id)rankedLanguagesForRecipient:(id)a3
{
  v4 = +[NSMutableArray array];
  v5 = [(TIStaticLanguageLikelihoodModel *)self primaryInputMode];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 normalizedIdentifier];
    v8 = TIInputModeGetLanguage();

    [v4 addObject:v8];
    id v9 = [(TIStaticLanguageLikelihoodModel *)self secondaryInputMode];
    id v10 = v9;
    if (v9)
    {
      v11 = [v9 normalizedIdentifier];
      v12 = TIInputModeGetLanguage();

      [v4 addObject:v12];
    }
  }

  return v4;
}

- (float)_priorProbabilityForLanguage:(id)a3 recipient:(id)a4
{
  id v5 = a3;
  v6 = [(TIStaticLanguageLikelihoodModel *)self primaryInputMode];
  v7 = [v6 normalizedIdentifier];
  v8 = TIInputModeGetLanguage();

  if ([v8 isEqualToString:v5])
  {
    [(TIStaticLanguageLikelihoodModel *)self primaryLanguageWeight];
    float v10 = v9;
  }
  else
  {
    v11 = [(TIStaticLanguageLikelihoodModel *)self secondaryInputMode];
    v12 = [v11 normalizedIdentifier];
    v13 = TIInputModeGetLanguage();

    float v10 = 0.0;
    if ([v13 isEqualToString:v5])
    {
      [(TIStaticLanguageLikelihoodModel *)self secondaryLanguageWeight];
      float v10 = v14;
    }
  }
  return v10;
}

- (void)priorProbabilityForLanguages:(id)a3 recipient:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  float v10 = (void (**)(id, uint64_t, char *))a5;
  char v20 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v17 != v13) {
        objc_enumerationMutation(v11);
      }
      uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * v14);
      -[TIStaticLanguageLikelihoodModel _priorProbabilityForLanguage:recipient:](self, "_priorProbabilityForLanguage:recipient:", v15, v9, (void)v16);
      v10[2](v10, v15, &v20);
      if (v20) {
        break;
      }
      if (v12 == (id)++v14)
      {
        id v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (double)lastOfflineAdaptationTimeForApp:(id)a3
{
  return 0.0;
}

- (unint64_t)emojiUsageCountForApp:(id)a3 lastEmojiCountUpdateTime:(double *)a4
{
  return 0;
}

- (float)primaryLanguageWeight
{
  [(TIStaticLanguageLikelihoodModel *)self secondaryLanguageWeight];
  return 1.0 - v2;
}

- (TIInputMode)primaryInputMode
{
  return self->_primaryInputMode;
}

- (TIInputMode)secondaryInputMode
{
  return self->_secondaryInputMode;
}

- (float)secondaryLanguageWeight
{
  return self->_secondaryLanguageWeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryInputMode, 0);

  objc_storeStrong((id *)&self->_primaryInputMode, 0);
}

@end