@interface IMFocusStateManager(ChatKit)
- (uint64_t)chatMatchesActiveFocusMode:()ChatKit;
- (uint64_t)conversationMatchesActiveFocusMode:()ChatKit;
- (uint64_t)senderMatchesActiveFocusModeForMessage:()ChatKit;
- (uint64_t)updateFocusStateForCurrentFocusFilterActionAsync;
@end

@implementation IMFocusStateManager(ChatKit)

- (uint64_t)updateFocusStateForCurrentFocusFilterActionAsync
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Beginning updating focus filter action.", v4, 2u);
    }
  }
  return [a1 updateFocusStateForCurrentFocusFilterAction:&__block_literal_global_97];
}

- (uint64_t)conversationMatchesActiveFocusMode:()ChatKit
{
  v4 = [a3 chat];
  if (v4) {
    uint64_t v5 = [a1 chatMatchesActiveFocusMode:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

- (uint64_t)chatMatchesActiveFocusMode:()ChatKit
{
  v4 = [a3 participantDNDContactHandles];
  uint64_t v5 = [a1 activeFocusModeMatchesConversationWithHandles:v4];

  return v5;
}

- (uint64_t)senderMatchesActiveFocusModeForMessage:()ChatKit
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v4 = [a3 sender];
  uint64_t v5 = [v4 dndContactHandle];
  v6 = (void *)v5;
  if (v5)
  {
    v10[0] = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    uint64_t v8 = [a1 activeFocusModeMatchesConversationWithHandles:v7];
  }
  else
  {
    v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[IMFocusStateManager(ChatKit) senderMatchesActiveFocusModeForMessage:](v7);
    }
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)senderMatchesActiveFocusModeForMessage:()ChatKit .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Could not determine DNDContactHandle for message sender", v1, 2u);
}

@end