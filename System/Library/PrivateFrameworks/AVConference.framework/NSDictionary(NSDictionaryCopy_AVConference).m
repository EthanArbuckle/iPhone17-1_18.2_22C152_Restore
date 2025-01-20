@interface NSDictionary(NSDictionaryCopy_AVConference)
- (id)copyGKSDeep;
@end

@implementation NSDictionary(NSDictionaryCopy_AVConference)

- (id)copyGKSDeep
{
  uint64_t v1 = [MEMORY[0x1E4F28F98] dataFromPropertyList:a1 format:200 errorDescription:0];
  v2 = (void *)[MEMORY[0x1E4F28F98] propertyListFromData:v1 mutabilityOption:0 format:0 errorDescription:0];

  return v2;
}

@end