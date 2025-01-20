@interface IDSEncryptionQueueManager
- (IDSEncryptionQueue)defaultQueue;
- (IDSEncryptionQueue)syncQueue;
- (IDSEncryptionQueue)urgentQueue;
- (IDSEncryptionQueueManager)init;
- (id)_queueForPriority:(int64_t)a3;
- (id)asyncQueueForPriority:(int64_t)a3;
- (id)syncQueueForPriority:(int64_t)a3;
- (void)setDefaultQueue:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)setUrgentQueue:(id)a3;
@end

@implementation IDSEncryptionQueueManager

- (IDSEncryptionQueueManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)IDSEncryptionQueueManager;
  v2 = [(IDSEncryptionQueueManager *)&v10 init];
  if (v2)
  {
    v3 = [[IDSEncryptionQueue alloc] initWithName:"_IDSEncryptionQueueSync" qosClass:17 specific:"_MessageEncryptionContextSync"];
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = v3;

    v5 = [[IDSEncryptionQueue alloc] initWithName:"_IDSEncryptionQueueDefault" qosClass:21 specific:"_MessageEncryptionContextDefault"];
    defaultQueue = v2->_defaultQueue;
    v2->_defaultQueue = v5;

    v7 = [[IDSEncryptionQueue alloc] initWithName:"_IDSEncryptionQueueUrgent" qosClass:25 specific:"_MessageEncryptionContextUrgent"];
    urgentQueue = v2->_urgentQueue;
    v2->_urgentQueue = v7;
  }
  return v2;
}

- (id)asyncQueueForPriority:(int64_t)a3
{
  return [(IDSEncryptionQueueManager *)self _queueForPriority:a3];
}

- (id)syncQueueForPriority:(int64_t)a3
{
  return [(IDSEncryptionQueueManager *)self _queueForPriority:a3];
}

- (id)_queueForPriority:(int64_t)a3
{
  uint64_t v3 = 16;
  if (a3 == 100) {
    uint64_t v3 = 8;
  }
  if (a3 == 300) {
    uint64_t v3 = 24;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (IDSEncryptionQueue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (IDSEncryptionQueue)defaultQueue
{
  return self->_defaultQueue;
}

- (void)setDefaultQueue:(id)a3
{
}

- (IDSEncryptionQueue)urgentQueue
{
  return self->_urgentQueue;
}

- (void)setUrgentQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urgentQueue, 0);
  objc_storeStrong((id *)&self->_defaultQueue, 0);

  objc_storeStrong((id *)&self->_syncQueue, 0);
}

@end