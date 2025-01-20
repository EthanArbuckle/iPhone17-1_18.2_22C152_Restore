@interface BPSWindower(BMBookmarkOperators)
- (void)bookmarkableUpstreams;
@end

@implementation BPSWindower(BMBookmarkOperators)

- (void)bookmarkableUpstreams
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AD01F000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil upstream in BPSWindower", v1, 2u);
}

@end