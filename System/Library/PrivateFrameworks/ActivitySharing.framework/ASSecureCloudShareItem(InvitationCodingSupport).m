@interface ASSecureCloudShareItem(InvitationCodingSupport)
- (void)codableShareItem;
@end

@implementation ASSecureCloudShareItem(InvitationCodingSupport)

- (void)codableShareItem
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21EC60000, a2, OS_LOG_TYPE_ERROR, "Error archiving share item error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end