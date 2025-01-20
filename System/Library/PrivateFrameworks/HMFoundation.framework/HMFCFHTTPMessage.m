@interface HMFCFHTTPMessage
@end

@implementation HMFCFHTTPMessage

void __34___HMFCFHTTPMessage_dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_56;
  _MergedGlobals_56 = (uint64_t)v0;

  [(id)_MergedGlobals_56 setDateFormat:@"EEE, d MMM yyyy HH:mm:ss z"];
  v2 = (void *)_MergedGlobals_56;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
  [v2 setLocale:v3];

  v4 = (void *)_MergedGlobals_56;
  id v5 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  [v4 setTimeZone:v5];
}

@end