@interface NSMutableDictionary(HMB)
+ (id)hmbDictionaryFromOPACKData:()HMB error:;
@end

@implementation NSMutableDictionary(HMB)

+ (id)hmbDictionaryFromOPACKData:()HMB error:
{
  v0 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hmbDictionaryFromOPACKData:error:");
  v1 = (void *)[v0 mutableCopy];

  return v1;
}

@end