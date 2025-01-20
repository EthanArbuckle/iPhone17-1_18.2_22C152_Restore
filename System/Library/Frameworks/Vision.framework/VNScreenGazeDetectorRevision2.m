@interface VNScreenGazeDetectorRevision2
+ (BOOL)modelFullyANEResident;
+ (BOOL)supportsExecution;
@end

@implementation VNScreenGazeDetectorRevision2

+ (BOOL)modelFullyANEResident
{
  v2 = VNANEArchitectureName();
  v3 = VNANEGenerationNumberForArchitectureName((uint64_t)v2, 0);
  BOOL v4 = [v3 integerValue] != 13;

  return v4;
}

+ (BOOL)supportsExecution
{
  v2 = VNANEArchitectureName();
  v3 = VNANEGenerationNumberForArchitectureName((uint64_t)v2, 0);
  BOOL v4 = (unint64_t)[v3 integerValue] > 0xC;

  return v4;
}

@end