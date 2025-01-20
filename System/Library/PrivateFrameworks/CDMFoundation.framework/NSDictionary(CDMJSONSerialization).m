@interface NSDictionary(CDMJSONSerialization)
- (id)_cdm_JSONString;
@end

@implementation NSDictionary(CDMJSONSerialization)

- (id)_cdm_JSONString
{
  v2 = (void *)MEMORY[0x22A656D00]();
  if (DeepCopy) {
    DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], DeepCopy, 1uLL);
  }
  objc_msgSend(DeepCopy, "_cdm_safeJSONTraverse");
  v3 = [MEMORY[0x263F08900] dataWithJSONObject:DeepCopy options:0 error:0];
  v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];

  return v4;
}

@end