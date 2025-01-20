@interface IMDLocationSharingController
+ (id)sharedInstance;
+ (void)_addLocationShareItemToMatchingChats:(id)a3 handleID:(id)a4 hasStoredItem:(BOOL)a5 broadcastChanges:(BOOL)a6;
+ (void)addLocationShareItemToMatchingChats:(id)a3;
- (FindMyLocateSession)fmlSession;
- (IMDLocationSharingController)init;
- (void)_configureFindMyLocateSession;
- (void)_forwardMappingPacket:(id)a3 toID:(id)a4 account:(id)a5;
- (void)_generateLocationSharingItemWithHandleID:(id)a3 direction:(int64_t)a4 action:(int64_t)a5;
- (void)_initializeFindMySessionIfInAllowedProcess;
- (void)_postFMLFriendshipChangeForHandleID:(id)a3 handleType:(int64_t)a4 updateType:(int64_t)a5 isFromMessages:(BOOL)a6;
- (void)_setUpFindMyLocateSessionCallbacks;
- (void)_startFMLSessionMonitoring;
- (void)dealloc;
- (void)didFailToHandleMappingPacket:(id)a3 error:(id)a4;
- (void)didStartAbilityToGetLocationForHandle:(id)a3;
- (void)didStartSharingMyLocationWithHandle:(id)a3;
- (void)didStopAbilityToGetLocationForHandle:(id)a3;
- (void)didStopSharingMyLocationWithHandle:(id)a3;
- (void)receivedIncomingLocationSharePacket:(id)a3;
- (void)sendMappingPacket:(id)a3 toHandle:(id)a4 account:(id)a5;
- (void)setFmlSession:(id)a3;
@end

@implementation IMDLocationSharingController

+ (id)sharedInstance
{
  if (qword_1EBE2B8A8 != -1) {
    dispatch_once(&qword_1EBE2B8A8, &unk_1F3391940);
  }
  return (id)qword_1EBE2B9E0;
}

- (IMDLocationSharingController)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMDLocationSharingController;
  v2 = [(IMDLocationSharingController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IMDLocationSharingController *)v2 _initializeFindMySessionIfInAllowedProcess];
  }
  return v3;
}

- (void)_initializeFindMySessionIfInAllowedProcess
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F6E730] deviceIsLockedDown];
  int v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags"), "isWaldoEnabled");
  if (IMIsRunningInImagent())
  {
    int v5 = 1;
    if (v3)
    {
LABEL_11:
      v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1D990420C(v10);
      }
      return;
    }
  }
  else
  {
    int v5 = IMIsRunningInMessagesUIProcess();
    if (v3) {
      goto LABEL_11;
    }
  }
  if (!(v4 ^ 1 | v5)) {
    goto LABEL_11;
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags"), "isFindMyLocateSessionEnabled"))
  {
    v6 = (objc_class *)MEMORY[0x1E0169C30](@"FindMyLocateSession", @"FindMyLocateObjCWrapper");
    if (v6)
    {
      self->_fmlSession = (FindMyLocateSession *)objc_alloc_init(v6);
      [(IMDLocationSharingController *)self _configureFindMyLocateSession];
      if (IMOSLoggingEnabled())
      {
        v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          fmlSession = self->_fmlSession;
          int v14 = 138412290;
          v15 = fmlSession;
          v9 = "Configured FindMyLocate Session: %@";
LABEL_17:
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v14, 0xCu);
        }
      }
    }
  }
  else
  {
    v11 = (objc_class *)MEMORY[0x1E0169C30](@"FMFSession", @"FMF");
    if (v11)
    {
      v12 = (FMFSession *)[[v11 alloc] initWithDelegate:self];
      self->_session = v12;
      -[FMFSession setDelegateQueue:](v12, "setDelegateQueue:", [MEMORY[0x1E4F28F08] mainQueue]);
      if (IMOSLoggingEnabled())
      {
        v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          session = self->_session;
          int v14 = 138412290;
          v15 = session;
          v9 = "Configured FMF Session: %@";
          goto LABEL_17;
        }
      }
    }
  }
}

- (void)_configureFindMyLocateSession
{
  [(IMDLocationSharingController *)self _setUpFindMyLocateSessionCallbacks];

  MEMORY[0x1F4181798](self, sel__startFMLSessionMonitoring);
}

- (void)_setUpFindMyLocateSessionCallbacks
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags"), "isFindMyLocateSessionEnabled"))
  {
    id location = 0;
    objc_initWeak(&location, self);
    char v3 = [(IMDLocationSharingController *)self fmlSession];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = sub_1D97D688C;
    v4[3] = &unk_1E6B76B30;
    objc_copyWeak(&v5, &location);
    [(FindMyLocateSession *)v3 setFriendshipUpdateCallback:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_postFMLFriendshipChangeForHandleID:(id)a3 handleType:(int64_t)a4 updateType:(int64_t)a5 isFromMessages:(BOOL)a6
{
  if (a4 == 1)
  {
    if (a5 == 1 && !a6)
    {
      uint64_t v6 = 1;
      goto LABEL_10;
    }
  }
  else if (!a4)
  {
    if (!a5)
    {
      uint64_t v6 = 0;
      uint64_t v7 = 1;
      goto LABEL_11;
    }
    if (a5 == 1 && !a6)
    {
      uint64_t v6 = 0;
LABEL_10:
      uint64_t v7 = 0;
LABEL_11:
      [(IMDLocationSharingController *)self _generateLocationSharingItemWithHandleID:a3 direction:v6 action:v7];
    }
  }
}

- (void)_startFMLSessionMonitoring
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags"), "isFindMyLocateSessionEnabled"))
  {
    if (IMOSLoggingEnabled())
    {
      char v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v4 = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "_startFMLSessionMonitoring: kicking off initial updates.", v4, 2u);
      }
    }
    [(FindMyLocateSession *)[(IMDLocationSharingController *)self fmlSession] startUpdatingFriendsWithInitialUpdates:0 completion:&unk_1F3391960];
  }
}

- (void)dealloc
{
  [(FMFSession *)self->_session setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)IMDLocationSharingController;
  [(IMDLocationSharingController *)&v3 dealloc];
}

+ (void)addLocationShareItemToMatchingChats:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "sender"), "length")) {
    uint64_t v4 = [a3 sender];
  }
  else {
    uint64_t v4 = [a3 otherHandle];
  }
  uint64_t v5 = v4;
  uint64_t v6 = objc_opt_class();

  [v6 _addLocationShareItemToMatchingChats:a3 handleID:v5 hasStoredItem:1 broadcastChanges:0];
}

+ (void)_addLocationShareItemToMatchingChats:(id)a3 handleID:(id)a4 hasStoredItem:(BOOL)a5 broadcastChanges:(BOOL)a6
{
  BOOL v31 = a6;
  BOOL v33 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = @"NO";
      *(_DWORD *)buf = 138413058;
      id v47 = a3;
      if (v33) {
        v9 = @"YES";
      }
      else {
        v9 = @"NO";
      }
      if (v31) {
        v8 = @"YES";
      }
      __int16 v48 = 2112;
      id v49 = a4;
      __int16 v50 = 2112;
      v51 = v9;
      __int16 v52 = 2112;
      v53 = v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Going to add location item: %@ to the corresponding chats with handleID: %@ hasStoredItem: %@ broadcastChanges: %@", buf, 0x2Au);
    }
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = [+[IMDChatRegistry sharedInstance] chats];
  uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v10)
  {
    id v12 = a3;
    if (!v33) {
      id v12 = 0;
    }
    id v34 = v12;
    uint64_t v13 = *(void *)v41;
    *(void *)&long long v11 = 138412546;
    long long v30 = v11;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(__CFString **)(*((void *)&v40 + 1) + 8 * i);
        if ([(__CFString *)v15 style] == 45)
        {
          uint64_t v16 = (void *)[(__CFString *)v15 serviceName];
          if ([v16 isEqualToIgnoringCase:*MEMORY[0x1E4F6E1B0]])
          {
            long long v38 = 0u;
            long long v39 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            v17 = (void *)[(__CFString *)v15 participants];
            uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v37;
              while (2)
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v37 != v19) {
                    objc_enumerationMutation(v17);
                  }
                  v21 = *(void **)(*((void *)&v36 + 1) + 8 * j);
                  if (objc_msgSend((id)objc_msgSend(v21, "ID"), "isEqualToIgnoringCase:", a4))
                  {
                    if (IMOSLoggingEnabled())
                    {
                      v26 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412802;
                        id v47 = a4;
                        __int16 v48 = 2112;
                        id v49 = v21;
                        __int16 v50 = 2112;
                        v51 = v15;
                        _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Found matching participant: %@<=>%@ in chat: %@", buf, 0x20u);
                      }
                    }
                    if (!v33)
                    {
                      if (IMOSLoggingEnabled())
                      {
                        v27 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 138412290;
                          id v47 = a3;
                          _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Storing item: %@", buf, 0xCu);
                        }
                      }
                      id v34 = [+[IMDMessageStore sharedInstance] storeItem:a3 forceReplace:1];
                    }
                    if (v34)
                    {
                      if (IMOSLoggingEnabled())
                      {
                        v28 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = v30;
                          id v47 = v34;
                          __int16 v48 = 2112;
                          id v49 = v15;
                          _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Associating item: %@ to chat: %@", buf, 0x16u);
                        }
                      }
                      [+[IMDChatRegistry sharedInstance] addItem:v34 toChat:v15];
                      if (v31) {
                        objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForChatListenersUsingBlackholeRegistry:](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForChatListenersUsingBlackholeRegistry:", -[__CFString isBlackholed](v15, "isBlackholed")), "account:chat:style:chatProperties:messageUpdated:", -[__CFString accountID](v15, "accountID"), -[__CFString chatIdentifier](v15, "chatIdentifier"), -[__CFString style](v15, "style"), 0, v34);
                      }
                    }
                    else
                    {
                      id v34 = 0;
                    }
                    LOBYTE(v33) = 1;
                    goto LABEL_50;
                  }
                }
                uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
                if (v18) {
                  continue;
                }
                break;
              }
            }
          }
          else if (IMOSLoggingEnabled())
          {
            v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v47 = v15;
              v23 = v25;
              v24 = "Not sharing location with non-iMessage chat %@";
              goto LABEL_33;
            }
          }
        }
        else if (IMOSLoggingEnabled())
        {
          v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v47 = v15;
            v23 = v22;
            v24 = "Not sharing location group chat %@";
LABEL_33:
            _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, v24, buf, 0xCu);
            continue;
          }
        }
LABEL_50:
        ;
      }
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v10);
  }
  if (!v33 && IMOSLoggingEnabled())
  {
    v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "No matching chat found, ignoring", buf, 2u);
    }
  }
}

- (void)_generateLocationSharingItemWithHandleID:(id)a3 direction:(int64_t)a4 action:(int64_t)a5
{
  id v8 = (id)[objc_alloc(MEMORY[0x1E4F6E800]) initWithSender:0 time:0 guid:0 type:4];
  [v8 setStatus:a5];
  [v8 setDirection:a4];
  [v8 setService:*MEMORY[0x1E4F6E1B0]];
  if (a4) {
    [v8 setSender:a3];
  }
  else {
    [v8 setOtherHandle:a3];
  }
  [(id)objc_opt_class() _addLocationShareItemToMatchingChats:v8 handleID:a3 hasStoredItem:0 broadcastChanges:1];
}

- (void)didStartSharingMyLocationWithHandle:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 identifier];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      id v8 = a3;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Started location sharing to: %@ (%@)", (uint8_t *)&v7, 0x16u);
    }
  }
  [(IMDLocationSharingController *)self _generateLocationSharingItemWithHandleID:v5 direction:0 action:0];
}

- (void)didStopSharingMyLocationWithHandle:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 identifier];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      id v8 = a3;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Stopped location sharing to: %@ (%@)", (uint8_t *)&v7, 0x16u);
    }
  }
  [(IMDLocationSharingController *)self _generateLocationSharingItemWithHandleID:v5 direction:0 action:1];
}

- (void)didStartAbilityToGetLocationForHandle:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 identifier];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      id v8 = a3;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Received location sharing from: %@ (%@)", (uint8_t *)&v7, 0x16u);
    }
  }
  [(IMDLocationSharingController *)self _generateLocationSharingItemWithHandleID:v5 direction:1 action:0];
}

- (void)didStopAbilityToGetLocationForHandle:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 identifier];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412546;
      id v7 = a3;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Stopped location sharing from: %@ (%@)", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)sendMappingPacket:(id)a3 toHandle:(id)a4 account:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v22) = 0;
    v17 = "sendMappingPacket: packet is nil, bailing.";
LABEL_11:
    uint64_t v18 = v16;
    uint32_t v19 = 2;
LABEL_12:
    _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v22, v19);
    return;
  }
  uint64_t v9 = +[IMDServiceController sharedController];
  uint64_t v10 = [(IMDServiceController *)v9 serviceWithName:*MEMORY[0x1E4F6E1B0]];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"1", @"fV", a3, @"offer-request", 0);
  if (!v10)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v22) = 0;
    v17 = "Missing iMessage service, cannot send Mapping packet";
    goto LABEL_11;
  }
  uint64_t v12 = v11;
  id v13 = [+[IMDAccountController sharedInstance] accountForAccountID:a5];
  if (v13)
  {
    int v14 = (void *)[v13 session];
    uint64_t v15 = [a4 identifier];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1D97D7ACC;
    v21[3] = &unk_1E6B76B58;
    v21[4] = v12;
    v21[5] = a4;
    v21[6] = self;
    v21[7] = a3;
    [v14 sendLocationSharingInfo:v12 toID:v15 completionBlock:v21];
    return;
  }
  if (IMOSLoggingEnabled())
  {
    v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = a4;
      v17 = "No active session found for mapping packet to handle: %@, bailing";
      uint64_t v18 = v20;
      uint32_t v19 = 12;
      goto LABEL_12;
    }
  }
}

- (void)didFailToHandleMappingPacket:(id)a3 error:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      id v8 = a3;
      __int16 v9 = 2112;
      id v10 = a4;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Failed to handle mapping packet %@ with error %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)receivedIncomingLocationSharePacket:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = a3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Received location share packet: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v6 = [a3 objectForKey:@"offer-request"];
  if (v6)
  {
    [(FMFSession *)self->_session receivedMappingPacket:v6 completion:&unk_1F3391980];
  }
  else if (IMOSLoggingEnabled())
  {
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Missing mapping packet...", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)_forwardMappingPacket:(id)a3 toID:(id)a4 account:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = a4;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Forwarding mapping packet to ID: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v10 = (void *)MEMORY[0x1E0169C30](@"FMFHandle", @"FMF");
  if (v10) {
    -[IMDLocationSharingController sendMappingPacket:toHandle:account:](self, "sendMappingPacket:toHandle:account:", a3, [v10 handleWithId:a4], a5);
  }
}

- (FindMyLocateSession)fmlSession
{
  return self->_fmlSession;
}

- (void)setFmlSession:(id)a3
{
}

@end