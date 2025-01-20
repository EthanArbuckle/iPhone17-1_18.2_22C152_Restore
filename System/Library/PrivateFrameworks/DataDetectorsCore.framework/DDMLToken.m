@interface DDMLToken
- (DDMLTokenType)tokenType;
- (NSString)string;
- (_NSRange)range;
- (float)confidence;
- (void)setConfidence:(float)a3;
- (void)setRange:(_NSRange)a3;
- (void)setString:(id)a3;
- (void)setTokenType:(id)a3;
@end

@implementation DDMLToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);

  objc_storeStrong((id *)&self->_tokenType, 0);
}

- (void)setRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_range, &v3, 16, 1, 0);
}

- (_NSRange)range
{
  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setString:(id)a3
{
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTokenType:(id)a3
{
}

- (DDMLTokenType)tokenType
{
  return (DDMLTokenType *)objc_getProperty(self, a2, 16, 1);
}

@end