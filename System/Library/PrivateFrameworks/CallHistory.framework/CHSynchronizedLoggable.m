@interface CHSynchronizedLoggable
- (BOOL)executeSyncWithBOOL:(id)a3;
- (CHSynchronizedLoggable)initWithName:(const char *)a3;
- (CHSynchronizedLoggable)initWithName:(const char *)a3 queue:(id)a4;
- (id)executeSyncWithResult:(id)a3;
- (id)logHandle;
- (id)queue;
- (void)execute:(id)a3;
- (void)executeSync:(id)a3;
@end

@implementation CHSynchronizedLoggable

- (CHSynchronizedLoggable)initWithName:(const char *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CHSynchronizedLoggable;
  v4 = [(CHSynchronizedLoggable *)&v10 init];
  if (v4)
  {
    v5 = [[CHLogger alloc] initWithDomain:a3];
    logger = v4->_logger;
    v4->_logger = v5;

    v7 = [[CHSynchronizable alloc] initWithName:a3];
    synchronizable = v4->_synchronizable;
    v4->_synchronizable = v7;
  }
  return v4;
}

- (id)logHandle
{
  return [(CHLogger *)self->_logger logHandle];
}

- (id)executeSyncWithResult:(id)a3
{
  return [(CHSynchronizable *)self->_synchronizable executeSyncWithResult:a3];
}

- (void)executeSync:(id)a3
{
}

- (void)execute:(id)a3
{
}

- (id)queue
{
  return [(CHSynchronizable *)self->_synchronizable queue];
}

- (CHSynchronizedLoggable)initWithName:(const char *)a3 queue:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CHSynchronizedLoggable;
  v7 = [(CHSynchronizedLoggable *)&v13 init];
  if (v7)
  {
    v8 = [[CHLogger alloc] initWithDomain:a3];
    logger = v7->_logger;
    v7->_logger = v8;

    objc_super v10 = [[CHSynchronizable alloc] initWithQueue:v6];
    synchronizable = v7->_synchronizable;
    v7->_synchronizable = v10;
  }
  return v7;
}

- (BOOL)executeSyncWithBOOL:(id)a3
{
  return [(CHSynchronizable *)self->_synchronizable executeSyncWithBOOL:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizable, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end