@interface CSAttendingUsecaseManager
- (CSAttendingUsecaseManager)init;
- (NSHashTable)activeUsecases;
- (NSHashTable)idleUsecases;
- (OS_dispatch_queue)queue;
- (id)usecaseForType:(int64_t)a3;
- (void)_cleanupUsecases:(id)a3;
- (void)setActiveUsecases:(id)a3;
- (void)setIdleUsecases:(id)a3;
- (void)setQueue:(id)a3;
- (void)startAttending:(id)a3 options:(id)a4 completion:(id)a5;
- (void)stopAttending:(id)a3 reason:(int64_t)a4;
@end

@implementation CSAttendingUsecaseManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeUsecases, 0);
  objc_storeStrong((id *)&self->_idleUsecases, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setActiveUsecases:(id)a3
{
}

- (NSHashTable)activeUsecases
{
  return self->_activeUsecases;
}

- (void)setIdleUsecases:(id)a3
{
}

- (NSHashTable)idleUsecases
{
  return self->_idleUsecases;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_cleanupUsecases:(id)a3
{
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v4) {
    goto LABEL_11;
  }
  id v5 = v4;
  int v6 = 0;
  uint64_t v7 = *(void *)v10;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v10 != v7) {
        objc_enumerationMutation(v3);
      }
      if (*(void *)(*((void *)&v9 + 1) + 8 * i)) {
        ++v6;
      }
    }
    id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v5);
  if (!v6) {
LABEL_11:
  }
    [v3 removeAllObjects];
}

- (void)stopAttending:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  int v6 = [(CSAttendingUsecaseManager *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000725D8;
  v8[3] = &unk_100253B08;
  id v9 = v5;
  long long v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)startAttending:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100072800;
  v15[3] = &unk_100253100;
  id v8 = a5;
  id v16 = v8;
  id v9 = objc_retainBlock(v15);
  long long v10 = v9;
  if (v7)
  {
    long long v11 = [(CSAttendingUsecaseManager *)self queue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100072818;
    v12[3] = &unk_100253280;
    v12[4] = self;
    id v13 = v7;
    id v14 = v10;
    dispatch_async(v11, v12);
  }
  else
  {
    ((void (*)(void *, void, void))v9[2])(v9, 0, 0);
  }
}

- (id)usecaseForType:(int64_t)a3
{
  id v4 = +[CSAttendingUsecaseFactory attendingUseCaseByAttendingType:a3];
  if (v4)
  {
    id v5 = [(CSAttendingUsecaseManager *)self queue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100072A40;
    v7[3] = &unk_100253B08;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  return v4;
}

- (CSAttendingUsecaseManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSAttendingUsecaseManager;
  v2 = [(CSAttendingUsecaseManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[CSUtils getSerialQueue:@"CSAttendingUsecaseManager Queue" qualityOfService:33];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSHashTable weakObjectsHashTable];
    idleUsecases = v2->_idleUsecases;
    v2->_idleUsecases = (NSHashTable *)v5;

    uint64_t v7 = +[NSHashTable weakObjectsHashTable];
    activeUsecases = v2->_activeUsecases;
    v2->_activeUsecases = (NSHashTable *)v7;
  }
  return v2;
}

@end