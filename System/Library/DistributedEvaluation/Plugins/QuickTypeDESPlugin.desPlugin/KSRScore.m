@interface KSRScore
- (KSRScore)initWithTotalCount:(unint64_t)a3 andSavedCount:(unint64_t)a4;
- (double)ksrScore;
- (unint64_t)numCharacters;
- (unint64_t)numSavedCharacters;
- (void)setKsrScore:(double)a3;
- (void)setNumCharacters:(unint64_t)a3;
- (void)setNumSavedCharacters:(unint64_t)a3;
@end

@implementation KSRScore

- (KSRScore)initWithTotalCount:(unint64_t)a3 andSavedCount:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)KSRScore;
  v6 = [(KSRScore *)&v11 init];
  v7 = v6;
  if (v6)
  {
    [(KSRScore *)v6 setNumCharacters:a3];
    [(KSRScore *)v7 setNumSavedCharacters:a4];
    if ([(KSRScore *)v7 numCharacters])
    {
      unint64_t v8 = [(KSRScore *)v7 numSavedCharacters];
      double v9 = (double)v8 / (double)[(KSRScore *)v7 numCharacters];
    }
    else
    {
      double v9 = 0.0;
    }
    [(KSRScore *)v7 setKsrScore:v9];
  }
  return v7;
}

- (unint64_t)numSavedCharacters
{
  return self->_numSavedCharacters;
}

- (void)setNumSavedCharacters:(unint64_t)a3
{
  self->_numSavedCharacters = a3;
}

- (unint64_t)numCharacters
{
  return self->_numCharacters;
}

- (void)setNumCharacters:(unint64_t)a3
{
  self->_numCharacters = a3;
}

- (double)ksrScore
{
  return self->_ksrScore;
}

- (void)setKsrScore:(double)a3
{
  self->_ksrScore = a3;
}

@end