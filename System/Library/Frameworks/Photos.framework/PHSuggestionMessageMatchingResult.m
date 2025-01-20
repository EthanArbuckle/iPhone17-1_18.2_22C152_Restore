@interface PHSuggestionMessageMatchingResult
- (NSMutableDictionary)scoreByCMMSuggestionMatchingType;
- (PHSuggestion)suggestion;
- (PHSuggestionMessageContext)messageContext;
- (PHSuggestionMessageMatchingResult)initWithSuggestion:(id)a3 messageContext:(id)a4;
- (double)scoreForSuggestionMatchingType:(int64_t)a3;
- (void)registerMatchingType:(int64_t)a3 weight:(double)a4;
- (void)setMessageContext:(id)a3;
- (void)setScoreByCMMSuggestionMatchingType:(id)a3;
- (void)setSuggestion:(id)a3;
@end

@implementation PHSuggestionMessageMatchingResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreByCMMSuggestionMatchingType, 0);
  objc_storeStrong((id *)&self->_messageContext, 0);

  objc_storeStrong((id *)&self->_suggestion, 0);
}

- (void)setScoreByCMMSuggestionMatchingType:(id)a3
{
}

- (NSMutableDictionary)scoreByCMMSuggestionMatchingType
{
  return self->_scoreByCMMSuggestionMatchingType;
}

- (void)setMessageContext:(id)a3
{
}

- (PHSuggestionMessageContext)messageContext
{
  return self->_messageContext;
}

- (void)setSuggestion:(id)a3
{
}

- (PHSuggestion)suggestion
{
  return self->_suggestion;
}

- (double)scoreForSuggestionMatchingType:(int64_t)a3
{
  v4 = [NSNumber numberWithInteger:a3];
  scoreByCMMSuggestionMatchingType = self->_scoreByCMMSuggestionMatchingType;
  if (scoreByCMMSuggestionMatchingType)
  {
    v6 = [(NSMutableDictionary *)scoreByCMMSuggestionMatchingType objectForKeyedSubscript:v4];
    v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      double v9 = v8;
    }
    else
    {
      double v9 = 0.0;
    }
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (void)registerMatchingType:(int64_t)a3 weight:(double)a4
{
  id v11 = [NSNumber numberWithInteger:a3];
  v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_scoreByCMMSuggestionMatchingType, "objectForKeyedSubscript:");
  v7 = NSNumber;
  if (v6)
  {
    double v8 = v6;
    [v6 doubleValue];
    v10 = [v7 numberWithDouble:v9 + a4];
  }
  else
  {
    v10 = [NSNumber numberWithDouble:a4];
  }
  [(NSMutableDictionary *)self->_scoreByCMMSuggestionMatchingType setObject:v10 forKeyedSubscript:v11];
}

- (PHSuggestionMessageMatchingResult)initWithSuggestion:(id)a3 messageContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHSuggestionMessageMatchingResult;
  double v9 = [(PHSuggestionMessageMatchingResult *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suggestion, a3);
    objc_storeStrong((id *)&v10->_messageContext, a4);
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    scoreByCMMSuggestionMatchingType = v10->_scoreByCMMSuggestionMatchingType;
    v10->_scoreByCMMSuggestionMatchingType = (NSMutableDictionary *)v11;
  }
  return v10;
}

@end