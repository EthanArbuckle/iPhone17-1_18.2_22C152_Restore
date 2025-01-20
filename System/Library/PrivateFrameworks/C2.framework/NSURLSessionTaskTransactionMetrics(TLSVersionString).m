@interface NSURLSessionTaskTransactionMetrics(TLSVersionString)
+ (__CFString)_c2_stringForTLSProtocolVersion:()TLSVersionString;
- (id)c2_NegotiatedTLSProtocolVersionString;
@end

@implementation NSURLSessionTaskTransactionMetrics(TLSVersionString)

- (id)c2_NegotiatedTLSProtocolVersionString
{
  v2 = objc_opt_class();
  v3 = [a1 negotiatedTLSProtocolVersion];
  v4 = objc_msgSend(v2, "_c2_stringForTLSProtocolVersion:", (unsigned __int16)objc_msgSend(v3, "unsignedLongLongValue"));

  return v4;
}

+ (__CFString)_c2_stringForTLSProtocolVersion:()TLSVersionString
{
  result = @"TLSv10";
  switch(a3)
  {
    case 769:
      return result;
    case 770:
      result = @"TLSv11";
      break;
    case 771:
      result = @"TLSv12";
      break;
    case 772:
      result = @"TLSv13";
      break;
    default:
      v4 = @"Unknown";
      if (a3 == 65279) {
        v4 = @"DTLSv10";
      }
      if (a3 == 65277) {
        result = @"DTLSv12";
      }
      else {
        result = v4;
      }
      break;
  }
  return result;
}

@end