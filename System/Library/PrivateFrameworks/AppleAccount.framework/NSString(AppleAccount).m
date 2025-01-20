@interface NSString(AppleAccount)
- (__CFString)unredactedSuffixOfLength:()AppleAccount;
- (id)aa_base64String;
- (id)trim;
@end

@implementation NSString(AppleAccount)

- (id)aa_base64String
{
  v4 = [a1 dataUsingEncoding:4 allowLossyConversion:0];
  if (!v4)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"NSString+AppleAccount.m" lineNumber:17 description:@"Failed to get UTF8 encoding!"];
  }
  v5 = [v4 base64EncodedStringWithOptions:0];

  return v5;
}

- (id)trim
{
  v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v3 = [a1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

- (__CFString)unredactedSuffixOfLength:()AppleAccount
{
  v4 = objc_msgSend(a1, "substringFromIndex:", objc_msgSend(a1, "length") - a3);
  if ([v4 isEqualToString:a1]) {
    v5 = @"[REDACTED]";
  }
  else {
    v5 = v4;
  }

  return v5;
}

@end