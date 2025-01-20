@interface NSProgress(MediaAnalysis)
- (uint64_t)vcp_childWithPendingUnitCount:()MediaAnalysis;
@end

@implementation NSProgress(MediaAnalysis)

- (uint64_t)vcp_childWithPendingUnitCount:()MediaAnalysis
{
  return [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:-1 parent:a1 pendingUnitCount:a3];
}

@end