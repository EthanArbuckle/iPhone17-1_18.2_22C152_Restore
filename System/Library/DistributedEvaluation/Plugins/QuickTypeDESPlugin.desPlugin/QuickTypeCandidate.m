@interface QuickTypeCandidate
- (QuickTypeCandidate)initWithTokenID:(unsigned int)a3 andScore:(double)a4;
- (double)lmScore;
- (unsigned)tokenID;
- (void)setLmScore:(double)a3;
- (void)setTokenID:(unsigned int)a3;
@end

@implementation QuickTypeCandidate

- (QuickTypeCandidate)initWithTokenID:(unsigned int)a3 andScore:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)QuickTypeCandidate;
  v6 = [(QuickTypeCandidate *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(QuickTypeCandidate *)v6 setLmScore:a4];
    [(QuickTypeCandidate *)v7 setTokenID:v5];
  }
  return v7;
}

- (double)lmScore
{
  return self->_lmScore;
}

- (void)setLmScore:(double)a3
{
  self->_lmScore = a3;
}

- (unsigned)tokenID
{
  return self->_tokenID;
}

- (void)setTokenID:(unsigned int)a3
{
  self->_tokenID = a3;
}

@end