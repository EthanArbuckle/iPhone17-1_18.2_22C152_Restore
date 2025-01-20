@interface NSString(ECMessageBodyParser)
- (BOOL)ec_isAttribution;
- (BOOL)ec_isAttributionPrefix;
- (BOOL)ec_isForwardSeparator;
- (BOOL)ec_isSignature;
- (BOOL)ec_isWhitespace;
@end

@implementation NSString(ECMessageBodyParser)

- (BOOL)ec_isWhitespace
{
  if (!ec_isWhitespace_characterSet) {
    ec_isWhitespace_characterSet = (uint64_t)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B88], "ec_whitespaceNewlineAndTagCharacterSet"), "invertedSet");
  }
  return objc_msgSend(a1, "rangeOfCharacterFromSet:") == 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)ec_isAttribution
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FD8], "ec_attributionExpression"), "rangeOfFirstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)ec_isAttributionPrefix
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FD8], "ec_attributionPrefixExpression"), "rangeOfFirstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)ec_isForwardSeparator
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FD8], "ec_forwardSeparatorExpression"), "rangeOfFirstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)ec_isSignature
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FD8], "ec_signatureExpression"), "rangeOfFirstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length")) != 0x7FFFFFFFFFFFFFFFLL;
}

@end