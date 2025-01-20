@interface BPSCollect(BMBookmarkOperators)
@end

@implementation BPSCollect(BMBookmarkOperators)

+ (void)publisherWithPublisher:()BMBookmarkOperators upstreams:bookmarkState:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AD01F000, log, OS_LOG_TYPE_ERROR, "Can't get valid upstreams", v1, 2u);
}

@end