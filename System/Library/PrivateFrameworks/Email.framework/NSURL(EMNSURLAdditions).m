@interface NSURL(EMNSURLAdditions)
+ (id)em_mailToFromQueryItemKey;
- (BOOL)em_isAccountURL;
- (BOOL)em_isInternalMessageURL;
- (BOOL)em_isMailboxURL;
- (BOOL)em_isMessageURL;
- (EMInternalMessageID)em_internalMessageID;
- (id)em_messageIDHeader;
@end

@implementation NSURL(EMNSURLAdditions)

+ (id)em_mailToFromQueryItemKey
{
  if (em_mailToFromQueryItemKey_onceToken != -1) {
    dispatch_once(&em_mailToFromQueryItemKey_onceToken, &__block_literal_global_39);
  }
  v0 = (void *)em_mailToFromQueryItemKey_mailToFromQueryItem;
  return v0;
}

- (BOOL)em_isMessageURL
{
  v1 = objc_msgSend(a1, "em_messageIDHeader");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)em_messageIDHeader
{
  if (objc_msgSend(a1, "ef_hasScheme:", @"message"))
  {
    BOOL v2 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
    [v2 setQuery:0];
    v3 = [v2 URL];
    v4 = [v3 absoluteString];

    v5 = [v4 substringFromIndex:objc_msgSend(@"message", "length") + 1];
    if ([v5 hasPrefix:@"//"])
    {
      uint64_t v6 = [v5 substringFromIndex:objc_msgSend(@"//", "length")];

      v5 = (void *)v6;
    }
    v7 = [v5 stringByRemovingPercentEncoding];

    if (-[NSURL _isValidMessageID:]((BOOL)a1, v7)) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (BOOL)em_isInternalMessageURL
{
  v1 = -[NSURL _databaseID](a1);
  BOOL v2 = v1 != 0;

  return v2;
}

- (EMInternalMessageID)em_internalMessageID
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v2 = -[NSURL _databaseID](a1);
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v4 = objc_msgSend(v3, "queryItems", 0);
    v5 = (void *)[v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v4);
          }
          v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v9 = [v8 name];
          if ([v9 caseInsensitiveCompare:@"uuid"])
          {
          }
          else
          {
            v10 = [v8 value];
            BOOL v11 = v10 == 0;

            if (!v11)
            {
              v5 = [v8 value];
              goto LABEL_15;
            }
          }
        }
        v5 = (void *)[v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    v12 = -[EMInternalMessageID initWithDatabaseID:externalID:]([EMInternalMessageID alloc], "initWithDatabaseID:externalID:", [v2 longLongValue], v5);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)em_isAccountURL
{
  if (!-[NSURL _hasAccountScheme]((uint64_t)a1)) {
    return 0;
  }
  BOOL v2 = [a1 host];
  uint64_t v3 = [v2 length];

  if (!v3) {
    return 0;
  }
  v4 = [a1 pathComponents];
  BOOL v5 = (unint64_t)[v4 count] < 2;

  return v5;
}

- (BOOL)em_isMailboxURL
{
  if (!-[NSURL _hasAccountScheme]((uint64_t)a1)) {
    return 0;
  }
  BOOL v2 = [a1 host];
  uint64_t v3 = [v2 length];

  if (!v3) {
    return 0;
  }
  v4 = [a1 pathComponents];
  BOOL v5 = (unint64_t)[v4 count] > 1;

  return v5;
}

@end