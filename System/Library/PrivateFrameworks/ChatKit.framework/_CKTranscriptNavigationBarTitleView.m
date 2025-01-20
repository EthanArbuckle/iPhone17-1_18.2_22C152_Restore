@interface _CKTranscriptNavigationBarTitleView
- (void)didMoveToSuperview;
- (void)removeFromSuperview;
@end

@implementation _CKTranscriptNavigationBarTitleView

- (void)removeFromSuperview
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(_CKTranscriptNavigationBarTitleView *)self superview];
      *(_DWORD *)buf = 138412546;
      v7 = self;
      __int16 v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "_CKTranscriptNavigationBarTitleView instance\n {%@} is being removed from its superview\n {%@}.", buf, 0x16u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)_CKTranscriptNavigationBarTitleView;
  [(_CKTranscriptNavigationBarTitleView *)&v5 removeFromSuperview];
}

- (void)didMoveToSuperview
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)_CKTranscriptNavigationBarTitleView;
  [(_CKTranscriptNavigationBarTitleView *)&v5 didMoveToSuperview];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(_CKTranscriptNavigationBarTitleView *)self superview];
      *(_DWORD *)buf = 138412546;
      v7 = self;
      __int16 v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "_CKTranscriptNavigationBarTitleView instance\n {%@} did move to superview\n {%@}.", buf, 0x16u);
    }
  }
}

@end