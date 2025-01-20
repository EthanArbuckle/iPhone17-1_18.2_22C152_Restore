@interface IMAssistantMessagePlayMessageSoundHandler
- (id)playSendSoundForMessageGUID:(id)a3;
- (void)handlePlayMessageSound:(id)a3 completion:(id)a4;
@end

@implementation IMAssistantMessagePlayMessageSoundHandler

- (void)handlePlayMessageSound:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_22C1AD000, v8, OS_LOG_TYPE_INFO, "Handling INPlayMessageSoundIntent: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  v9 = [v6 messageIdentifier];
  uint64_t v10 = [v6 soundType];
  if (!v10)
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x263F0FD68]) initWithCode:4 userActivity:0];
    goto LABEL_9;
  }
  if (v10 == 1)
  {
    uint64_t v11 = [(IMAssistantMessagePlayMessageSoundHandler *)self playSendSoundForMessageGUID:v9];
LABEL_9:
    v12 = (void *)v11;
    goto LABEL_11;
  }
  v12 = 0;
LABEL_11:
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v12;
      _os_log_impl(&dword_22C1AD000, v13, OS_LOG_TYPE_INFO, "Calling completion with INPlayMessageSoundIntentResponse: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  v7[2](v7, v12);
}

- (id)playSendSoundForMessageGUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_22C1AD000, v4, OS_LOG_TYPE_INFO, "Playing send sounds for messageGUID: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  v5 = [MEMORY[0x263F4A568] sharedInstance];
  [v5 playSendSoundForMessageGUID:v3 callerOrigin:1];

  id v6 = (void *)[objc_alloc(MEMORY[0x263F0FD68]) initWithCode:3 userActivity:0];

  return v6;
}

@end