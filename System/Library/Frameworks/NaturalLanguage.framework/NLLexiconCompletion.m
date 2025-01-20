@interface NLLexiconCompletion
- (NLLexiconCompletion)initWithTokenID:(unsigned int)a3 score:(double)a4;
- (double)score;
- (id)description;
- (unsigned)tokenID;
@end

@implementation NLLexiconCompletion

- (NLLexiconCompletion)initWithTokenID:(unsigned int)a3 score:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NLLexiconCompletion;
  result = [(NLLexiconCompletion *)&v7 init];
  if (result)
  {
    result->_tokenID = a3;
    result->_score = a4;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%u %.4g>", self->_tokenID, *(void *)&self->_score);
}

- (unsigned)tokenID
{
  return self->_tokenID;
}

- (double)score
{
  return self->_score;
}

@end