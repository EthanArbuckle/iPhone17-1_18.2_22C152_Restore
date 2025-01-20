@interface CCSharedItem(CESRSpeechProfileBuilder)
- (uint64_t)isBoosted;
- (void)setIsBoosted:()CESRSpeechProfileBuilder;
@end

@implementation CCSharedItem(CESRSpeechProfileBuilder)

- (uint64_t)isBoosted
{
  v1 = objc_getAssociatedObject(a1, &kIsBoostedKey);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIsBoosted:()CESRSpeechProfileBuilder
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &kIsBoostedKey, v2, (void *)3);
}

@end