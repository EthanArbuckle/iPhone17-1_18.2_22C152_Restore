@interface NSError(HFAdditions)
- (BOOL)hf_isAlreadyPairedError;
- (BOOL)hf_isHFErrorWithCode:()HFAdditions;
- (BOOL)hf_isHMErrorWithCode:()HFAdditions;
- (BOOL)hf_isHMErrorWithCodePrivate:()HFAdditions;
- (BOOL)hf_isHMHomeWalletKeyErrorWithCode:()HFAdditions;
- (BOOL)hf_isPublicHMError;
- (BOOL)hf_isThreadNetworkRequiredError;
- (id)hf_errorWithAddedUserInfo:()HFAdditions;
- (uint64_t)hf_isHomeKitNamingError;
- (uint64_t)hf_isHomeKitUnreachableError;
@end

@implementation NSError(HFAdditions)

- (BOOL)hf_isHFErrorWithCode:()HFAdditions
{
  v5 = [a1 domain];
  if ([v5 isEqualToString:@"HFErrorDomain"]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (uint64_t)hf_isHomeKitNamingError
{
  if (_MergedGlobals_327 != -1) {
    dispatch_once(&_MergedGlobals_327, &__block_literal_global_3_35);
  }
  id v2 = (id)qword_26AB2FEC8;
  v3 = [a1 domain];
  if ([v3 isEqualToString:*MEMORY[0x263F0C710]])
  {
    v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "code"));
    uint64_t v5 = [v2 containsObject:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)hf_isHomeKitUnreachableError
{
  int v2 = objc_msgSend(a1, "hf_isHFErrorWithCode:", 35);
  return v2 | objc_msgSend(a1, "hf_isHMErrorWithCode:", 4);
}

- (BOOL)hf_isHMErrorWithCode:()HFAdditions
{
  uint64_t v5 = [a1 domain];
  if ([v5 isEqualToString:*MEMORY[0x263F0C710]]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)hf_isHMErrorWithCodePrivate:()HFAdditions
{
  uint64_t v5 = [a1 domain];
  if ([v5 isEqualToString:*MEMORY[0x263F0C710]]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)hf_isHMHomeWalletKeyErrorWithCode:()HFAdditions
{
  uint64_t v5 = [a1 domain];
  if ([v5 isEqualToString:*MEMORY[0x263F0CF50]]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)hf_isPublicHMError
{
  int v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x263F0C710]]) {
    BOOL v3 = [a1 code] < 2001;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)hf_errorWithAddedUserInfo:()HFAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 userInfo];
  BOOL v6 = (void *)[v5 mutableCopy];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v9 = v8;

  [v9 addEntriesFromDictionary:v4];
  v10 = (void *)MEMORY[0x263F087E8];
  v11 = [a1 domain];
  v12 = objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, objc_msgSend(a1, "code"), v9);

  return v12;
}

- (BOOL)hf_isThreadNetworkRequiredError
{
  int v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x263F0C710]]) {
    BOOL v3 = [a1 code] == 2009 || objc_msgSend(a1, "code") == 2010;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)hf_isAlreadyPairedError
{
  int v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x263F0C710]]) {
    BOOL v3 = [a1 code] == 13 || objc_msgSend(a1, "code") == 11;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

@end