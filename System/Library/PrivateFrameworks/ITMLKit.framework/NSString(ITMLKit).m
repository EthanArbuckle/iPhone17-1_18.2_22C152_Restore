@interface NSString(ITMLKit)
+ (uint64_t)ik_valueForBooleanAttribute:()ITMLKit;
- (id)ik_sharedInstance;
- (id)ik_sharedInstanceForDataKeysDomain;
- (id)ik_sharedInstanceForDomain:()ITMLKit;
- (id)ik_stringByTrimmingControlChars;
- (uint64_t)ik_attributeBoolValue;
@end

@implementation NSString(ITMLKit)

- (id)ik_sharedInstance
{
  if (ik_sharedInstance_onceToken != -1) {
    dispatch_once(&ik_sharedInstance_onceToken, &__block_literal_global_13);
  }
  id v2 = (id)sSharedStrings;
  objc_sync_enter(v2);
  v3 = [(id)sSharedStrings objectForKeyedSubscript:a1];
  if (!v3)
  {
    v3 = (void *)[a1 copy];
    [(id)sSharedStrings setObject:v3 forKeyedSubscript:v3];
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)ik_sharedInstanceForDataKeysDomain
{
  if (ik_sharedInstanceForDataKeysDomain_onceToken != -1) {
    dispatch_once(&ik_sharedInstanceForDataKeysDomain_onceToken, &__block_literal_global_2);
  }
  id v2 = (id)sSharedDataKeys;
  objc_sync_enter(v2);
  v3 = [(id)sSharedDataKeys objectForKey:a1];
  if (!v3)
  {
    v3 = (void *)[a1 copy];
    [(id)sSharedDataKeys setObject:v3 forKey:v3];
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)ik_sharedInstanceForDomain:()ITMLKit
{
  if (a3 == 1)
  {
    v3 = objc_msgSend(a1, "ik_sharedInstanceForDataKeysDomain");
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(a1, "ik_sharedInstance");
  }
  return v3;
}

+ (uint64_t)ik_valueForBooleanAttribute:()ITMLKit
{
  id v3 = a3;
  if ([v3 length] && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v4 = [v3 BOOLValue];
  }
  else {
    uint64_t v4 = -1;
  }

  return v4;
}

- (uint64_t)ik_attributeBoolValue
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [a1 BOOLValue];
}

- (id)ik_stringByTrimmingControlChars
{
  id v2 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"[\\u000E-\\u001F|\\u0001-\\u0008|\\u000B|\\u000C]" options:1 error:0];
  id v3 = objc_msgSend(v2, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, objc_msgSend(a1, "length"), &stru_1F3E09950);

  return v3;
}

@end