@interface NSDictionary
- (id)_copyMessageDictionaryForLogging;
@end

@implementation NSDictionary

- (id)_copyMessageDictionaryForLogging
{
  id v2 = [(NSDictionary *)self mutableCopy];
  uint64_t v3 = IDSIncomingMessageDecryptedDataKey;
  if (objc_msgSend(objc_msgSend(v2, "objectForKey:", IDSIncomingMessageDecryptedDataKey), "length")) {
    [v2 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<data of length %lu>", objc_msgSend(objc_msgSend(v2, "objectForKey:", v3), "length")), v3 forKey];
  }
  return v2;
}

@end