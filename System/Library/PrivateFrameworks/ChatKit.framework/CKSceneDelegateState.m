@interface CKSceneDelegateState
+ (BOOL)supportsSecureCoding;
+ (id)stateFromIsComposingNewMessage:(BOOL)a3 messageHasContent:(BOOL)a4 isShowingBlankTranscript:(BOOL)a5 isControllerCollapsed:(BOOL)a6 isTopVCChatNavigationController:(BOOL)a7 conversation:(id)a8 filterMode:(unint64_t)a9 isShowingInbox:(BOOL)a10 unreadMessages:(id)a11;
+ (id)unarchivingClasses;
- (BOOL)composingNewMessage;
- (BOOL)showingInbox;
- (CKSceneDelegateState)init;
- (CKSceneDelegateState)initWithCoder:(id)a3;
- (CKSceneDelegateState)initWithUnreadMessages:(id)a3 groupID:(id)a4 composingNewMessage:(BOOL)a5 filterMode:(unint64_t)a6 showingInbox:(BOOL)a7;
- (NSArray)unreadLastMessages;
- (NSDate)date;
- (NSString)groupID;
- (id)description;
- (unint64_t)filterMode;
- (void)encodeWithCoder:(id)a3;
- (void)setComposingNewMessage:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setFilterMode:(unint64_t)a3;
- (void)setGroupID:(id)a3;
- (void)setShowingInbox:(BOOL)a3;
- (void)setUnreadLastMessages:(id)a3;
@end

@implementation CKSceneDelegateState

+ (id)unarchivingClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

- (CKSceneDelegateState)initWithUnreadMessages:(id)a3 groupID:(id)a4 composingNewMessage:(BOOL)a5 filterMode:(unint64_t)a6 showingInbox:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKSceneDelegateState;
  v14 = [(CKSceneDelegateState *)&v18 init];
  v15 = v14;
  if (v14)
  {
    [(CKSceneDelegateState *)v14 setUnreadLastMessages:v12];
    [(CKSceneDelegateState *)v15 setGroupID:v13];
    [(CKSceneDelegateState *)v15 setComposingNewMessage:v9];
    v16 = [MEMORY[0x1E4F1C9C8] date];
    [(CKSceneDelegateState *)v15 setDate:v16];

    [(CKSceneDelegateState *)v15 setFilterMode:a6];
    [(CKSceneDelegateState *)v15 setShowingInbox:v7];
  }

  return v15;
}

- (CKSceneDelegateState)init
{
  return [(CKSceneDelegateState *)self initWithUnreadMessages:0 groupID:0 composingNewMessage:0 filterMode:0 showingInbox:0];
}

- (CKSceneDelegateState)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKSceneDelegateState *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"unreadLastMessages"];
    [(CKSceneDelegateState *)v5 setUnreadLastMessages:v6];

    BOOL v7 = [v4 decodeObjectForKey:@"groupID"];
    [(CKSceneDelegateState *)v5 setGroupID:v7];

    -[CKSceneDelegateState setComposingNewMessage:](v5, "setComposingNewMessage:", [v4 decodeBoolForKey:@"composingNewMessage"]);
    v8 = [v4 decodeObjectForKey:@"date"];
    [(CKSceneDelegateState *)v5 setDate:v8];

    -[CKSceneDelegateState setFilterMode:](v5, "setFilterMode:", [v4 decodeIntegerForKey:@"filterMode"]);
    -[CKSceneDelegateState setShowingInbox:](v5, "setShowingInbox:", [v4 decodeBoolForKey:@"showingInbox"]);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(CKSceneDelegateState *)self unreadLastMessages];
  [v7 encodeObject:v4 forKey:@"unreadLastMessages"];

  uint64_t v5 = [(CKSceneDelegateState *)self groupID];
  [v7 encodeObject:v5 forKey:@"groupID"];

  objc_msgSend(v7, "encodeBool:forKey:", -[CKSceneDelegateState composingNewMessage](self, "composingNewMessage"), @"composingNewMessage");
  v6 = [(CKSceneDelegateState *)self date];
  [v7 encodeObject:v6 forKey:@"date"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[CKSceneDelegateState filterMode](self, "filterMode"), @"filterMode");
  objc_msgSend(v7, "encodeBool:forKey:", -[CKSceneDelegateState showingInbox](self, "showingInbox"), @"showingInbox");
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CKSceneDelegateState *)self unreadLastMessages];
  v6 = [(CKSceneDelegateState *)self groupID];
  if ([(CKSceneDelegateState *)self composingNewMessage]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  v8 = [(CKSceneDelegateState *)self date];
  [v8 timeIntervalSinceNow];
  uint64_t v10 = v9;
  v11 = CKConversationListFilterModeStringValue([(CKSceneDelegateState *)self filterMode]);
  if ([(CKSceneDelegateState *)self showingInbox]) {
    id v12 = @"YES";
  }
  else {
    id v12 = @"NO";
  }
  id v13 = [v3 stringWithFormat:@"<%@ %p unreadLastMessages: %@ groupID: %@ composingNewMessage: %@ date: %f> filterMode: %@ showingInbox: %@", v4, self, v5, v6, v7, v10, v11, v12];

  return v13;
}

+ (id)stateFromIsComposingNewMessage:(BOOL)a3 messageHasContent:(BOOL)a4 isShowingBlankTranscript:(BOOL)a5 isControllerCollapsed:(BOOL)a6 isTopVCChatNavigationController:(BOOL)a7 conversation:(id)a8 filterMode:(unint64_t)a9 isShowingInbox:(BOOL)a10 unreadMessages:(id)a11
{
  BOOL v11 = a7;
  int v12 = a6;
  BOOL v13 = a5;
  BOOL v14 = a4;
  BOOL v15 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v16 = a8;
  id v17 = a11;
  int v18 = (v11 | ~v12) & !v13;
  if (v15) {
    int v18 = v14;
  }
  v19 = @"-1";
  if (v16 && v18)
  {
    v19 = [v16 groupID];
  }
  uint64_t v20 = v15 & v14;
  if (_IMWillLog())
  {
    v21 = @"NO";
    if (v20) {
      v21 = @"YES";
    }
    v31 = v21;
    _IMAlwaysLog();
  }
  if (_IMWillLog())
  {
    v31 = v19;
    _IMAlwaysLog();
  }
  v22 = +[CKDraftManager sharedInstance];
  [v22 saveCompositionAndFlushCache:1];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v23 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  v24 = [v23 cachedChats];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "__ck_saveWatermark");
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v26);
  }

  v29 = [[CKSceneDelegateState alloc] initWithUnreadMessages:v17 groupID:v19 composingNewMessage:v20 filterMode:a9 showingInbox:a10];

  return v29;
}

- (NSArray)unreadLastMessages
{
  return self->_unreadLastMessages;
}

- (void)setUnreadLastMessages:(id)a3
{
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (BOOL)composingNewMessage
{
  return self->_composingNewMessage;
}

- (void)setComposingNewMessage:(BOOL)a3
{
  self->_composingNewMessage = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)filterMode
{
  return self->_filterMode;
}

- (void)setFilterMode:(unint64_t)a3
{
  self->_filterMode = a3;
}

- (BOOL)showingInbox
{
  return self->_showingInbox;
}

- (void)setShowingInbox:(BOOL)a3
{
  self->_showingInbox = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_groupID, 0);

  objc_storeStrong((id *)&self->_unreadLastMessages, 0);
}

@end