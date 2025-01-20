@interface IMDXMSUtilities
+ (id)calculateFallbackHashFragmentFor:(id)a3;
@end

@implementation IMDXMSUtilities

+ (id)calculateFallbackHashFragmentFor:(id)a3
{
  v3 = IMDCTPartDictionaryContentLocationKey;
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:v3];
  id v6 = SMSCopySanitizedContentLocation(v5);

  v7 = [v6 lowercaseString];
  v8 = [v4 objectForKeyedSubscript:IMDCTPartDictionaryContentDataKey];

  v9 = [NSString stringWithFormat:@"|%@(%llu)", v7, objc_msgSend(v8, "length") / 0x64uLL];

  return v9;
}

@end