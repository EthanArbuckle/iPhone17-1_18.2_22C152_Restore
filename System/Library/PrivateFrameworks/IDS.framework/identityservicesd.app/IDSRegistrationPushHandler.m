@interface IDSRegistrationPushHandler
+ (id)commandToHandlerBlock;
- (BOOL)registered;
- (NSData)pushToken;
- (id)_pushTopics;
- (id)copyHandlersForEnumerating;
- (void)_acceptIncomingPushes;
- (void)_ignoreIncomingPushes;
- (void)_updateListenerIfNeeded;
- (void)addListener:(id)a3;
- (void)dealloc;
- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7;
- (void)handler:(id)a3 pushTokenChanged:(id)a4;
- (void)removeListener:(id)a3;
- (void)setRegistered:(BOOL)a3;
@end

@implementation IDSRegistrationPushHandler

+ (id)commandToHandlerBlock
{
  if (qword_100A4C530 != -1) {
    dispatch_once(&qword_100A4C530, &stru_100987C48);
  }
  v2 = (void *)qword_100A4C528;

  return v2;
}

- (void)dealloc
{
  v3 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)IDSRegistrationPushHandler;
  [(IDSRegistrationPushHandler *)&v4 dealloc];
}

- (NSData)pushToken
{
  if (self->_registeredForPush)
  {
    v2 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
    v3 = [v2 pushToken];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (void)_updateListenerIfNeeded
{
  if (self->_registeredForPush)
  {
    BOOL isListening = self->_isListening;
    v5 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
    v6 = [(IDSRegistrationPushHandler *)self _pushTopics];
    v7 = +[NSSet setWithArray:v6];
    if (isListening)
    {
      [v5 setTopics:v7 forListener:self];
    }
    else
    {
      v8 = [(id)objc_opt_class() commandToHandlerBlock];
      v9 = [v8 allKeys];
      v10 = +[NSSet setWithArray:v9];
      v11 = im_primary_queue();
      [v5 addListener:self topics:v7 commands:v10 queue:v11];

      self->_BOOL isListening = 1;
    }
  }
}

- (void)_acceptIncomingPushes
{
  if (!self->_registeredForPush)
  {
    self->_registeredForPush = 1;
    v3 = +[IMRGLog registration];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "IDSRegistrationPushHandler - Accepting incoming pushes", v4, 2u);
    }

    [(IDSRegistrationPushHandler *)self _updateListenerIfNeeded];
  }
}

- (void)_ignoreIncomingPushes
{
  if (self->_registeredForPush)
  {
    self->_registeredForPush = 0;
    v3 = +[IMRGLog registration];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "IDSRegistrationPushHandler - No longer accepting incoming pushes", v6, 2u);
    }

    v5 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
    [v5 removeListener:self];

    self->_BOOL isListening = 0;
  }
}

- (void)setRegistered:(BOOL)a3
{
  if (a3) {
    [(IDSRegistrationPushHandler *)self _acceptIncomingPushes];
  }
  else {
    [(IDSRegistrationPushHandler *)self _ignoreIncomingPushes];
  }
}

- (BOOL)registered
{
  return self->_registeredForPush;
}

- (id)_pushTopics
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  IMGetIDSSettings();
  id v3 = 0;
  if ([v3 count]) {
    [v2 addObjectsFromArray:v3];
  }

  return v2;
}

- (id)copyHandlersForEnumerating
{
  return [(NSMutableArray *)self->_handlers _copyForEnumerating];
}

- (void)addListener:(id)a3
{
  id v7 = a3;
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_handlers, "containsObjectIdenticalTo:") & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      v5 = +[NSMutableArray nonRetainingArray];
      v6 = self->_handlers;
      self->_handlers = v5;

      handlers = self->_handlers;
    }
    [(NSMutableArray *)handlers addObject:v7];
  }
}

- (void)removeListener:(id)a3
{
  [(NSMutableArray *)self->_handlers removeObjectIdenticalTo:a3];
  if (![(NSMutableArray *)self->_handlers count])
  {
    handlers = self->_handlers;
    self->_handlers = 0;
  }
}

- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  id v12 = a4;
  uint64_t v8 = objc_opt_class();
  v9 = sub_1002AA560(v8, v12, @"c");
  if (v9)
  {
    v10 = [(id)objc_opt_class() commandToHandlerBlock];
    v11 = [v10 objectForKey:v9];

    if (v11) {
      ((void (**)(void, IDSRegistrationPushHandler *, id))v11)[2](v11, self, v12);
    }
  }
}

- (void)handler:(id)a3 pushTokenChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector()) {
          [v13 handler:self pushTokenChanged:v7];
        }
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void).cxx_destruct
{
}

@end