@interface SASSpeechRecognized(AssistantAdditions)
- (id)af_correctionContext;
- (uint64_t)af_isUserUtterance;
- (uint64_t)af_isUtterance;
- (uint64_t)af_waitsForConfirmation;
@end

@implementation SASSpeechRecognized(AssistantAdditions)

- (id)af_correctionContext
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 refId];
  if (v2
    && (v3 = (void *)v2,
        [a1 sessionId],
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    v9[0] = @"interactionId";
    v5 = [a1 refId];
    v9[1] = @"sessionId";
    v10[0] = v5;
    v6 = [a1 sessionId];
    v10[1] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (uint64_t)af_waitsForConfirmation
{
  return 1;
}

- (uint64_t)af_isUserUtterance
{
  return 1;
}

- (uint64_t)af_isUtterance
{
  return 1;
}

@end