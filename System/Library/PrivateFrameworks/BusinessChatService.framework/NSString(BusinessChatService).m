@interface NSString(BusinessChatService)
- (id)prefixedBizID;
- (id)stringByRemovingOccurancesOfCharacter:()BusinessChatService fromPosition:;
- (uint64_t)bizIDWithoutPrefix;
- (uint64_t)isBusinessID;
- (uint64_t)removeFilePrefix;
@end

@implementation NSString(BusinessChatService)

- (uint64_t)bizIDWithoutPrefix
{
  return [a1 stringByReplacingOccurrencesOfString:@"urn:biz:" withString:&stru_26C611188];
}

- (id)prefixedBizID
{
  if ([a1 isBusinessID])
  {
    v2 = (void *)[a1 copy];
  }
  else
  {
    v2 = [@"urn:biz:" stringByAppendingString:a1];
  }

  return v2;
}

- (uint64_t)isBusinessID
{
  v1 = [a1 lowercaseString];
  uint64_t v2 = [v1 hasPrefix:@"urn:biz:"];

  return v2;
}

- (uint64_t)removeFilePrefix
{
  return [a1 stringByReplacingOccurrencesOfString:@"file://" withString:&stru_26C611188];
}

- (id)stringByRemovingOccurancesOfCharacter:()BusinessChatService fromPosition:
{
  id v6 = a3;
  if ([a1 length])
  {
    v7 = (void *)[a1 copy];
    v8 = v7;
    if (a4) {
      uint64_t v9 = [v7 length] - 1;
    }
    else {
      uint64_t v9 = 0;
    }
    while (1)
    {
      v11 = objc_msgSend(v8, "substringWithRange:", v9, 1);
      if (![v11 isEqualToString:v6]) {
        break;
      }
      objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:options:range:", v6, &stru_26C611188, 2, v9, 1);
      id v10 = (id)objc_claimAutoreleasedReturnValue();

      if (a4) {
        uint64_t v9 = [v10 length] - 1;
      }
      else {
        uint64_t v9 = 0;
      }

      v8 = v10;
      if (![v10 length]) {
        goto LABEL_13;
      }
    }

    id v10 = v8;
  }
  else
  {
    id v10 = a1;
  }
LABEL_13:

  return v10;
}

@end