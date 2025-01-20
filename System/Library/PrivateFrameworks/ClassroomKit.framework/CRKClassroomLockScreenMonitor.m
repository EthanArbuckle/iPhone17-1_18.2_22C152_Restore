@interface CRKClassroomLockScreenMonitor
@end

@implementation CRKClassroomLockScreenMonitor

uint64_t __51__CRKClassroomLockScreenMonitor_iOS_startObserving__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setClassroomLockScreenVisible:1];
}

uint64_t __51__CRKClassroomLockScreenMonitor_iOS_startObserving__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setClassroomLockScreenVisible:0];
}

@end