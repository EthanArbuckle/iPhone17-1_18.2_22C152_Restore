@interface CKNotifyAnywayChatItem(Layout)
@end

@implementation CKNotifyAnywayChatItem(Layout)

- (void)layoutItemSpacingWithEnvironment:()Layout datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "CKNotifyAnywayChatItem should not follow %{public}@", (uint8_t *)&v5, 0xCu);
}

@end