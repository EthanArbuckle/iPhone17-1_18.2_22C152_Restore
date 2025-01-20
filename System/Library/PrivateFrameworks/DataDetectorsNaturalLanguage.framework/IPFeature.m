@interface IPFeature
- (BOOL)isMatchStringInsideQuotationMarks;
- (NSString)textUnit;
- (_NSRange)matchRange;
- (double)confidence;
- (double)weight;
- (id)description;
- (id)matchString;
- (void)setConfidence:(double)a3;
- (void)setMatchRange:(_NSRange)a3;
- (void)setTextUnit:(id)a3;
- (void)setWeight:(double)a3;
@end

@implementation IPFeature

- (id)matchString
{
  v3 = [(IPFeature *)self textUnit];
  unint64_t v4 = [v3 length];
  uint64_t v5 = [(IPFeature *)self matchRange];
  v7 = 0;
  BOOL v8 = __CFADD__(v6, v5);
  if (v6 && v4 && !v8 && v5 + v6 <= v4)
  {
    v7 = objc_msgSend(v3, "substringWithRange:", v5, v6);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)IPFeature;
  unint64_t v4 = [(IPFeature *)&v8 description];
  uint64_t v5 = [(IPFeature *)self matchString];
  uint64_t v6 = [v3 stringWithFormat:@"%@ [%@]", v4, v5];

  return v6;
}

- (BOOL)isMatchStringInsideQuotationMarks
{
  uint64_t v3 = [(IPFeature *)self matchRange];
  uint64_t v5 = v4;
  uint64_t v6 = [(IPFeature *)self textUnit];
  BOOL v7 = +[IPRegexToolbox isRangeInsideQuotationMarks:text:limitToSurroundingText:](IPRegexToolbox, "isRangeInsideQuotationMarks:text:limitToSurroundingText:", v3, v5, v6, 1);

  return v7;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (_NSRange)matchRange
{
  objc_copyStruct(v4, &self->_matchRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setMatchRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_matchRange, &v3, 16, 1, 0);
}

- (NSString)textUnit
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTextUnit:(id)a3
{
}

- (void).cxx_destruct
{
}

@end