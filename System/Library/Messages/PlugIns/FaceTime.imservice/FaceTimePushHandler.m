@interface FaceTimePushHandler
+ (id)commandToHandlerBlock;
- (BOOL)registered;
- (FaceTimePushHandler)initWithTopics:(id)a3;
- (NSData)pushToken;
- (id)_pushTopics;
- (id)copyHandlersForEnumerating;
- (void)_acceptIncomingPushes;
- (void)_ignoreIncomingPushes;
- (void)_updateListenerIfNeeded;
- (void)addListener:(id)a3;
- (void)configureAsMacNotificationCenterObserver:(id)a3;
- (void)dealloc;
- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7;
- (void)removeListener:(id)a3;
- (void)setRegistered:(BOOL)a3;
@end

@implementation FaceTimePushHandler

- (void)setRegistered:(BOOL)a3
{
  if (a3) {
    MEMORY[0x270F9A6D0](self, sel__acceptIncomingPushes);
  }
  else {
    MEMORY[0x270F9A6D0](self, sel__ignoreIncomingPushes);
  }
}

- (void)_ignoreIncomingPushes
{
  if (self->_registeredForPush)
  {
    self->_registeredForPush = 0;
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_2378DA000, v3, OS_LOG_TYPE_INFO, "No longer accepting incoming pushes", v5, 2u);
      }
    }
    v4 = (void *)MEMORY[0x237E24D80]();
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A0A0], "sharedInstance"), "removeListener:", self);
    self->_isListening = 0;
  }
}

+ (id)commandToHandlerBlock
{
  if (qword_26AC13550 != -1) {
    dispatch_once(&qword_26AC13550, &unk_26EA8B850);
  }
  return (id)qword_26AC13548;
}

- (FaceTimePushHandler)initWithTopics:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FaceTimePushHandler;
  v4 = [(FaceTimePushHandler *)&v6 init];
  if (v4) {
    v4->_topics = (NSArray *)a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A0A0], "sharedInstance"), "removeListener:", self);

  v3.receiver = self;
  v3.super_class = (Class)FaceTimePushHandler;
  [(FaceTimePushHandler *)&v3 dealloc];
}

- (NSData)pushToken
{
  if (!self->_registeredForPush) {
    return 0;
  }
  v2 = (void *)[MEMORY[0x263F4A0A0] sharedInstance];

  return (NSData *)[v2 pushToken];
}

- (void)_updateListenerIfNeeded
{
  if (self->_registeredForPush)
  {
    objc_super v3 = (void *)MEMORY[0x237E24D80]();
    id v4 = [(FaceTimePushHandler *)self _pushTopics];
    v5 = v4;
    if (self->_isListening || ![v4 count])
    {
      objc_super v6 = (void *)[MEMORY[0x263F4A0A0] sharedInstance];
      if ([v5 count]) {
        uint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:v5];
      }
      else {
        uint64_t v7 = [MEMORY[0x263EFFA08] set];
      }
      [v6 setTopics:v7 forListener:self];
    }
    else
    {
      v8 = (void *)[MEMORY[0x263F4A0A0] sharedInstance];
      uint64_t v9 = [MEMORY[0x263EFFA08] setWithArray:v5];
      objc_msgSend(v8, "addListener:topics:commands:queue:", self, v9, objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "commandToHandlerBlock"), "allKeys")), MEMORY[0x263EF83A0]);
      self->_isListening = 1;
    }
  }
}

- (void)_acceptIncomingPushes
{
  if (!self->_registeredForPush)
  {
    self->_registeredForPush = 1;
    if (IMOSLoggingEnabled())
    {
      objc_super v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_2378DA000, v3, OS_LOG_TYPE_INFO, "Accepting incoming pushes", v4, 2u);
      }
    }
    [(FaceTimePushHandler *)self _updateListenerIfNeeded];
  }
}

- (BOOL)registered
{
  return self->_registeredForPush;
}

- (void)configureAsMacNotificationCenterObserver:(id)a3
{
  id v4 = (void *)[MEMORY[0x263F4A0A0] sharedInstance];

  [v4 configureAsMacNotificationCenterObserver:a3];
}

- (id)_pushTopics
{
  return self->_topics;
}

- (id)copyHandlersForEnumerating
{
  return (id)MEMORY[0x270F9A6D0](self->_handlers, sel__copyForEnumerating);
}

- (void)addListener:(id)a3
{
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_handlers, "containsObjectIdenticalTo:") & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      handlers = (NSMutableArray *)(id)[MEMORY[0x263EFF980] nonRetainingArray];
      self->_handlers = handlers;
    }
    [(NSMutableArray *)handlers addObject:a3];
  }
}

- (void)removeListener:(id)a3
{
  if (![(NSMutableArray *)self->_handlers count])
  {

    self->_handlers = 0;
  }
}

- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v8 = [a4 objectForKey:@"c"];
  if (v8)
  {
    uint64_t v9 = v8;
    v10 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
    if (objc_msgSend((id)objc_msgSend(v10, "objectForKey:inDomain:", @"LDMGlobalEnabled", *MEMORY[0x263F08100]), "BOOLValue"))
    {
      v11 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = a4;
        _os_log_impl(&dword_2378DA000, v11, OS_LOG_TYPE_DEFAULT, "dropping push message: %@ for IMAV because lockdown mode is enabled", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog()) {
          MarcoLog();
        }
        if (IMShouldLog()) {
          IMLogString();
        }
      }
    }
    else
    {
      uint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "commandToHandlerBlock"), "objectForKey:", v9);
      if (v12)
      {
        v13 = *(void (**)(void))(v12 + 16);
        v13();
      }
    }
  }
}

@end