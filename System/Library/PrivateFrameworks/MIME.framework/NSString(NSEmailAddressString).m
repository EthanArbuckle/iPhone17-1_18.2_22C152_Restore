@interface NSString(NSEmailAddressString)
+ (void)mf_formattedAddressWithName:()NSEmailAddressString email:useQuotes:;
- (id)mf_copyDisplayEmailAddress;
- (uint64_t)mf_addressDomain;
- (uint64_t)mf_copyAddressComment;
- (uint64_t)mf_copyIDNADecodedEmailAddress;
- (uint64_t)mf_copyIDNAEncodedEmailAddress;
- (uint64_t)mf_copyUncommentedAddress;
- (uint64_t)mf_emailAddressesWithEquivalentDomains;
- (uint64_t)mf_rangeOfAddressDomain;
@end

@implementation NSString(NSEmailAddressString)

- (uint64_t)mf_emailAddressesWithEquivalentDomains
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(a1, "mf_rangeOfAddressDomain");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    return MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = v2;
  uint64_t v6 = v3;
  if (objc_msgSend(&unk_1F084A9B8, "containsObject:", objc_msgSend((id)objc_msgSend(a1, "substringWithRange:", v2, v3), "lowercaseString")))
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(&unk_1F084A9B8, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [&unk_1F084A9B8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(&unk_1F084A9B8);
          }
          v11 = objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v5, v6, *(void *)(*((void *)&v13 + 1) + 8 * i));
          if ([v11 isEqualToString:a1]) {
            [v4 insertObject:v11 atIndex:0];
          }
          else {
            [v4 addObject:v11];
          }
        }
        uint64_t v8 = [&unk_1F084A9B8 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v17 = a1;
    return [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  }
  return (uint64_t)v4;
}

- (uint64_t)mf_rangeOfAddressDomain
{
  return [MEMORY[0x1E4F605B0] rangeOfAddressDomainFromAddress:a1];
}

- (uint64_t)mf_copyUncommentedAddress
{
  v1 = objc_msgSend(a1, "ea_uncommentedAddress");
  return [v1 copy];
}

- (uint64_t)mf_copyAddressComment
{
  v1 = objc_msgSend(a1, "ea_addressComment");
  return [v1 copy];
}

+ (void)mf_formattedAddressWithName:()NSEmailAddressString email:useQuotes:
{
  uint64_t v8 = (void *)[MEMORY[0x1E4F28E78] string];
  uint64_t v9 = [(__CFString *)a3 length];
  if (v9)
  {
    CFIndex v10 = v9;
    [v8 appendString:a3];
    if (a5)
    {
      if (![(__CFString *)a3 hasPrefix:@"\""]
        || ([(__CFString *)a3 hasSuffix:@"\""] & 1) == 0)
      {
        CFCharacterSetRef v11 = (const __CFCharacterSet *)mf_formattedAddressWithName_email_useQuotes__requiresQuotes;
        if (!mf_formattedAddressWithName_email_useQuotes__requiresQuotes)
        {
          CFCharacterSetRef v12 = CFCharacterSetCreateWithCharactersInString(0, @"()<>[]:;@\\,.\"");
          _MFLockGlobalLock();
          if (mf_formattedAddressWithName_email_useQuotes__requiresQuotes) {
            CFRelease(v12);
          }
          else {
            mf_formattedAddressWithName_email_useQuotes__requiresQuotes = (uint64_t)v12;
          }
          _MFUnlockGlobalLock();
          CFCharacterSetRef v11 = (const __CFCharacterSet *)mf_formattedAddressWithName_email_useQuotes__requiresQuotes;
        }
        v16.location = 0;
        v16.length = v10;
        if (CFStringFindCharacterFromSet(a3, v11, v16, 0, 0))
        {
          objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", @"\\", @"\\\\", 0, 0, objc_msgSend(v8, "length"));
          objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", @"\", @"\\\", 0, 0, objc_msgSend(v8, "length"));
          objc_msgSend(v8, "replaceCharactersInRange:withString:", 0, 0, @"\"");
          objc_msgSend(v8, "replaceCharactersInRange:withString:", objc_msgSend(v8, "length"), 0, @"\"");
        }
      }
    }
  }
  if ([(__CFString *)a4 length])
  {
    if ([v8 length])
    {
      [v8 appendString:@" <"];
      [v8 appendString:a4];
      long long v13 = @">";
      long long v14 = v8;
    }
    else
    {
      long long v14 = v8;
      long long v13 = a4;
    }
    [v14 appendString:v13];
  }
  return v8;
}

- (uint64_t)mf_addressDomain
{
  v1 = objc_msgSend(a1, "mf_copyUncommentedAddress");
  uint64_t v2 = [v1 rangeOfString:@"@"];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v4 = v2 + v3, v2 + v3 >= (unint64_t)[v1 length])) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [v1 substringFromIndex:v4];
  }

  return v5;
}

- (id)mf_copyDisplayEmailAddress
{
  uint64_t v2 = objc_msgSend(a1, "mf_rangeOfAddressDomain");
  uint64_t v4 = objc_msgSend(a1, "mf_copyDisplayStringInRange:", v2, v3);
  if (![v4 containsString:&stru_1F0842B90]) {
    return v4;
  }
  uint64_t v5 = (void *)[v4 stringByReplacingOccurrencesOfString:&stru_1F0842B90 withString:&stru_1F08428B0];
  return v5;
}

- (uint64_t)mf_copyIDNADecodedEmailAddress
{
  v1 = (void *)[MEMORY[0x1E4F605B0] idnaDecodedAddressForAddress:a1];
  return [v1 copy];
}

- (uint64_t)mf_copyIDNAEncodedEmailAddress
{
  v1 = (void *)[MEMORY[0x1E4F605B0] idnaEncodedAddressForAddress:a1];
  return [v1 copy];
}

@end