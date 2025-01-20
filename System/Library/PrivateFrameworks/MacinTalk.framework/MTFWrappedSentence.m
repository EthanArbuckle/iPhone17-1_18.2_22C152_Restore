@interface MTFWrappedSentence
- (float)fBaseFloor;
- (float)fBaseRange;
- (float)fBaseRate;
- (float)fDuration;
- (signed)fFinalRate;
- (signed)fFlags;
- (signed)fNumWords;
@end

@implementation MTFWrappedSentence

- (signed)fFlags
{
  return (__int16)[(MTFWrappedSentence *)self elem][56];
}

- (float)fDuration
{
  return (float)[(MTFWrappedSentence *)self elem][60];
}

- (signed)fNumWords
{
  return (__int16)[(MTFWrappedSentence *)self elem][64];
}

- (signed)fFinalRate
{
  return (__int16)[(MTFWrappedSentence *)self elem][66];
}

- (float)fBaseFloor
{
  return (float)[(MTFWrappedSentence *)self elem][68];
}

- (float)fBaseRange
{
  return (float)[(MTFWrappedSentence *)self elem][72];
}

- (float)fBaseRate
{
  return (float)[(MTFWrappedSentence *)self elem][76];
}

@end