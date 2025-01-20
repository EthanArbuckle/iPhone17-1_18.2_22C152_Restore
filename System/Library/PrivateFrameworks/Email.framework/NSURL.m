@interface NSURL
- (BOOL)_isValidMessageID:(BOOL)a1;
- (id)_databaseID;
- (uint64_t)_hasAccountScheme;
@end

@implementation NSURL

void __52__NSURL_EMNSURLAdditions__em_mailToFromQueryItemKey__block_invoke()
{
  uint64_t v0 = objc_msgSend(NSString, "ef_UUID");
  v1 = (void *)em_mailToFromQueryItemKey_mailToFromQueryItem;
  em_mailToFromQueryItemKey_mailToFromQueryItem = v0;
}

- (BOOL)_isValidMessageID:(BOOL)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1) {
    a1 = (unint64_t)[v3 length] >= 3
  }
      && [v4 characterAtIndex:0] == 60
      && objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "length") - 1) == 62;

  return a1;
}

- (id)_databaseID
{
  if (a1
    && objc_msgSend(a1, "ef_hasScheme:", @"x-apple-mail")
    && objc_msgSend(a1, "ef_hasHost:", @"message")
    && ([a1 pathComponents],
        v2 = objc_claimAutoreleasedReturnValue(),
        unint64_t v3 = [v2 count],
        v2,
        v3 >= 2)
    && ([a1 path], v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    v5 = [a1 path];
    if ([v5 hasPrefix:@"/"])
    {
      uint64_t v6 = [v5 substringFromIndex:1];

      v5 = (void *)v6;
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v7 setNumberStyle:0];
    v8 = [v7 numberFromString:v5];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (uint64_t)_hasAccountScheme
{
  if (result)
  {
    v1 = (void *)result;
    if ((objc_msgSend((id)result, "ef_hasScheme:", @"as") & 1) != 0
      || (objc_msgSend(v1, "ef_hasScheme:", @"ews") & 1) != 0
      || (objc_msgSend(v1, "ef_hasScheme:", @"imap") & 1) != 0
      || (objc_msgSend(v1, "ef_hasScheme:", @"local") & 1) != 0)
    {
      return 1;
    }
    else
    {
      return objc_msgSend(v1, "ef_hasScheme:", @"pop");
    }
  }
  return result;
}

@end