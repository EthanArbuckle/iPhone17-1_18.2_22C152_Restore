@interface NSString(AAMessage)
+ (id)aa_handleForIDSDestination:()AAMessage;
- (id)_phoneNumberDetector;
- (uint64_t)aa_appearsToBeEmail;
- (uint64_t)aa_appearsToBePhoneNumber;
@end

@implementation NSString(AAMessage)

- (uint64_t)aa_appearsToBeEmail
{
  uint64_t result = [a1 length];
  if (result)
  {
    return [a1 _appearsToBeEmail];
  }
  return result;
}

- (id)_phoneNumberDetector
{
  if (_phoneNumberDetector_onceToken != -1) {
    dispatch_once(&_phoneNumberDetector_onceToken, &__block_literal_global_12);
  }
  v0 = (void *)_phoneNumberDetector;

  return v0;
}

- (uint64_t)aa_appearsToBePhoneNumber
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 length];
  if (v2)
  {
    v3 = [a1 _phoneNumberDetector];
    v4 = objc_msgSend(v3, "matchesInString:options:range:", a1, 0, 0, v2);

    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v5 = v4;
    uint64_t v2 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v2)
    {
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v2; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "resultType", (void)v9) == 2048)
          {
            uint64_t v2 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v2 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v2) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return v2;
}

+ (id)aa_handleForIDSDestination:()AAMessage
{
  v0 = (void *)IDSCopyRawAddressForDestination();

  return v0;
}

@end