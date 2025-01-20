@interface IDSRestoreMonitor
+ (IDSRestoreMonitor)sharedInstance;
- (BOOL)hasActionForTarget:(id)a3;
- (IDSRestoreMonitor)initWithTimerBlock:(id)a3;
- (IMTimer)restoreTimer;
- (NSMapTable)actionByTarget;
- (id)timerBlock;
- (void)_timerFired;
- (void)_timerFiredOnMain;
- (void)addTarget:(id)a3 actionBlock:(id)a4;
- (void)removeTarget:(id)a3;
- (void)setActionByTarget:(id)a3;
- (void)setRestoreTimer:(id)a3;
- (void)setTimerBlock:(id)a3;
@end

@implementation IDSRestoreMonitor

+ (IDSRestoreMonitor)sharedInstance
{
  if (qword_100A4C9A0 != -1) {
    dispatch_once(&qword_100A4C9A0, &stru_10098C680);
  }
  v2 = (void *)qword_100A4C998;

  return (IDSRestoreMonitor *)v2;
}

- (IDSRestoreMonitor)initWithTimerBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)IDSRestoreMonitor;
    v5 = [(IDSRestoreMonitor *)&v10 init];
    if (v5)
    {
      id v6 = [v4 copy];
      id timerBlock = v5->_timerBlock;
      v5->_id timerBlock = v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)hasActionForTarget:(id)a3
{
  v3 = [(NSMapTable *)self->_actionByTarget objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)addTarget:(id)a3 actionBlock:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  actionByTarget = self->_actionByTarget;
  if (!actionByTarget)
  {
    v8 = +[NSMapTable weakToStrongObjectsMapTable];
    v9 = self->_actionByTarget;
    self->_actionByTarget = v8;

    actionByTarget = self->_actionByTarget;
  }
  id v10 = objc_retainBlock(v6);
  [(NSMapTable *)actionByTarget setObject:v10 forKey:v13];

  if (!self->_restoreTimer)
  {
    (*((void (**)(void))self->_timerBlock + 2))();
    v11 = (IMTimer *)objc_claimAutoreleasedReturnValue();
    restoreTimer = self->_restoreTimer;
    self->_restoreTimer = v11;
  }
}

- (void)removeTarget:(id)a3
{
  [(NSMapTable *)self->_actionByTarget removeObjectForKey:a3];
  if (![(NSMapTable *)self->_actionByTarget count])
  {
    actionByTarget = self->_actionByTarget;
    self->_actionByTarget = 0;

    [(IMTimer *)self->_restoreTimer invalidate];
    restoreTimer = self->_restoreTimer;
    self->_restoreTimer = 0;
  }
}

- (void)_timerFired
{
  id v3 = [(NSMapTable *)self->_actionByTarget copy];
  actionByTarget = self->_actionByTarget;
  self->_actionByTarget = 0;

  [(IMTimer *)self->_restoreTimer invalidate];
  restoreTimer = self->_restoreTimer;
  self->_restoreTimer = 0;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v11, (void)v13);
        v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        v12[2](v12, v11);
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)_timerFiredOnMain
{
  id v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003EEDF4;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (id)timerBlock
{
  return self->_timerBlock;
}

- (void)setTimerBlock:(id)a3
{
}

- (IMTimer)restoreTimer
{
  return self->_restoreTimer;
}

- (void)setRestoreTimer:(id)a3
{
}

- (NSMapTable)actionByTarget
{
  return self->_actionByTarget;
}

- (void)setActionByTarget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionByTarget, 0);
  objc_storeStrong((id *)&self->_restoreTimer, 0);

  objc_storeStrong(&self->_timerBlock, 0);
}

@end