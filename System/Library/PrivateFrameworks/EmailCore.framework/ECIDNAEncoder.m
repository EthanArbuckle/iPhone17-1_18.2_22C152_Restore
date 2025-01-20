@interface ECIDNAEncoder
+ (BOOL)encodingRequiredForDomainName:(id)a3;
+ (id)stringByEncodingDomainName:(id)a3;
@end

@implementation ECIDNAEncoder

+ (id)stringByEncodingDomainName:(id)a3
{
  id v4 = a3;
  if ([v4 length] && (objc_msgSend(a1, "encodingRequiredForDomainName:", v4) & 1) != 0)
  {
    uint64_t v5 = _stringByApplyingIDNATranslationWithRange(v4, MEMORY[0x1E4FBA618]);
  }
  else
  {
    uint64_t v5 = [v4 copy];
  }
  v6 = (void *)v5;

  return v6;
}

+ (BOOL)encodingRequiredForDomainName:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F28B88], "ef_unsafeDomainNameCharacterSet");
  BOOL v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v4, 0, 0, objc_msgSend(v3, "length")) != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

@end