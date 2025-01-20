@interface ActivityTracker
- (ActivityTracker)initWithDescription:(id)a3;
- (id)activityUpdateBlock;
- (void)setActive:(BOOL)a3;
- (void)setActivityUpdateBlock:(id)a3;
@end

@implementation ActivityTracker

- (ActivityTracker)initWithDescription:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ActivityTracker;
  v5 = [(ActivityTracker *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [NSString stringWithString:v4];
    description = v5->_description;
    v5->_description = (NSString *)v6;

    transaction = v5->_transaction;
    v5->_transaction = 0;
  }
  return v5;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  transaction = obj->_transaction;
  if (v3)
  {
    if (!transaction)
    {
      [(NSString *)obj->_description UTF8String];
      uint64_t v5 = os_transaction_create();
      uint64_t v6 = obj->_transaction;
      obj->_transaction = (OS_os_transaction *)v5;

      activityUpdateBlock = (void (**)(id, uint64_t))obj->_activityUpdateBlock;
      if (activityUpdateBlock) {
        activityUpdateBlock[2](activityUpdateBlock, 1);
      }
    }
  }
  else if (transaction)
  {
    v8 = obj;
    v9 = (void (**)(id, void))obj->_activityUpdateBlock;
    if (v9)
    {
      v9[2](v9, 0);
      v8 = obj;
      transaction = obj->_transaction;
    }
    v8->_transaction = 0;
  }
  objc_sync_exit(obj);
}

- (id)activityUpdateBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setActivityUpdateBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityUpdateBlock, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end