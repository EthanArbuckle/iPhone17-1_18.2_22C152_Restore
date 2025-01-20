@interface BPSPublisher(BMBookmarkableSink)
@end

@implementation BPSPublisher(BMBookmarkableSink)

- (void)sinkWithBookmark:()BMBookmarkableSink completion:receiveInput:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_1AD01F000, v0, OS_LOG_TYPE_FAULT, "Invoking sinkWithBookmark on a publisher chain where not all operators are bookmarkable", v1, 2u);
}

- (void)sinkWithBookmark:()BMBookmarkableSink completion:receiveInput:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1AD01F000, v0, v1, "Failed to setup pipeline since current publisher dosen't conform to BMBookmarkablePublisher", v2);
}

- (void)sinkWithBookmark:()BMBookmarkableSink completion:receiveInput:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AD01F000, a2, OS_LOG_TYPE_DEBUG, "Creating publisher with bookmark:\n%@", (uint8_t *)&v2, 0xCu);
}

@end