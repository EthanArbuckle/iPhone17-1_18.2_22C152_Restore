@interface ATXScoredInfoSuggestion
- (ATXInfoSuggestion)suggestion;
- (ATXInformationFeatureSet)featureSet;
- (ATXScoredInfoSuggestion)initWithSuggestion:(id)a3 featureSet:(id)a4 score:(double)a5;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
@end

@implementation ATXScoredInfoSuggestion

- (ATXScoredInfoSuggestion)initWithSuggestion:(id)a3 featureSet:(id)a4 score:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXScoredInfoSuggestion;
  v11 = [(ATXScoredInfoSuggestion *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_suggestion, a3);
    objc_storeStrong((id *)&v12->_featureSet, a4);
    v12->_score = a5;
  }

  return v12;
}

- (id)dictionaryRepresentation
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"suggestion";
  v3 = [(ATXInfoSuggestion *)self->_suggestion dictionaryRepresentation];
  v9[0] = v3;
  v8[1] = @"featureSet";
  v4 = [(ATXInformationFeatureSet *)self->_featureSet dictionaryRepresentation];
  v9[1] = v4;
  v8[2] = @"score";
  v5 = [NSNumber numberWithDouble:self->_score];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)description
{
  v2 = [(ATXScoredInfoSuggestion *)self dictionaryRepresentation];
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  v4 = [v2 descriptionWithLocale:v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = (void *)[(ATXInfoSuggestion *)self->_suggestion copy];
  v6 = (void *)[(ATXInformationFeatureSet *)self->_featureSet copy];
  v7 = (void *)[v4 initWithSuggestion:v5 featureSet:v6 score:self->_score];

  return v7;
}

- (ATXInfoSuggestion)suggestion
{
  return self->_suggestion;
}

- (ATXInformationFeatureSet)featureSet
{
  return self->_featureSet;
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureSet, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end