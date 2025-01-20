@interface NUIContainerView(NUISubclassHelpers)
@end

@implementation NUIContainerView(NUISubclassHelpers)

- (void)layoutFrameForArrangedSubview:()NUISubclassHelpers withProposedContentFrame:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AE653000, a2, OS_LOG_TYPE_ERROR, "View is not an arranged subviews %@.", (uint8_t *)&v2, 0xCu);
}

@end