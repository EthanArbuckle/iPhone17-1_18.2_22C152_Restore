@interface NSDictionary(GK_NSDictionaryDeepMutableCopy)
- (id)copyGKSDeepMutable;
@end

@implementation NSDictionary(GK_NSDictionaryDeepMutableCopy)

- (id)copyGKSDeepMutable
{
  uint64_t v1 = [MEMORY[0x1E4F28F98] dataFromPropertyList:a1 format:200 errorDescription:0];
  v2 = (void *)[MEMORY[0x1E4F28F98] propertyListFromData:v1 mutabilityOption:1 format:0 errorDescription:0];

  return v2;
}

@end