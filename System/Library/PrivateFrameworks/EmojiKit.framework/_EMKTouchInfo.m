@interface _EMKTouchInfo
- (CGRect)frame;
- (EMKEmojiTokenList)tokenList;
- (_NSRange)tokenListRange;
- (void)setFrame:(CGRect)a3;
- (void)setTokenList:(id)a3;
- (void)setTokenListRange:(_NSRange)a3;
@end

@implementation _EMKTouchInfo

- (EMKEmojiTokenList)tokenList
{
  return (EMKEmojiTokenList *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTokenList:(id)a3
{
}

- (_NSRange)tokenListRange
{
  objc_copyStruct(v4, &self->_tokenListRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setTokenListRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_tokenListRange, &v3, 16, 1, 0);
}

- (CGRect)frame
{
  objc_copyStruct(v6, &self->_frame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_frame, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
}

@end