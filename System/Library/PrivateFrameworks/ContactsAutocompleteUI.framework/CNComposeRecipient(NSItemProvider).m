@interface CNComposeRecipient(NSItemProvider)
@end

@implementation CNComposeRecipient(NSItemProvider)

+ (void)objectWithItemProviderData:()NSItemProvider typeIdentifier:error:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 localizedDescription];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1B5AF5000, a2, OS_LOG_TYPE_ERROR, "Failed to decode a compose recipient: %@", (uint8_t *)&v4, 0xCu);
}

@end