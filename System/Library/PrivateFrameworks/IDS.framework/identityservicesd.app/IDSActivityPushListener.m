@interface IDSActivityPushListener
- (BOOL)downgradeOnLock;
- (BOOL)listening;
- (BOOL)shouldListen;
- (IDSActivityPushListener)initWithQueue:(id)a3 shouldDowngradeOnLock:(BOOL)a4;
- (IDSActivityPushListenerDelegate)delegate;
- (IDSPushHandler)persistentEnrollmentHandler;
- (IDSPushHandler)pushHandler;
- (IMSystemMonitor)systemMonitor;
- (NSSet)topicsToListenOn;
- (OS_dispatch_queue)queue;
- (id)_nonWakingTopics;
- (id)_opportunisticTopics;
- (void)_configurePushHandler:(BOOL)a3;
- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setDowngradeOnLock:(BOOL)a3;
- (void)setListening:(BOOL)a3;
- (void)setPersistentEnrollmentHandler:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setShouldListen:(BOOL)a3;
- (void)setSystemMonitor:(id)a3;
- (void)setTopicsToListenOn:(id)a3;
- (void)systemDidLock;
- (void)systemDidUnlock;
@end

@implementation IDSActivityPushListener

- (IDSActivityPushListener)initWithQueue:(id)a3 shouldDowngradeOnLock:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSActivityPushListener;
  v8 = [(IDSActivityPushListener *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    uint64_t v10 = +[IDSPushHandler sharedInstance];
    pushHandler = v9->_pushHandler;
    v9->_pushHandler = (IDSPushHandler *)v10;

    uint64_t v12 = +[NSSet set];
    topicsToListenOn = v9->_topicsToListenOn;
    v9->_topicsToListenOn = (NSSet *)v12;

    v9->_downgradeOnLock = v4;
    if (v4)
    {
      uint64_t v14 = +[IMSystemMonitor sharedInstance];
      systemMonitor = v9->_systemMonitor;
      v9->_systemMonitor = (IMSystemMonitor *)v14;

      [(IMSystemMonitor *)v9->_systemMonitor addListener:v9];
    }
  }

  return v9;
}

- (void)setTopicsToListenOn:(id)a3
{
  v5 = (NSSet *)a3;
  topicsToListenOn = self->_topicsToListenOn;
  if (topicsToListenOn != v5
    && (!v5 || !topicsToListenOn || ![(NSSet *)topicsToListenOn isEqualToSet:v5]))
  {
    objc_storeStrong((id *)&self->_topicsToListenOn, a3);
    [(IDSActivityPushListener *)self _configurePushHandler:0];
  }

  _objc_release_x1();
}

- (void)setShouldListen:(BOOL)a3
{
  if (self->_shouldListen != a3)
  {
    self->_shouldListen = a3;
    [(IDSActivityPushListener *)self _configurePushHandler:0];
  }
}

- (void)_configurePushHandler:(BOOL)a3
{
  BOOL v4 = self->_listening && !a3;
  if (v4 || !self->_shouldListen)
  {
    if ([(NSSet *)self->_topicsToListenOn count] && self->_shouldListen)
    {
      pushHandler = self->_pushHandler;
      id v11 = [(IDSActivityPushListener *)self _opportunisticTopics];
      uint64_t v10 = [(IDSActivityPushListener *)self _nonWakingTopics];
      [(IDSPushHandler *)pushHandler setWakingTopics:0 opportunisticTopics:v11 nonWakingTopics:v10 forListener:self];
    }
    else
    {
      [(IDSPushHandler *)self->_pushHandler removeListener:self];
      self->_listening = 0;
    }
  }
  else if ([(NSSet *)self->_topicsToListenOn count])
  {
    v5 = self->_pushHandler;
    v6 = [(IDSActivityPushListener *)self _opportunisticTopics];
    id v7 = [(IDSActivityPushListener *)self _nonWakingTopics];
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1009D16C8, 0);
    [(IDSPushHandler *)v5 addListener:self wakingTopics:0 opportunisticTopics:v6 nonWakingTopics:v7 commands:v8 queue:self->_queue];

    self->_listening = 1;
  }
}

- (id)_opportunisticTopics
{
  if (self->_downgradeOnLock
    && ([(IMSystemMonitor *)self->_systemMonitor isSystemLocked] & 1) != 0)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(NSSet *)self->_topicsToListenOn copy];
  }

  return v3;
}

- (id)_nonWakingTopics
{
  if (self->_downgradeOnLock && [(IMSystemMonitor *)self->_systemMonitor isSystemLocked]) {
    id v3 = [(NSSet *)self->_topicsToListenOn copy];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)systemDidLock
{
}

- (void)systemDidUnlock
{
}

- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 _numberForKey:@"c"];
  id v12 = [v11 integerValue];

  if (v12 == (id)223)
  {
    v13 = [(IDSActivityPushListener *)self delegate];

    if (v13)
    {
      uint64_t v14 = +[IMRGLog registration];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        id v23 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received update message: %@", (uint8_t *)&v22, 0xCu);
      }

      v15 = objc_alloc_init(IDSActivityUpdatePush);
      [(IDSActivityUpdatePush *)v15 setActivityTopic:v10];
      v16 = [v9 _numberForKey:@"pS"];
      -[IDSActivityUpdatePush setActivityStatus:](v15, "setActivityStatus:", [v16 BOOLValue]);

      objc_super v17 = [v9 _dataForKey:@"pT"];
      [(IDSActivityUpdatePush *)v15 setToken:v17];

      v18 = [v9 _dataForKey:@"pAM"];
      [(IDSActivityUpdatePush *)v15 setMetadataBlob:v18];

      v19 = [v9 _numberForKey:@"pTs"];
      -[IDSActivityUpdatePush setActivityTimestamp:](v15, "setActivityTimestamp:", [v19 integerValue]);

      v20 = [v9 _stringForKey:@"pSa"];
      [(IDSActivityUpdatePush *)v15 setActivitySubActivity:v20];

      v21 = [(IDSActivityPushListener *)self delegate];
      [v21 pushListener:self receivedUpdatePush:v15];
    }
  }
}

- (BOOL)shouldListen
{
  return self->_shouldListen;
}

- (NSSet)topicsToListenOn
{
  return self->_topicsToListenOn;
}

- (IDSActivityPushListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSActivityPushListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (IDSPushHandler)persistentEnrollmentHandler
{
  return self->_persistentEnrollmentHandler;
}

- (void)setPersistentEnrollmentHandler:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)listening
{
  return self->_listening;
}

- (void)setListening:(BOOL)a3
{
  self->_listening = a3;
}

- (BOOL)downgradeOnLock
{
  return self->_downgradeOnLock;
}

- (void)setDowngradeOnLock:(BOOL)a3
{
  self->_downgradeOnLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_persistentEnrollmentHandler, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_topicsToListenOn, 0);
}

@end