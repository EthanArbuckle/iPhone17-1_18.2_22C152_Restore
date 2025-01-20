@interface AXTypingPrediction
- (NSString)fullWord;
- (NSString)prefix;
- (NSString)textToInsert;
- (_NSRange)rangeToReplace;
- (double)probability;
- (id)description;
- (void)setFullWord:(id)a3;
- (void)setPrefix:(id)a3;
- (void)setProbability:(double)a3;
- (void)setRangeToReplace:(_NSRange)a3;
- (void)setTextToInsert:(id)a3;
@end

@implementation AXTypingPrediction

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)AXTypingPrediction;
  v3 = [(AXTypingPrediction *)&v9 description];
  long long v8 = *(_OWORD *)&self->_fullWord;
  prefix = self->_prefix;
  v5 = NSStringFromRange(self->_rangeToReplace);
  v6 = [v3 stringByAppendingFormat:@" - fullWord %@, textToInsert %@, prefix %@, range to replace %@", v8, prefix, v5];

  return v6;
}

- (NSString)fullWord
{
  return self->_fullWord;
}

- (void)setFullWord:(id)a3
{
}

- (NSString)textToInsert
{
  return self->_textToInsert;
}

- (void)setTextToInsert:(id)a3
{
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
}

- (_NSRange)rangeToReplace
{
  NSUInteger length = self->_rangeToReplace.length;
  NSUInteger location = self->_rangeToReplace.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRangeToReplace:(_NSRange)a3
{
  self->_rangeToReplace = a3;
}

- (double)probability
{
  return self->_probability;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_textToInsert, 0);

  objc_storeStrong((id *)&self->_fullWord, 0);
}

@end