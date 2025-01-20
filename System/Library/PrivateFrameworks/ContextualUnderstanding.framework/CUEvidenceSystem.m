@interface CUEvidenceSystem
+ (void)start;
- (CUEvidenceSystem)init;
@end

@implementation CUEvidenceSystem

+ (void)start
{
}

- (CUEvidenceSystem)init
{
  return (CUEvidenceSystem *)EvidenceSystem.init()();
}

@end