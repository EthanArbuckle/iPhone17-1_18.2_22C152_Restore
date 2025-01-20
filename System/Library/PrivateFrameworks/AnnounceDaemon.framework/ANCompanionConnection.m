@interface ANCompanionConnection
- (ANCompanionConnection)init;
- (ANCompanionConnectionDelegate)delegate;
- (OS_dispatch_queue)rapportQueue;
- (RPCompanionLinkClient)companionLinkClient;
- (void)_registerForEvents;
- (void)_setupLink;
- (void)_tearDownLink;
- (void)broadcastAnnouncementPlayed:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ANCompanionConnection

- (ANCompanionConnection)init
{
  v7.receiver = self;
  v7.super_class = (Class)ANCompanionConnection;
  v2 = [(ANCompanionConnection *)&v7 init];
  if (v2 && ([MEMORY[0x1E4F4A8E8] isPad] & 1) == 0)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.announce.coordinationServiceQueue", v3);
    rapportQueue = v2->_rapportQueue;
    v2->_rapportQueue = (OS_dispatch_queue *)v4;

    [(ANCompanionConnection *)v2 _setupLink];
  }
  return v2;
}

- (void)broadcastAnnouncementPlayed:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F4A8E8] isPad] & 1) == 0)
  {
    uint64_t v5 = *MEMORY[0x1E4F94748];
    v9[0] = @"announcementID";
    v9[1] = @"senderType";
    v10[0] = v4;
    v6 = [NSNumber numberWithUnsignedInteger:1];
    v10[1] = v6;
    objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

    v8 = [(ANCompanionConnection *)self companionLinkClient];
    [v8 sendEventID:@"com.apple.announce.AnnouncementPlayed" event:v7 destinationID:v5 options:0 completion:&__block_literal_global_32];
  }
}

void __53__ANCompanionConnection_broadcastAnnouncementPlayed___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = ANLogHandleCompanionConnection();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412546;
      v6 = &stru_1F34A0E10;
      __int16 v7 = 2112;
      id v8 = v2;
      _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_ERROR, "%@Broadcast Announcement Played Event Failed: %@", (uint8_t *)&v5, 0x16u);
    }

    id v4 = +[ANAnalytics shared];
    [v4 error:5023];
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEFAULT, "%@Announcement Played Event Broadcasted Successfully", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_setupLink
{
  v3 = (RPCompanionLinkClient *)objc_opt_new();
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = v3;

  int v5 = [(ANCompanionConnection *)self rapportQueue];
  [(RPCompanionLinkClient *)self->_companionLinkClient setDispatchQueue:v5];

  [(RPCompanionLinkClient *)self->_companionLinkClient setControlFlags:32];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __35__ANCompanionConnection__setupLink__block_invoke;
  v9[3] = &unk_1E6BCDE80;
  objc_copyWeak(&v10, &location);
  [(RPCompanionLinkClient *)self->_companionLinkClient setInvalidationHandler:v9];
  v6 = self->_companionLinkClient;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__ANCompanionConnection__setupLink__block_invoke_2;
  v7[3] = &unk_1E6BCF0C8;
  objc_copyWeak(&v8, &location);
  [(RPCompanionLinkClient *)v6 activateWithCompletion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __35__ANCompanionConnection__setupLink__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _tearDownLink];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _setupLink];
}

void __35__ANCompanionConnection__setupLink__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ANLogHandleCompanionConnection();
  int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412546;
      id v8 = &stru_1F34A0E10;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_ERROR, "%@Error activating link '%@'", (uint8_t *)&v7, 0x16u);
    }

    id WeakRetained = +[ANAnalytics shared];
    [WeakRetained error:5024];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@Link activated succcessfully", (uint8_t *)&v7, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _registerForEvents];
  }
}

- (void)_tearDownLink
{
  self->_companionLinkClient = 0;
  MEMORY[0x1F41817F8]();
}

- (void)_registerForEvents
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = ANLogHandleCompanionConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v9 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "%@Registering for Event IDs", buf, 0xCu);
  }

  id v4 = [(ANCompanionConnection *)self companionLinkClient];
  [v4 deregisterEventID:@"com.apple.announce.AnnouncementPlayed"];

  objc_initWeak((id *)buf, self);
  int v5 = [(ANCompanionConnection *)self companionLinkClient];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__ANCompanionConnection__registerForEvents__block_invoke;
  v6[3] = &unk_1E6BCF0F0;
  objc_copyWeak(&v7, (id *)buf);
  [v5 registerEventID:@"com.apple.announce.AnnouncementPlayed" options:0 handler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __43__ANCompanionConnection__registerForEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = [a3 objectForKey:*MEMORY[0x1E4F947A8]];
  id v7 = [v5 valueForKey:@"senderType"];
  uint64_t v8 = [v7 unsignedIntegerValue];
  __int16 v9 = [v5 valueForKey:@"announcementID"];
  uint64_t v10 = ANLogHandleCompanionConnection();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412802;
    v16 = &stru_1F34A0E10;
    __int16 v17 = 2112;
    v18 = v6;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "%@Received Event from %@: %@", (uint8_t *)&v15, 0x20u);
  }

  if (v8 != 1)
  {
    v13 = ANLogHandleCompanionConnection();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [NSNumber numberWithUnsignedInteger:v8];
      int v15 = 138412546;
      v16 = &stru_1F34A0E10;
      __int16 v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_ERROR, "%@Unsupported Sender Type (%@). Ignoring Event.", (uint8_t *)&v15, 0x16u);
    }
    id WeakRetained = +[ANAnalytics shared];
    [WeakRetained error:5025];
    goto LABEL_9;
  }
  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v12 = [WeakRetained delegate];
    [v12 companionDidPlayAnnouncement:v9];

LABEL_9:
  }
}

- (ANCompanionConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ANCompanionConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (OS_dispatch_queue)rapportQueue
{
  return self->_rapportQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapportQueue, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end