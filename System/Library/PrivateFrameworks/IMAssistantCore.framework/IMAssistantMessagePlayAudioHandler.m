@interface IMAssistantMessagePlayAudioHandler
- (id)activeAudioPlayer;
- (id)createAudioPlayerWithIdentifier:(id)a3;
- (void)confirmPlayAudioMessage:(id)a3 completion:(id)a4;
- (void)handlePlayAudioMessage:(id)a3 completion:(id)a4;
- (void)imAssistantAudioPlayer:(id)a3 didUpdateState:(int64_t)a4;
- (void)queryAudioMessageURLForIntent:(id)a3 completion:(id)a4;
@end

@implementation IMAssistantMessagePlayAudioHandler

- (void)handlePlayAudioMessage:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v6;
      _os_log_impl(&dword_22C1AD000, v8, OS_LOG_TYPE_INFO, "Performing intent: %@", buf, 0xCu);
    }
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_22C1C903C;
  v11[3] = &unk_2649129B8;
  v11[4] = self;
  objc_copyWeak(&v14, (id *)buf);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(IMAssistantMessagePlayAudioHandler *)self queryAudioMessageURLForIntent:v9 completion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)confirmPlayAudioMessage:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_22C1AD000, v8, OS_LOG_TYPE_INFO, "Confirm intent: %@", buf, 0xCu);
    }
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_22C1C94A8;
  v10[3] = &unk_2649129E0;
  id v11 = v7;
  id v9 = v7;
  [(IMAssistantMessagePlayAudioHandler *)self queryAudioMessageURLForIntent:v6 completion:v10];
}

- (void)queryAudioMessageURLForIntent:(id)a3 completion:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [a3 messageIdentifier];
  v8 = (void *)v7;
  if (v7)
  {
    v12[0] = v7;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_22C1C96F0;
    v10[3] = &unk_264912A08;
    id v11 = v6;
    [(IMAssistantMessageQueryHandler *)self SPIQueryMessagesWithGUIDs:v9 completion:v10];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (id)activeAudioPlayer
{
  return self->_audioPlayer;
}

- (id)createAudioPlayerWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [[IMAssistantAudioPlayer alloc] initWithDelegate:self identifier:v4];

  return v5;
}

- (void)imAssistantAudioPlayer:(id)a3 didUpdateState:(int64_t)a4
{
  if (self->_completionHandler)
  {
    uint64_t v5 = 4;
    if (a4 == 2) {
      uint64_t v5 = 2;
    }
    if (a4 == 1) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = v5;
    }
    id v8 = (id)[objc_alloc(MEMORY[0x263F0FD40]) initWithCode:v6 userActivity:0];
    (*((void (**)(void))self->_completionHandler + 2))();
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_audioPlayer, 0);
}

@end