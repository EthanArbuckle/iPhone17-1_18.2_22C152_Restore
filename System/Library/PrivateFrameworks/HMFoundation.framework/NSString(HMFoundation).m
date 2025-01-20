@interface NSString(HMFoundation)
- (BOOL)hmf_isInteger;
- (id)hmf_stringWithSmallestEncoding;
@end

@implementation NSString(HMFoundation)

- (id)hmf_stringWithSmallestEncoding
{
  id v1 = a1;
  uint64_t v2 = [v1 cStringUsingEncoding:1];
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = NSString;
    uint64_t v5 = 1;
LABEL_5:
    id v9 = [v4 stringWithCString:v3 encoding:v5];
    goto LABEL_6;
  }
  uint64_t v6 = [v1 smallestEncoding];
  id v7 = v1;
  uint64_t v8 = [v7 cStringUsingEncoding:v6];
  if (v8)
  {
    uint64_t v3 = v8;
    v4 = NSString;
    uint64_t v5 = v6;
    goto LABEL_5;
  }
  id v9 = v7;
LABEL_6:
  return v9;
}

- (BOOL)hmf_isInteger
{
  id v1 = (void *)MEMORY[0x1E4F28B88];
  id v2 = a1;
  uint64_t v3 = [v1 whitespaceCharacterSet];
  v4 = [v2 stringByTrimmingCharactersInSet:v3];

  uint64_t v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"+-"];
  uint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];

  id v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  id v9 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  v10 = [v9 invertedSet];

  BOOL v11 = [v8 rangeOfCharacterFromSet:v10] == 0x7FFFFFFFFFFFFFFFLL;
  return v11;
}

@end