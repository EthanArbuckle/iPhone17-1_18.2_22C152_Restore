@interface CLSDarwinNotification
- (CLSDarwinNotification)initWithObserver:(id)a3 name:(id)a4 block:(id)a5;
- (NSDictionary)userInfo;
- (NSObject)observer;
- (NSString)name;
- (id)block;
@end

@implementation CLSDarwinNotification

- (CLSDarwinNotification)initWithObserver:(id)a3 name:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CLSDarwinNotification;
  v11 = [(CLSDarwinNotification *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_observer, v8);
    uint64_t v15 = objc_msgSend_copy(v9, v13, v14);
    name = v12->_name;
    v12->_name = (NSString *)v15;

    uint64_t v17 = MEMORY[0x1E01A05F0](v10);
    id block = v12->_block;
    v12->_id block = (id)v17;
  }
  return v12;
}

- (NSObject)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return WeakRetained;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (id)block
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_destroyWeak((id *)&self->_observer);
}

@end