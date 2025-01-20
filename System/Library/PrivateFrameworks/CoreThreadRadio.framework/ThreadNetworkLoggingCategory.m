@interface ThreadNetworkLoggingCategory
@end

@implementation ThreadNetworkLoggingCategory

void __ThreadNetworkLoggingCategory_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.ThreadNetwork", "THClient");
  v2 = (void *)ThreadNetworkLoggingCategory_logHandles[0];
  ThreadNetworkLoggingCategory_logHandles[0] = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.ThreadNetwork", "THServer");
  v4 = (void *)qword_1004FC428;
  qword_1004FC428 = (uint64_t)v3;
}

@end