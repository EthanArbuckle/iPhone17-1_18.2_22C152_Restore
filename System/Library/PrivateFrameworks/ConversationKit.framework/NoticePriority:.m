@interface NoticePriority:
- (uint64_t)NoticeQueue;
@end

@implementation NoticePriority:

- (uint64_t)NoticeQueue
{
  return swift_release();
}

@end