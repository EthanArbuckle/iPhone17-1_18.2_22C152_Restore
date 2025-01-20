@interface NLTokenIDBasedLanguageModelSession
- (id)conditionalProbabilitiesForTokenIDs:(const unsigned int *)a3 count:(unint64_t)a4 contextTokenIDs:(const unsigned int *)a5 length:(unint64_t)a6;
- (id)conditionalProbabilityForTokenID:(unsigned int)a3 contextTokenIDs:(const unsigned int *)a4 length:(unint64_t)a5;
- (id)stateWithOptions:(id)a3;
- (int64_t)blocklistStatusForTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4 matchType:(int64_t)a5;
@end

@implementation NLTokenIDBasedLanguageModelSession

- (id)conditionalProbabilityForTokenID:(unsigned int)a3 contextTokenIDs:(const unsigned int *)a4 length:(unint64_t)a5
{
  v5 = [[NLProbabilityInfo alloc] initWithInvalidProbability];

  return v5;
}

- (id)conditionalProbabilitiesForTokenIDs:(const unsigned int *)a3 count:(unint64_t)a4 contextTokenIDs:(const unsigned int *)a5 length:(unint64_t)a6
{
  for (i = [MEMORY[0x1E4F1CA48] array];
  {
    unsigned int v12 = *a3++;
    v13 = [(NLTokenIDBasedLanguageModelSession *)self conditionalProbabilityForTokenID:v12 contextTokenIDs:a5 length:a6];
    [i addObject:v13];
  }

  return i;
}

- (int64_t)blocklistStatusForTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4 matchType:(int64_t)a5
{
  return 0;
}

- (id)stateWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [NLTokenIDBasedLanguageModelState alloc];
  v6 = [(NLTokenIDBasedLanguageModelState *)v5 initWithSession:self options:v4 context:&stru_1EFB303D0 contextTokenIDArray:MEMORY[0x1E4F1CBF0]];

  return v6;
}

@end