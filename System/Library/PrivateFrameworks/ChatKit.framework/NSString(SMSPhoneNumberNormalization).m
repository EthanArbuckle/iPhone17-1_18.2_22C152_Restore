@interface NSString(SMSPhoneNumberNormalization)
- (id)unformattedPhoneNumber;
@end

@implementation NSString(SMSPhoneNumberNormalization)

- (id)unformattedPhoneNumber
{
  uint64_t v2 = [a1 length];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:v2];
  if (v2)
  {
    uint64_t v4 = 0;
    uint64_t v5 = MEMORY[0x1E4F14390];
    do
    {
      uint64_t v6 = [a1 characterAtIndex:v4];
      uint64_t v7 = v6;
      if (v6 > 0x7F) {
        int v8 = __maskrune(v6, 0x500uLL);
      }
      else {
        int v8 = *(_DWORD *)(v5 + 4 * v6 + 60) & 0x500;
      }
      if ((v7 & 0xFFFE) == 0x2A || v8)
      {
        v9 = objc_msgSend(NSString, "stringWithFormat:", @"%C", v7);
        [v3 appendString:v9];
      }
      ++v4;
    }
    while (v2 != v4);
  }

  return v3;
}

@end